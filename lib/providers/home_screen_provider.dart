import 'dart:convert';

import 'package:ecommerce_app/con_values.dart';
import 'package:ecommerce_app/models/bannerimages.dart';
import 'package:ecommerce_app/models/categories.dart';
import 'package:ecommerce_app/models/shop.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

class HomeScreenProvider extends ChangeNotifier {
  List<BannerImages> bannerImages = [];
  List<Categories> categoriesList = [];
  List<Shop> shopList = [];
  int indexSelected = -1;

  getBannerImages() async {
    final response =
        await http.get(Uri.parse("${ConsValue.URL}getbannerimages.php"));
    if (response.statusCode == 200) {
      var jsonBody = jsonDecode(response.body);
      var Images = jsonBody['Images'];
      for (Map i in Images) {
        bannerImages.add(BannerImages(i['Id'], i['ImageURL']));
      }
      notifyListeners();
    }
  }

  getCategories() async {
    final response =
        await http.get(Uri.parse("${ConsValue.URL}GetCategories.php"));
    if (response.statusCode == 200) {
      var jsonBody = jsonDecode(response.body);
      var categories = jsonBody['categories'];
      for (Map i in categories) {
        categoriesList.add(Categories(i['Id'], i['Name'], i['ImageUrl']));
      }
      indexSelected = 0;
      getShop();
      notifyListeners();
    }
  }

  getShop() async {
    shopList = [];
    final response = await http.post(Uri.parse("${ConsValue.URL}getshopes.php"),
        body: {'Id_categories': categoriesList[indexSelected].Id});
    if (response.statusCode == 200) {
      var jsonBody = jsonDecode(response.body);
      var shopes = jsonBody['shopes'];
      for (Map i in shopes) {
        shopList.add(Shop(i['Name'], i['Image'], i['Id']));
      }
      notifyListeners();
    }
  }
}
