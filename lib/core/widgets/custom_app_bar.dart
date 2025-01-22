// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:food_app/core/colors.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppColor.primaryColor,
      iconTheme: IconThemeData(
            color: AppColor.whiteColor, 
          ),
      title: Column(
        children: [
          Text(
            "Current Location",
            style: TextStyle(
                color: AppColor.greyColor,
                fontSize: 15,
                fontFamily: "Times New Roman"),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.location_on,
                color: AppColor.greenColor,
              ),
              Text(
                "Nablus , Palestine",
                style: TextStyle(
                  fontFamily: "Times New Roman",
                  fontSize: 20,
                  color: AppColor.whiteColor,
                ),
              )
            ],
          )
        ],
      ),
      actions: [
        IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.notifications,
              color: AppColor.whiteColor,
            ))
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(80);
}
