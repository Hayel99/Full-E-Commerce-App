import 'package:ecommerce_app/models/shop.dart';
import 'package:ecommerce_app/providers/home_screen_provider.dart';
import 'package:ecommerce_app/views/all_categories.dart';
import 'package:ecommerce_app/views/category_collection.dart';
import 'package:ecommerce_app/views/orders_history.dart';
import 'package:ecommerce_app/views/profile_screen.dart';
import 'package:ecommerce_app/views/shop_items.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/bannerimages.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    Provider.of<HomeScreenProvider>(context, listen: false).getBannerImages();
    Provider.of<HomeScreenProvider>(context, listen: false).getCategories();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                PopupMenuButton<String>(
                  onSelected: (value) {
                    if (value == 'Profile') {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const ProfileScreen()));
                    } else {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const OrdersHistory()));
                    }
                  },
                  itemBuilder: (BuildContext context) {
                    return {'Profile', 'Order history'}.map((String choice) {
                      return PopupMenuItem<String>(
                        value: choice,
                        child: Text(choice),
                      );
                    }).toList();
                  },
                ),
                Consumer<HomeScreenProvider>(
                  builder: (context, value, child) {
                    return SizedBox(
                      height: 200,
                      width: MediaQuery.of(context).size.width,
                      child: ListView.builder(
                        itemCount: value.bannerImages.length,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return Container(
                            height: 200,
                            margin: const EdgeInsets.only(right: 10),
                            width: MediaQuery.of(context).size.width - 30,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              image: DecorationImage(
                                fit: BoxFit.cover,
                                image: NetworkImage(
                                    value.bannerImages[index].ImageURL),
                              ),
                            ),
                          );
                        },
                      ),
                    );
                  },
                ),
                const SizedBox(height: 20),
                Consumer<HomeScreenProvider>(
                  builder: (context, value, child) {
                    return Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              'Categories',
                              style: TextStyle(
                                  fontSize: 23, fontWeight: FontWeight.bold),
                            ),
                            TextButton(
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const AllCategories()));
                              },
                              child: const Text(
                                'See All',
                                style: TextStyle(
                                    fontSize: 12, color: Colors.purple),
                              ),
                            )
                          ],
                        ),
                        SizedBox(
                            height: 40,
                            child: ListView.builder(
                                itemCount: value.categoriesList.length,
                                scrollDirection: Axis.horizontal,
                                itemBuilder: (context, index) {
                                  return InkWell(
                                    onTap: () {
                                      setState(() {
                                        value.indexSelected = index;
                                        value.getShop();
                                      });
                                    },
                                    child: Container(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 10, horizontal: 20),
                                      alignment: Alignment.center,
                                      margin: const EdgeInsets.only(right: 10),
                                      decoration: BoxDecoration(
                                          color: value.indexSelected == index
                                              ? Colors.purple
                                              : Colors.grey.shade300,
                                          borderRadius:
                                              BorderRadius.circular(50)),
                                      child: Text(
                                          value.categoriesList[index].Name,
                                          style: TextStyle(
                                              color:
                                                  value.indexSelected == index
                                                      ? Colors.white
                                                      : Colors.black)),
                                    ),
                                  );
                                })),
                        const SizedBox(height: 20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            value.indexSelected != -1
                                ? Text(
                                    '${value.categoriesList[value.indexSelected].Name} Collections',
                                    style: const TextStyle(
                                        fontSize: 23,
                                        fontWeight: FontWeight.bold),
                                  )
                                : Text(""),
                            IconButton(
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              CategoryCollection(
                                                  categoryName: value
                                                      .categoriesList[
                                                          value.indexSelected]
                                                      .Name)));
                                },
                                icon: const Icon(
                                  Icons.arrow_forward,
                                  color: Colors.purple,
                                )),
                          ],
                        ),
                      ],
                    );
                  },
                ),
                const SizedBox(height: 15),
                Consumer<HomeScreenProvider>(
                  builder: (context, value, child) {
                    return ListView.builder(
                        shrinkWrap: true,
                        itemCount: value.shopList.length,
                        itemBuilder: (context, index) {
                          return ListTile(
                            leading: Container(
                                height: 50,
                                width: 50,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    image: DecorationImage(
                                        fit: BoxFit.cover,
                                        image: NetworkImage(
                                            value.shopList[index].Image)))),
                            title: Text(
                              value.shopList[index].Name,
                              style:
                                  const TextStyle(fontWeight: FontWeight.bold),
                            ),
                            subtitle: Text('All items'),
                            trailing: IconButton(
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => ShopItems(
                                              shopName:
                                                  value.shopList[index].Name,
                                              shopId: value.shopList[index].Id,
                                            )));
                              },
                              icon: const Icon(Icons.arrow_forward),
                            ),
                          );
                        });
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
