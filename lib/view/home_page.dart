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
   //home page api called data storing
   List<HomePageModel> homepageData=[];

 @override
  void didChangeDependencies() async{
   homepageData=await fetchHomepage();
   print("hhhhhhhhhhhhhhhhhh");
   print(homepageData);
   super.initState();
    super.didChangeDependencies();
  }
  @override
  Widget build(BuildContext context) {
   var size=MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 2,
        title: Image.asset("asset/logo.png"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(children: [
          Container(
            height: size.height,
            width: size.width,
            decoration: BoxDecoration(
                color: Colors.amber
            ),
            child: ListView.builder(
                shrinkWrap: true,
                itemCount: homepageData.length,
                itemBuilder:(context,index){
                  // var toDecode = "${homepageData[index].content}";
                  // var decodedContent = jsonDecode(toDecode);
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: 300,
                    color: Colors.black,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                      Text("${homepageData[index].sectionTitle}",
                        style: TextStyle(
                            color: Colors.white,
                          fontSize: 20
                        ),),

                        ListView.builder(
                            shrinkWrap: true,
                            itemCount: "${homepageData[index].content!.reversed}".length,
                            itemBuilder: (context,index){
                          return Container(
                            child: Text("${homepageData[index].content![index].title.toString()}",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 10
                              ),),
                          );
                        })

                    ],),
                ),
              );
            }),
          )
        ],),
      ),
    );
  }
}
