

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yb_ride_user_web/components/headingTextWidget.dart';
import 'package:yb_ride_user_web/components/subHeadingText.dart';
import 'package:yb_ride_user_web/pages/appBarPages/Become_Driver/widgets/RatingWidget.dart';
import 'package:yb_ride_user_web/pages/appBarPages/Become_Driver/widgets/becomeDriverFooter.dart';
import 'package:yb_ride_user_web/pages/appBarPages/Become_Driver/widgets/firstPageWidget.dart';
import 'package:yb_ride_user_web/pages/appBarPages/Become_Driver/widgets/howItWorksWidget.dart';
import 'package:yb_ride_user_web/pages/appBarPages/Become_Driver/widgets/howTosSgnUpForm.dart';
import 'package:yb_ride_user_web/pages/appBarPages/Become_Driver/widgets/whyEarnWithYbRideWidget.dart';

import '../../../helper/appColors.dart';
import 'controller.dart';

class BecomeDriverPage extends StatelessWidget {
  const BecomeDriverPage({super.key});

  @override
  Widget build(BuildContext context) {
    final con = Get.put(BecomeDriverCon());
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 20,),
              Padding(
                padding: const EdgeInsets.only(right: 900),
                child: Image(image: AssetImage('assets/images/YBRIDE text.jpg',),height: 60,width: 65,),
              ),
              SizedBox(height: 40,),
              HeadingTextWidget(title: 'Become a YBRide Driver Partner',fontWeight: FontWeight.bold,fontSize: 40,),
              SizedBox(height: 30,),
              HeadingTextWidget(title: 'Earn More With Flexible Hours',fontWeight: FontWeight.bold,fontSize: 28,),
              SizedBox(height: 50,),
              firstPageWidget(),
              SizedBox(height: 40,),
              HoeItWorks(),
              SizedBox(height: 70,),
              HeadingTextWidget(title: 'Why earn with YBRide?',fontWeight: FontWeight.bold,fontSize: 40,),
              SizedBox(height: 70,),
              WhyEarnWithYBRide(),
              SizedBox(height: 70,),
              howToSignUp(),
              SizedBox(height: 70,),
              HeadingTextWidget(title: 'Users already love YBRide!',fontWeight: FontWeight.bold,fontSize: 40,),
              SizedBox(height: 70,),
              RetingWidgte(),
              SizedBox(height: 100,),
              becomeDriverFooter(),
              SizedBox(height: 100,),

              
            ],
          ),
        ),
      ),
    );
  }
}


Widget reuseableButton(String text,VoidCallback onTap) {

  return InkWell(
    onTap: onTap,
    child: Container(
        height: 55,
        width: 200,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            color: AppColors.buttonColor
        ),
        child: Center(
          child: HeadingTextWidget(
            title: text,
            fontSize: 14,
            textColor: AppColors.whiteColor,
          ),
        ),
      ),
  );

}
