

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:yb_ride_user_web/components/headingTextWidget.dart';
import 'package:yb_ride_user_web/components/subHeadingText.dart';

Widget howItWorkWidget(){
  return Padding(
    padding: const EdgeInsets.all(32.0),
    child: Row(
      children: [
        Expanded(child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            HeadingTextWidget(title: 'How it works',fontSize: 25,fontWeight: FontWeight.bold,),
            SizedBox(height:5,),
            SubHeadingTextWidget(title: 'Stay in control of your trip from beginning to end.'),
            SizedBox(height:90,),
            onTapAnswer('Book a car from our fleet', 'Tell us where you want to get the car and choose a good time to meet.'),
            SizedBox(height:20,),
            onTapAnswer('Get it delivered', 'YBRide Surfers can deliver your vehicle and pick it up when you’re done. If it’s more convenient, you can pick it up yourself at one of our lots.'),
            SizedBox(height:20,),
            onTapAnswer('Return the car', 'If you chose delivery, a YBRide Surfer will pick up the car at the return address you selected. Otherwise, you can return the car to one of our lots.'),
            SizedBox(height:20,),
          ],
        )),
        SizedBox(width: 30,),
        Expanded(child: Container(
            height: 500,
            width:170,
            decoration: BoxDecoration(
              image: DecorationImage(image: AssetImage('assets/images/howWorks.webp'),fit: BoxFit.fill),
              // color: Colors.blue,
              borderRadius:
              BorderRadius.all(Radius.circular(20)),

          ),
        ))
      ],
    ),
  );
}

Widget onTapAnswer(String title,String subTitle){
  return Column(
    mainAxisAlignment: MainAxisAlignment.start,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      ExpansionTile(
        title: HeadingTextWidget(
          title: title,
          fontSize: 18,
          fontWeight: FontWeight.w600,
        ),
        children: [
          Padding(
            padding:  EdgeInsets.all(16.0),
            child: SubHeadingTextWidget(title: "  " + subTitle),
          ),
        ],
      ),
      // Divider(),
    ],
  );
}
