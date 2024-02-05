import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../components/headingTextWidget.dart';
import '../../../components/subHeadingText.dart';

Widget appBarFooter(){

  return
    Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(width:30),
          Expanded(child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image(image: AssetImage('assets/images/YBRIDE text.jpg'),height: 60,width: 60,),
              SizedBox(height: 10,),
              text('© Copyright 2024 YBRide Systems Inc.'),
              SizedBox(height: 10,),
              text('All rights reserved.'),
            ],
          )),
          SizedBox(width: 50,),
          Expanded(child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              text('Company'),
              SizedBox(height: 20,),
              text('Blog'),
              SizedBox(height: 20,),
              text('Careers'),
              SizedBox(height: 20,),
              text('Team & Culture'),
              SizedBox(height: 20,),
              text('Privacy Policy'),
              SizedBox(height: 20,),
              text('Team of services'),
              SizedBox(height: 20,),
            ],)),
          SizedBox(width: 50,),
          Expanded(child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              text('Resources'),
              SizedBox(height: 20,),
              text('Accessibility'),
              SizedBox(height: 20,),
              text('Become a driver partner'),
              SizedBox(height: 20,),
              text('Referrals'),
              SizedBox(height: 20,),
              text('Partner with Us'),
              SizedBox(height: 20,),
              text('Do not Sell My Personal Information'),
              SizedBox(height: 20,),
            ],)),
          SizedBox(width: 50,),
          Expanded(child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              text('Download'),
              SizedBox(height: 20,),
              text('For iOS'),
              SizedBox(height: 20,),
              text('For Android'),
              SizedBox(height: 20,),
            ],)),
          SizedBox(width: 50,),
          Expanded(child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              text('Connect'),
              SizedBox(height: 20,),
              text('Facebook'),
              SizedBox(height: 20,),
              text('Twitter'),
              SizedBox(height: 20,),
              text('LinkedIn'),
              SizedBox(height: 20,),
              text('Instagram'),
              SizedBox(height: 20,),
            ],)),
        ],
      ),
    );

}


Widget text(String title){
  return SubHeadingTextWidget(title: title,textColor: Colors.black,fontSize: 12,);
}