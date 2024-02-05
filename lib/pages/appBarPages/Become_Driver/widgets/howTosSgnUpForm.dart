import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../components/headingTextWidget.dart';
import '../../../../components/subHeadingText.dart';
import '../view.dart';

Widget howToSignUp(){
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
          reuseableButton('SignUp Now', () { }),
          SizedBox(height: 50,),

        ],
      ),
    );

}