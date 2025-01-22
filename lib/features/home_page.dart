// ignore_for_file: prefer_const_constructors, sort_child_properties_last

import 'package:flutter/material.dart';
import 'package:food_app/features/food_info.dart';
import 'favorite_manager.dart'; // Import the favorite manager
import 'package:food_app/core/colors.dart';
import 'package:food_app/core/models/category_model.dart';
import 'package:food_app/core/models/food_model.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String? selectedCategoryId;
  late List<FoodItem> filteredProduct;

  @override
  void initState() {
    super.initState();
    filteredProduct = food;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: ClipRRect(
                child: Image.asset("assets/images/classic_burger.jpg"),
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            SizedBox(height: 20),
            SizedBox(
              height: 100,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: Categories.length,
                itemBuilder: (BuildContext context, int index) {
                  var category = Categories[index];
                  return Padding(
                    padding: const EdgeInsets.only(right: 30.0),
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          if (selectedCategoryId == category.id) {
                            selectedCategoryId = null;
                            filteredProduct = food;
                          } else {
                            selectedCategoryId = category.id;
                            filteredProduct = food.where((item) {
                              return item.category.id == selectedCategoryId;
                            }).toList();
                          }
                        });
                      },
                      child: DecoratedBox(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: category.id == selectedCategoryId
                              ? AppColor.primaryColor
                              : AppColor.whiteColor,
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(14.0),
                          child: Column(
                            children: [
                              Image.asset(
                                category.ImageUrl,
                                width: 50,
                              ),
                              Text(
                                category.name,
                                style: TextStyle(
                                  fontFamily: "Times New Roman",
                                  color: category.id == selectedCategoryId
                                      ? AppColor.whiteColor
                                      : AppColor.blackColor,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            SizedBox(height: 16),
            GridView.builder(
              itemCount: filteredProduct.length,
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 20,
                mainAxisSpacing: 20,
              ),
              itemBuilder: (context, index) {
                final item = filteredProduct[index];
                //check if it is fav or not
                final isFavorite = FavoriteManager.favoriteItems.contains(item);

                return DecoratedBox(
                  decoration: BoxDecoration(
                    color: AppColor.whiteColor,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Stack(
                    children: [
                      Positioned(
                        left: 25,
                        bottom: 5,
                        child: GestureDetector(
                          onTap: () {
                            // Pass the selected item to the FoodInfo page
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => FoodInfo(
                                    foodItem: item), // Passing the item
                              ),
                            );
                          },
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.network(
                                item.imgUrl,
                                width: 100,
                              ),
                              Text(
                                item.name,
                                style: TextStyle(fontFamily: "Times New Roman"),
                              ),
                              Text(
                                "\$${item.price}",
                                style: TextStyle(fontFamily: "Times New Roman"),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Positioned(
                        top: 1,
                        right: 1,
                        child: IconButton(
                          icon: Icon(
                            isFavorite ? Icons.favorite : Icons.favorite_border,
                            color: isFavorite
                                ? AppColor.redColor
                                : AppColor.greyColor,
                          ),
                          onPressed: () {
                            setState(() {
                              FavoriteManager.toggleFavorite(
                                  item); // Use FavoriteManager here
                            });
                          },
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
