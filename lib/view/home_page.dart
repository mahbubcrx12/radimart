import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:radimart_rdtl/controller/service/homepage_service.dart';
import 'package:radimart_rdtl/model/home_page_model.dart';

class HomePage extends StatefulWidget {
   HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  ScrollController _scrollController = ScrollController();

  _scrollToBottom() {
    _scrollController.jumpTo(_scrollController.position.maxScrollExtent);
  }
   //home page api called data storing
   List<HomePageModel> homepageData=[];

 @override
  void didChangeDependencies()async {
    // TODO: implement didChangeDependencies
   homepageData=await fetchHomepage();
   setState(() {});
   super.didChangeDependencies();
  }
  @override
  Widget build(BuildContext context) {
   var size=MediaQuery.of(context).size;
   WidgetsBinding.instance.addPostFrameCallback((_) => _scrollToBottom());
   return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Image.asset("asset/logo.png"),
        centerTitle: true,
      ),
      body: Container(
        height: size.height,
        width: size.width,
        decoration: BoxDecoration(
            color: Colors.white
        ),
        child: ListView.builder(
            shrinkWrap: true,
            itemCount: 1,
            itemBuilder:(context,index){
              var sliderContent=homepageData[0].content;
              var categoryContent=homepageData[1].content;
              var shopsContent=homepageData[2].content;
              var popularContent=homepageData[3].content;

              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: size.height*.35,
                      child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          controller: _scrollController,
                          reverse: true,
                          shrinkWrap: true,
                          itemCount: sliderContent!.length,
                          itemBuilder: (context,index){
                            return Image.network("${sliderContent[index].imgUrl}",
                              //height: size.height*.35,
                              width: size.width,
                              fit: BoxFit.fill,
                            );
                          }),
                    ),
                    SizedBox(height: 10,),
                    Text("Categories",style: TextStyle(
                      fontSize: 25,
                      color: Colors.black,
                      fontWeight: FontWeight.bold
                    ),),
                   // SizedBox(height: 8,),
                    Container(
                      height: size.height*.15,
                      child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          shrinkWrap: true,
                          itemCount: categoryContent!.length,
                          itemBuilder: (context,index){
                            return Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 6),
                              child: CircleAvatar(
                                radius: 36,
                                backgroundColor: Colors.black,
                                child: CircleAvatar(
                                  backgroundImage: NetworkImage("${categoryContent[index].icon}"),

                                  radius: 35,
                                ),
                              ),
                            );
                          }),
                    ),
                    Text("Shops",style: TextStyle(
                        fontSize: 25,
                        color: Colors.black,
                        fontWeight: FontWeight.bold
                    ),),
                    Container(
                      height: size.height*.40,
                      width: double.infinity,
                      child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          shrinkWrap: true,
                          itemCount: shopsContent!.length,
                          itemBuilder: (context,index){
                            return Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 8),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                               children: [
                                 // Text("${shopsContent[index].slug}"),
                                 ClipRRect(
                                   child: shopsContent[index].logo==null
                                       ? Image.network("https://1080motion.com/wp-content/uploads/2018/06/NoImageFound.jpg.png",
                                     height: size.height*.35,
                                     width: size.width*.3,
                                     fit: BoxFit.fill,
                                   )
                                   :Image.network("${shopsContent[index].logo}",
                                     height: size.height*.35,
                                     width: size.width*.3,
                                     fit: BoxFit.fill,
                                   ),
                                   borderRadius: BorderRadius.circular(12),
                                 ),
                                 Text("${shopsContent[index].shopName}",style: TextStyle(
                                   fontSize: 20,
                                   fontWeight: FontWeight.w400
                                 ),)
                               ],
                              ),
                            );
                          }),
                    ),
                    Text("Popular",style: TextStyle(
                        fontSize: 25,
                        color: Colors.black,
                        fontWeight: FontWeight.bold
                    ),),
                    Container(
                      height: size.height*.7,
                      width: double.infinity,
                      child:GridView.builder(
                        scrollDirection: Axis.horizontal,
                          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                          ),
                          itemCount: popularContent!.length,
                          itemBuilder: (context,index){
                            return Padding(
                              padding: const EdgeInsets.all(2.0),
                              child: Container(
height: size.height,
                                child: Column(children: [
                                  ClipRRect(
                                    child: popularContent[index].imgUrl==null
                                        ? Image.network("https://1080motion.com/wp-content/uploads/2018/06/NoImageFound.jpg.png",
                                      height: size.height*.25,
                                      width: size.width*.3,
                                      fit: BoxFit.fitWidth,
                                    )
                                        :Image.network("${popularContent[index].imageUrl}",
                                      height: size.height*.20,
                                      width: size.width*.25,
                                      fit: BoxFit.fill,
                                    ),
                                    borderRadius: BorderRadius.circular(12),
                                  ),

                                  Text("${popularContent[index].title}",style: TextStyle(
                                    fontSize: 18,
                                    color: Colors.black
                                  ),),
                                  Text("${popularContent[index].discountText}",style: TextStyle(
                                      fontSize: 12,
                                      color: Colors.red
                                  ),)
                                ],),
                              ),
                            );
                          }
                      )
                    )
                  ],
                ),
              );
            }),
      ),
    );
  }
}
