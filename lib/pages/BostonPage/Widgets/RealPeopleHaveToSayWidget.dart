
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:yb_ride_user_web/helper/appColors.dart';

import '../../../components/headingTextWidget.dart';
import '../../../components/subHeadingText.dart';

Widget RealPeopleHaveWidget(){

  return Container(
    width: double.infinity,
    decoration: BoxDecoration(
        color: Colors.purple.withOpacity(.2)
    ),
    child: Padding(
      padding:  EdgeInsets.symmetric(vertical: 40),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(width: 40,),
          Expanded(child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              HeadingTextWidget(title: 'What Real People',fontWeight: FontWeight.bold,fontSize: 40,),
              SizedBox(height: 10,),
              HeadingTextWidget(title: 'have to say',fontWeight: FontWeight.bold,fontSize: 40,textColor: AppColors.buttonColor,),
              SizedBox(height: 20,),
              SubHeadingTextWidget(title: "YBRide customers are passionate about how we are "),
              SizedBox(height: 5,),
              SubHeadingTextWidget(title: " revolutionizing car rental. See for yourself.")


            ],
          )),
          SizedBox(width: 30,),
          Expanded(child: Column(
            children: [
              onTapAnswer(
                  'Game Changer!',"Finally no lines at car rental garages, no rude employees, and most of all NO STRESS. Car gets delivered to your door, paperwork is all through app. Chat with customer service is also easy and fast. Thank you!!!"
              ),
              SizedBox(height: 20,),
              onTapAnswer(
                  'YBRide is THE PLACE -- the only place for our rental cars from now on.','We were a pain with numerous questions and many rounds of last-minute changes! Throughout our many conversations, these people were lovely, caring & oh so easy to work with. So personable! The car and Surfer who delivered it were fabulous'
              ),
              SizedBox(height: 20,),

              onTapAnswer(
                  'Never renting from a traditional car rental company again?',"The responses from the chat conversations are quick, precise, and the reps are very polite. This is my first time using this company and I must say I was skeptical at first but not anymore the surfer was awesome and answered my questions with ease"
              ),
              SizedBox(height: 20,),


            ],
          )),

        ],
      ),
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
