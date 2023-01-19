import 'package:flutter/material.dart';
import 'package:radimart_rdtl/controller/service/homepage_service.dart';
import 'package:radimart_rdtl/model/home_page_model.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // ScrollController _scrollController = ScrollController();
  //
  // _scrollToBottom() {
  //   _scrollController.jumpTo(_scrollController.position.maxScrollExtent);
  // }
  //home page api called data storing

  List<HomePageModel> homepageData = [];


  // var categoryContent=Null;
  // var shopsContent=Null;
  // var popularContent=Null;

  @override
  void didChangeDependencies() async {
    print('hhhhhhhhhhhhhh');
    print(homepageData);
    print('hhhhhhhhhhhhhh');
    homepageData = await fetchHomepage();
    setState(() {

    });
    print('xxxxxxxxxxx');
    print(homepageData);
    print('xxxxxxxxxxx');
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var sliderContent = homepageData[0].content;
    var categoryContent = homepageData[1].content;
    var shopsContent = homepageData[2].content;
    var popularContent = homepageData[3].content;


    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Image.asset("asset/logo.png"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: size.height * .3,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    itemCount: sliderContent!.length,
                    itemBuilder: (context, index) {
                      return Image.network(
                        "${sliderContent![index].imgUrl}",
                        //height: size.height*.35,
                        width: size.width,
                        fit: BoxFit.fill,
                      );
                    }),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "Categories",
                style: TextStyle(
                    fontSize: 25,
                    color: Colors.black,
                    fontWeight: FontWeight.bold),
              ),
              // SizedBox(height: 8,),
              Container(
                height: size.height * .15,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    itemCount:categoryContent != null ? categoryContent.length : 0,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding:
                            const EdgeInsets.symmetric(horizontal: 6),
                        child: CircleAvatar(
                          radius: 36,
                          backgroundColor: Colors.black,
                          child: CircleAvatar(
                            backgroundImage: NetworkImage(
                                "${categoryContent![index].icon}"),
                            radius: 35,
                          ),
                        ),
                      );
                    }),
              ),
              Text(
                "Shops",
                style: TextStyle(
                    fontSize: 25,
                    color: Colors.black,
                    fontWeight: FontWeight.bold),
              ),
              Container(
                height: size.height * .40,
                width: double.infinity,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    itemCount: shopsContent != null ? shopsContent.length : 0,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding:
                            const EdgeInsets.symmetric(horizontal: 8),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // Text("${shopsContent[index].slug}"),
                            ClipRRect(
                              child: shopsContent![index].logo == null
                                  ? Image.network(
                                      "https://1080motion.com/wp-content/uploads/2018/06/NoImageFound.jpg.png",
                                      height: size.height * .35,
                                      width: size.width * .3,
                                      fit: BoxFit.fill,
                                    )
                                  : Image.network(
                                      "${shopsContent![index].logo}",
                                      height: size.height * .35,
                                      width: size.width * .3,
                                      fit: BoxFit.fill,
                                    ),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            Text(
                              "${shopsContent![index].shopName}",
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w400),
                            )
                          ],
                        ),
                      );
                    }),
              ),
              Text(
                "Popular",
                style: TextStyle(
                    fontSize: 25,
                    color: Colors.black,
                    fontWeight: FontWeight.bold),
              ),
              Container(
                   height: size.height * .7,
                   width: double.infinity,

                  child: GridView.builder(
                      scrollDirection: Axis.horizontal,
                      gridDelegate:
                          SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                      ),
                      itemCount: popularContent != null ? popularContent.length : 0,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.all(2.0),
                          child: Container(

                            child: Column(
                              children: [
                                ClipRRect(
                                  child:
                                      popularContent![index].imgUrl == null
                                          ? Image.network(
                                              "https://1080motion.com/wp-content/uploads/2018/06/NoImageFound.jpg.png",
                                             // height: size.height*.2,
                                             //   width: size.width*.5,
                                              fit: BoxFit.cover,
                                            )
                                          : Image.network(
                                              "${popularContent[index].imageUrl}",
                                              // height: size.height*.2,
                                              // width: size.width*.5,
                                              fit: BoxFit.cover,
                                            ),
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                Text(
                                  "${popularContent[index].title}",
                                  style: TextStyle(
                                      fontSize: 14, color: Colors.black),
                                  maxLines: 1,
                                ),
                                Text(
                                  "${popularContent[index].discountText}",
                                  style: TextStyle(
                                      fontSize: 12, color: Colors.red),
                                )
                              ],
                            ),
                          ),
                        );
                      }))
            ],
          ),
        ),
      )
    );
  }
}
