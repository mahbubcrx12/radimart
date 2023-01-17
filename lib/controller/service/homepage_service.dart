import 'dart:convert';

import 'package:radimart_rdtl/model/home_page_model.dart';
import 'package:http/http.dart' as http;

Future<List<HomePageModel>> fetchHomepage() async {
  List<HomePageModel> homepageData = [];
  try {
    var link = "http://public.radimart.com/api/v1/homepage";
    var response =
    await http.get(Uri.parse(link),);

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);

      HomePageModel homepageModel;
      for (var i in data) {
        homepageModel = HomePageModel.fromJson(i);
        homepageData.add(homepageModel);
      }
      print("cccccccccccccccccccccccccccccc}");
      print(homepageData);
      return homepageData;
    } else {
      return homepageData;
    }
  } catch (e) {
    print("Errrrrrr $e");
    return homepageData;
  }
}