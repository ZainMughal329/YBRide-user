


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:yb_ride_user_web/components/headingTextWidget.dart';
import 'package:yb_ride_user_web/components/subHeadingText.dart';
import 'package:yb_ride_user_web/helper/appColors.dart';

Widget downlaod_YBRide(){
  return Container(
    decoration: BoxDecoration(
      color: AppColors.buttonColor,
      borderRadius: BorderRadius.all(Radius.circular(15))
    ),
    height: 120,
    width: 850,
    child: Center(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListTile(
          title: HeadingTextWidget(title: 'Download YBRide',textColor: Colors.white,),
          subtitle: SubHeadingTextWidget(title: 'Get discounts, support, and track your delivery. Everything is better in the app.',textColor: Colors.white,),
          trailing: Image(image: AssetImage('assets/images/yBRideLogo.jpg'),),
        ),
      ),
    ),
  );
}
Widget downlaod_YBRideMediumScreen(){
  return Container(
    decoration: BoxDecoration(
        color: AppColors.buttonColor,
        borderRadius: BorderRadius.all(Radius.circular(15))
    ),
    height: 120,
    width: 850,
    child: Center(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListTile(
          title: HeadingTextWidget(title: 'Download YBRide',textColor: Colors.white,),
          subtitle: SubHeadingTextWidget(title: 'Get discounts, support, and track your delivery. Everything is better in the app.',textColor: Colors.white,),
          trailing: Image(image: AssetImage('assets/images/yBRideLogo.jpg'),),
        ),
      ),
    ),
  );
}
Widget downlaod_YBRideSmallScreen(){
  return Container(
    decoration: BoxDecoration(
        color: AppColors.buttonColor,
        borderRadius: BorderRadius.all(Radius.circular(15))
    ),
    height: 120,
    width: 850,
    child: Center(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListTile(
          title: HeadingTextWidget(title: 'Download YBRide',textColor: Colors.white,),
          subtitle: SubHeadingTextWidget(title: 'Get discounts, support, and track your delivery. Everything is better in the app.',textColor: Colors.white,),
          trailing: Image(image: AssetImage('assets/images/yBRideLogo.jpg'),),
        ),
      ),
    ),
  );
}
