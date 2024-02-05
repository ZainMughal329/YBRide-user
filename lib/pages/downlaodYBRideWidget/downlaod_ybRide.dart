


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
  return Padding(
    padding: EdgeInsets.all(40.0),
    child: Container(
      decoration: BoxDecoration(
          color: AppColors.buttonColor,
          borderRadius: BorderRadius.all(Radius.circular(15))
      ),
      height: 190,
      // width: 850,
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Spacer(),
              HeadingTextWidget(title: 'Download YBRide' , textColor: AppColors.whiteColor,fontSize: 15,),
              SizedBox(height: 10,),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 12.0),
                child: SubHeadingTextWidget(title: 'Get discounts, support, and track your delivery. Everything is better in the app.',textAlign: TextAlign.center , textColor: AppColors.whiteColor,fontSize: 13,),
              ),
              SizedBox(height: 20,),

              Container(
                height: 50,
                width: 100,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  color: Colors.deepPurple
                ),
                child: Center(
                  child: HeadingTextWidget(
                    title: 'Download',
                    textColor: AppColors.whiteColor,
                    fontSize: 14,
                  ),
                ),
              ),
              Spacer(),

            ],
          ),
        ),
      ),
    ),
  );
}
