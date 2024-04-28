import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yb_ride_user_web/helper/show_progress_indicator.dart';

import '../../../../components/headingTextWidget.dart';
import '../../../../components/subHeadingText.dart';
import '../SignUpForm.dart';
import '../view.dart';

Widget howToSignUp(BuildContext context){
  return
    Container(
      width: double.infinity,
      decoration: BoxDecoration(
          color: Colors.purple.withOpacity(.2)
      ),
      child: Column(
        children: [
          SizedBox(height: 50,),
          HeadingTextWidget(title: 'How to Sign Up',fontWeight: FontWeight.bold,fontSize: 40,),
          SizedBox(height: 50,),
          SubHeadingTextWidget(title: 'Complete an application, attend an onboarding session and you are ready',fontSize: 22,textColor: Colors.black,),
          SizedBox(height: 10,),
          SubHeadingTextWidget(title: "to start earning! You must be 21+ years old and have a valid driver's license.",fontSize: 22,textColor: Colors.black,),
          SizedBox(height: 50,),
          reuseableButton('SignUp Now', () {
            showProgressIndicator(context);
            Future.delayed(Duration(seconds: 2),(){
              Navigator.pop(context);
              Get.to(()=>SurferSignUpForm());
            });
            // Get.to(()=>SurferSignUpForm());

          }),
          SizedBox(height: 50,),

        ],
      ),
    );

}
Widget howToSignUpSmall(BuildContext context){
  return
    Container(
      width: double.infinity,
      decoration: BoxDecoration(
          color: Colors.purple.withOpacity(.2)
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 100),
        child: Column(
          children: [
            SizedBox(height: 50,),
            HeadingTextWidget(title: 'How to Sign Up',fontWeight: FontWeight.bold,fontSize: 20,),
            SizedBox(height: 30,),
            SubHeadingTextWidget(title: 'Complete an application, attend an onboarding session and you are ready',fontSize: 16,textColor: Colors.black,textAlign: TextAlign.center,),
            SubHeadingTextWidget(title: "to start earning! You must be 21+ years old and have a valid driver's license.",fontSize: 16,textColor: Colors.black,textAlign: TextAlign.center,),
            SizedBox(height: 30,),
            reuseableButton('SignUp Now', () {
              showProgressIndicator(context);
              Future.delayed(Duration(seconds: 2),(){
                Navigator.pop(context);
                Get.to(()=>SurferSignUpForm());
              });
              // Get.to(()=>SurferSignUpForm(),transition: Transition.rightToLeft,duration: Duration(milliseconds: 600));
            }),
            SizedBox(height: 50,),

          ],
        ),
      ),
    );

}