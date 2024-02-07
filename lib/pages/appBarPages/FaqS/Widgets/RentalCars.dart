

import 'package:flutter/cupertino.dart';
import 'package:yb_ride_user_web/components/headingTextWidget.dart';
import 'package:yb_ride_user_web/helper/appColors.dart';
import 'package:yb_ride_user_web/helper/responsive.dart';

Widget RentalcarsWidget(BuildContext context){
  return ResponsiveWidget.isSmallScreen(context)? Container(
    width: double.infinity,
    decoration: BoxDecoration(
        color: AppColors.buttonColor
    ),
    child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 30,),
          HeadingTextWidget(title: 'YBRide Help Center',textColor: AppColors.whiteColor,fontSize: 18,),
          SizedBox(height: 40,),
          HeadingTextWidget(title: 'Rental cars, your way.',fontSize: 25,fontWeight: FontWeight.bold,textColor: AppColors.whiteColor,),
          SizedBox(height: 80,),
        ],
      ),
    ),
  ) : Container(
    width: double.infinity,
    decoration: BoxDecoration(
      color: AppColors.buttonColor
    ),
    child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 150),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 30,),
          HeadingTextWidget(title: 'YBRide Help Center',textColor: AppColors.whiteColor,fontSize: 18,),
          SizedBox(height: 40,),
          HeadingTextWidget(title: 'Rental cars, your way.',fontSize: 25,fontWeight: FontWeight.bold,textColor: AppColors.whiteColor,),
          SizedBox(height: 80,),
        ],
      ),
    ),
  );
}
Widget RentalcarsWidgetSmall(){
  return Container(
    width: double.infinity,
    decoration: BoxDecoration(
      color: AppColors.buttonColor
    ),
    child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 30,),
          HeadingTextWidget(title: 'YBRide Help Center',textColor: AppColors.whiteColor,fontSize: 18,),
          SizedBox(height: 40,),
          HeadingTextWidget(title: 'Rental cars, your way.',fontSize: 22,fontWeight: FontWeight.bold,textColor: AppColors.whiteColor,),
          SizedBox(height: 80,),
        ],
      ),
    ),
  );
}