

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:yb_ride_user_web/components/headingTextWidget.dart';
import 'package:yb_ride_user_web/helper/appColors.dart';
import 'package:yb_ride_user_web/helper/responsive.dart';
import 'package:yb_ride_user_web/helper/show_progress_indicator.dart';
import 'package:yb_ride_user_web/homePage/view.dart';

Widget RentalcarsWidget(BuildContext context){
  return ResponsiveWidget.isSmallScreen(context)? Stack(
    alignment: Alignment.topCenter,
    children: [
      Container(
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
      ),
      Align(
        alignment: Alignment.topLeft,
        child: IconButton(
          onPressed: (){
            showProgressIndicator(context);
            Future.delayed(Duration(seconds: 2),(){
              Navigator.pop(context);
              Get.to(()=>HomePage());
            });
            // Get.offAll(()=>HomePage(),transition: Transition.rightToLeft,duration: Duration(milliseconds: 600));
          },
          icon: Icon(Icons.cancel_outlined,color: Colors.white,size: 35,),
        ),
      ),
    ],
  ) :
Stack(
  alignment: Alignment.topCenter,
  children: [

  Container(
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
),
    Align(
      alignment: Alignment.topLeft,
      child:  IconButton(
        onPressed: (){
          showProgressIndicator(context);
          Future.delayed(Duration(seconds: 2),(){
            Navigator.pop(context);
            Get.to(()=>HomePage());
          });
          // Get.offAll(()=>HomePage(),transition: Transition.rightToLeft,duration: Duration(milliseconds: 600));
        },
        icon: Icon(Icons.cancel_outlined,color: Colors.white,size: 35,),
      ),
    ),

  ],
);}
Widget RentalcarsWidgetSmall(BuildContext context){
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
          Padding(
            padding: const EdgeInsets.only(right: 450),
            child: IconButton(
              onPressed: (){
                showProgressIndicator(context);
                Future.delayed(Duration(seconds: 2),(){
                  Navigator.pop(context);
                  Get.to(()=>HomePage());
                });
                // Get.offAll(()=>HomePage(),transition: Transition.downToUp,duration: Duration(milliseconds: 600));
              },
              icon: Icon(Icons.cancel_outlined,color: Colors.black,size: 35,),
            ),
          ),
          SizedBox(width: 5,),
          HeadingTextWidget(title: 'YBRide Help Center',textColor: AppColors.whiteColor,fontSize: 18,),
          SizedBox(height: 40,),
          HeadingTextWidget(title: 'Rental cars, your way.',fontSize: 22,fontWeight: FontWeight.bold,textColor: AppColors.whiteColor,),
          SizedBox(height: 80,),
        ],
      ),
    ),
  );
}