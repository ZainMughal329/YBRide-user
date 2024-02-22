import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../components/subHeadingText.dart';
import '../SignUpForm.dart';
import '../view.dart';

Widget firstPageWidget(){
  return
    Padding(
      padding: const EdgeInsets.symmetric(horizontal: 200),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(child: Column(
            children: [
              SubHeadingTextWidget(title: 'Earn by delivering and returning rental',fontSize: 22,textColor: Colors.black,),
              SizedBox(height: 10,),
              SubHeadingTextWidget(title: 'cars when you want. The best part is,',fontSize: 22,textColor: Colors.black,),
              SizedBox(height: 10,),
              SubHeadingTextWidget(title: "you don't need a car!",fontSize: 22,textColor: Colors.black,),
              SizedBox(height: 30,),
              reuseableButton('SignUp Now', () {
                Get.to(()=>SurferSignUpForm());
              }),
              SizedBox(height: 12,),
              SubHeadingTextWidget(title: "Takes less than 5 minutes!",fontSize: 13,),


            ],
          )),
          Expanded(child: Image(
            image: AssetImage('assets/BecomeDriverMainPage2.webp'),height: 350,width: 350,
          ))
        ],
      ),
    );

}

Widget firstPageWidgetSmall(){
  return
    Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SubHeadingTextWidget(title: 'Earn by delivering and returning rental cars when you want. The best part is you don\'t need a car!',textAlign: TextAlign.center,fontSize: 20,fontWeight: FontWeight.normal,textColor: Colors.black,),
        SizedBox(height: 20,),

        reuseableButton('SignUp Now', () {
          Get.to(()=>SurferSignUpForm());
        }),
        SizedBox(height: 12,),
        SubHeadingTextWidget(title: "Takes less than 5 minutes!",fontSize: 13,),
        Image(
          image: AssetImage('assets/BecomeDriverMainPage2.webp'),height: 300,width: 300,
        )
      ],
    );

}
