import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../components/subHeadingText.dart';


Widget becomeDriverFooter(){
  return
    Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(width:100),
          Expanded(child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image(image: AssetImage('assets/images/YBRIDE text.jpg'),height: 60,width: 60,),
            ],
          )),
          Expanded(child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              text('Connect With US'),
              SizedBox(height: 20,),
              text('Website'),
              SizedBox(height: 20,),
              text('Partnerships'),
              SizedBox(height: 20,),
              text('LinkedIn'),
              SizedBox(height: 20,),
              text('Twitter'),
              SizedBox(height: 20,),
            ],)),
          Expanded(child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              text('contact Us'),
              SizedBox(height: 20,),
              text('support@driverYBRide.com'),
              SizedBox(height: 20,),
            ],)),
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
        ],
      ),
    );

}


Widget text(String title){
  return SubHeadingTextWidget(title: title,textColor: Colors.black,fontSize: 12,);
}