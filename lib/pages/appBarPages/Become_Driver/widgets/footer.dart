import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:yb_ride_user_web/components/headingTextWidget.dart';
import 'package:yb_ride_user_web/helper/appColors.dart';

Widget FooterWidget() {
  return Container(
    width: double.infinity,
    decoration: BoxDecoration(color: AppColors.buttonColor),
    child: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment. center,
        children: [
          SizedBox(
            height: 60,
          ),
          HeadingTextWidget(
            title: 'YBRide help center',
            fontSize: 18,
            fontWeight: FontWeight.w500,
            textColor: AppColors.whiteColor,
          ),
          SizedBox(
            height: 70,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              IconButton(onPressed: () {}, icon: Icon(Icons.facebook,color: AppColors.whiteColor,size: 30,)),
              SizedBox(
                width: 5,
              ),
              IconButton(onPressed: () {}, icon: Icon(CupertinoIcons.airplane,color: AppColors.whiteColor,size: 30)),
              SizedBox(
                width: 5,
              ),
              IconButton(onPressed: () {}, icon: Icon(Icons.facebook,color: AppColors.whiteColor,size: 30,),),
              SizedBox(
                width: 5,
              ),
            ],
          ),
          SizedBox(
            height: 70,
          ),
        ],
      ),
    ),
  );
}