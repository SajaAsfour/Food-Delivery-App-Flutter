import 'package:flutter/material.dart';
import 'package:food_app/core/colors.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: AppColor.whiteColor,
    );
  }
}