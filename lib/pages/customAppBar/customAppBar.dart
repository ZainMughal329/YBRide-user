import 'package:flutter/material.dart';

import '../../components/headingTextWidget.dart';
import '../../helper/appColors.dart';


Widget CustomAppBar(){
  return AppBar(
    backgroundColor: Color.fromRGBO(255, 255, 255, 1),
    title: Padding(
      padding: EdgeInsets.only(left: 20),
      child: HeadingTextWidget(
        title: 'YBRide',
        fontWeight: FontWeight.bold,
        fontSize: 30,
      ),
    ),
    actions: [
      // Your existing actions/widgets
      HeadingTextWidget(
        title: 'Become a driver partner',
        textColor: AppColors.appBarTextColor,
        fontSize: 14,
        fontWeight: FontWeight.normal,
      ),
      // ... add other actions
    ],
  );
}

