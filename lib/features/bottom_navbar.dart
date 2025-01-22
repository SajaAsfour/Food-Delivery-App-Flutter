// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:food_app/core/colors.dart';
import 'package:food_app/core/widgets/AppDrawer.dart';
import 'package:food_app/core/widgets/custom_app_bar.dart';
import 'package:food_app/features/favorite_items_page.dart';
import 'package:food_app/features/home_page.dart';

class BottomNavbar extends StatefulWidget {
  const BottomNavbar({super.key});

  @override
  State<BottomNavbar> createState() => _BottomNavbarState();
}

class _BottomNavbarState extends State<BottomNavbar> {
  int selectedIndex = 0;
  List<Widget> bodyOption = [
    HomePage(),
    FavoritesPage(),
    Center(
      child: Text("Profile Page"),
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.orangeColor,
      drawer: AppDrawer(),
      appBar: CustomAppBar(),
      body: bodyOption[selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: AppColor.primaryColor,
        selectedItemColor:  AppColor.whiteColor,
        unselectedItemColor: AppColor.greyColor,
        selectedLabelStyle: TextStyle(fontFamily: "Times New Roman"),
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(
              icon: Icon(Icons.favorite), label: "Favorite"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
        ],
        onTap: (index) {
          setState(() {
            selectedIndex = index;
          });
        },
        currentIndex: selectedIndex,
      ),
    );
  }
}
