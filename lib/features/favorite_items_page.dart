// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:food_app/core/colors.dart';
import 'package:food_app/features/food_info.dart';
import 'favorite_manager.dart'; // Import FavoriteManager

class FavoritesPage extends StatefulWidget {
  const FavoritesPage({super.key});

  @override
  State<FavoritesPage> createState() => _FavoritesPageState();
}

class _FavoritesPageState extends State<FavoritesPage> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: FavoriteManager.favoriteItems.isEmpty
          ? Center(
              child: Text(
                "No items in the favorites yet!",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  fontFamily: "Times New Roman",
                  color: AppColor.primaryColor,
                ),
              ),
            )
          : Padding(
            padding: const EdgeInsets.only(top:8.0),
            child: GridView.builder(
                itemCount: FavoriteManager.favoriteItems.length,
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 20,
                  mainAxisSpacing: 20,
                ),
                itemBuilder: (context, index) {
                  final item = FavoriteManager.favoriteItems.elementAt(index);
                  final isFavorite = FavoriteManager.favoriteItems.contains(item);
            
                  return GestureDetector(
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
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                        color: AppColor.whiteColor,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Stack(
                        children: [
                          Positioned(
                            left: 25,
                            bottom: 10,
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
                                  FavoriteManager.toggleFavorite(item); // Toggle favorite status
                                });
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
          ),
    );
  }
}
