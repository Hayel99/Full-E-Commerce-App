import 'dart:convert';
import 'package:ecommerce_app/con_values.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import '../models/item.dart';

class ItemsScreenProvider extends ChangeNotifier {
  List<Item> list = [];

  getItems(var id) async {
    list = [];
    final response = await http.post(Uri.parse("${ConsValue.URL}GetItems.php"),
        body: {"Id_shopes": id});

    if (response.statusCode == 200) {
      var jsonBody = jsonDecode(response.body);
      var items = jsonBody['items'];
      for (Map i in items) {
        list.add(Item(
            i['Id'], i['Name'], i['Price'], i['Description'], i['ImageUrl']));
      }
      notifyListeners();
    }
  }
}
