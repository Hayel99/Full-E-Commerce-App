import 'package:ecommerce_app/providers/home_screen_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AllCategories extends StatefulWidget {
  const AllCategories({Key? key}) : super(key: key);

  @override
  State<AllCategories> createState() => _AllCategoriesState();
}

class _AllCategoriesState extends State<AllCategories> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          iconTheme: const IconThemeData(color: Colors.black),
          title: const Text('All Categories',
              style: TextStyle(color: Colors.black)),
        ),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: TextField(
                decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.grey.shade300,
                    hintText: 'Search',
                    contentPadding: const EdgeInsets.symmetric(horizontal: 15),
                    suffixIcon: const Icon(Icons.search),
                    border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(50))),
              ),
            ),
            const SizedBox(height: 10),
            Expanded(
              child: Consumer<HomeScreenProvider>(
                builder: (context, value, child) {
                  return GridView.builder(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2, childAspectRatio: 1.8),
                      itemCount: value.categoriesList.length,
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: () {},
                          child: Container(
                              alignment: Alignment.center,
                              margin: const EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  image: DecorationImage(
                                      colorFilter: ColorFilter.mode(
                                          Colors.purple.withOpacity(0.8),
                                          BlendMode.modulate),
                                      fit: BoxFit.cover,
                                      image: NetworkImage(
                                        value.categoriesList[index].ImageUrl,
                                      ))),
                              child: Text(
                                value.categoriesList[index].Name,
                                style: TextStyle(
                                    color: Colors.white, fontSize: 18),
                              )),
                        );
                      });
                },
              ),
            ),
          ],
        ));
  }
}
