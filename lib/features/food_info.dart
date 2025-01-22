// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:food_app/core/colors.dart';
import 'package:food_app/core/models/food_model.dart';

class FoodInfo extends StatelessWidget {
  final FoodItem foodItem; // Accepting the food item

  const FoodInfo(
      {super.key,
      required this.foodItem}); // Constructor to accept the food item

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.orangeColor,
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: AppColor.orangeColor,
        ),
        title: Text(
          foodItem.name,
          style: TextStyle(
            color: AppColor.orangeColor,
            fontFamily: "Times New Roman",
          ),
        ),
        backgroundColor:
            AppColor.primaryColor, // Display food name in the app bar
      ),
      body: 
      Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Image.network(foodItem.imgUrl), // Display food image
            SizedBox(height: 10),
            Text(
              foodItem.name,
              style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  fontFamily: "Times New Roman",
                  color: AppColor.primaryColor),
            ),
            SizedBox(height: 10),
            Text(
              "\$${foodItem.price}",
              style: TextStyle(
                fontSize: 18,
                fontFamily: "Times New Roman",
                color: AppColor.primaryColor,
              ),
            ),
            SizedBox(height: 20),
            Align(
              alignment: Alignment.center,
              child: Text(
                foodItem.description,
                style: TextStyle(
                    fontFamily: "Times New Roman", color: AppColor.primaryColor,
                    ),
              ),
            ), // Display food description if available
          ],
        ),
      ),
    );
  }
}
