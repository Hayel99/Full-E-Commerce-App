import 'package:ecommerce_app/models/shop.dart';
import 'package:ecommerce_app/views/shop_items.dart';
import 'package:flutter/material.dart';

class CategoryCollection extends StatefulWidget {
  final String categoryName;

  const CategoryCollection({required this.categoryName, Key? key})
      : super(key: key);

  @override
  State<CategoryCollection> createState() => _CategoryCollectionState();
}

class _CategoryCollectionState extends State<CategoryCollection> {
  @override
  Widget build(BuildContext context) {
    return Scaffold();
    // return Scaffold(
    //   appBar: AppBar(
    //     backgroundColor: Colors.transparent,
    //     elevation: 0,
    //     iconTheme: const IconThemeData(color: Colors.black),
    //     title: Text('${widget.categoryName} Collection',
    //         style: const TextStyle(color: Colors.black)),
    //   ),
    //   floatingActionButton: FloatingActionButton(
    //     onPressed: () {},
    //     child: const Icon(Icons.location_on_outlined),
    //   ),
    //   body: Column(
    //     children: [
    //       Padding(
    //         padding: const EdgeInsets.symmetric(horizontal: 15),
    //         child: TextField(
    //           decoration: InputDecoration(
    //               filled: true,
    //               fillColor: Colors.grey.shade300,
    //               hintText: 'Search',
    //               contentPadding: const EdgeInsets.symmetric(horizontal: 15),
    //               suffixIcon: const Icon(Icons.search),
    //               border: OutlineInputBorder(
    //                   borderSide: BorderSide.none,
    //                   borderRadius: BorderRadius.circular(50))),
    //         ),
    //       ),
    //       const SizedBox(height: 10),
    //       Expanded(
    //         child: ListView.builder(
    //             itemCount: Shop.shops.length,
    //             itemBuilder: (context, index) {
    //               return ListTile(
    //                 leading: Container(
    //                     height: 50,
    //                     width: 50,
    //                     decoration: BoxDecoration(
    //                         borderRadius: BorderRadius.circular(10),
    //                         image: DecorationImage(
    //                             fit: BoxFit.cover,
    //                             image:
    //                                 NetworkImage(Shop.shops[index].imageUrl)))),
    //                 title: Text(
    //                   Shop.shops[index].name,
    //                   style: const TextStyle(fontWeight: FontWeight.bold),
    //                 ),
    //                 subtitle: Text('${Shop.shops[index].count ?? 'All'} items'),
    //                 trailing: IconButton(
    //                   onPressed: () {
    //                     Navigator.push(
    //                         context,
    //                         MaterialPageRoute(
    //                             builder: (context) => ShopItems(
    //                                 shopName: Shop.shops[index].name)));
    //                   },
    //                   icon: const Icon(Icons.arrow_forward),
    //                 ),
    //               );
    //             }),
    //       ),
    //     ],
    //   ),
    // );
  }
}
