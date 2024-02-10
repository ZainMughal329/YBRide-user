

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:yb_ride_user_web/helper/appColors.dart';

import '../../../components/headingTextWidget.dart';
import '../../../components/subHeadingText.dart';

Widget welcomeYBRide(context){
  return onTapAnswer(  context);
}


Widget onTapAnswer( BuildContext context) {
  return Container(
    decoration: BoxDecoration(
        border: Border.all(color: Colors.black54.withOpacity(.1)),
        borderRadius: BorderRadius.all(Radius.circular(10))
    ),
    child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Theme(
            data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
            child: ExpansionTile(
              title: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      HeadingTextWidget(
                        title: 'Welcome to YBRide! ',
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                      Icon(Icons.star,color: AppColors.buttonColor,),
                      SubHeadingTextWidget(title: ' 4.85 / 76k')
                    ],
                  ),
                  SizedBox(height: 5,),
                  SubHeadingTextWidget(title: 'No lines, no hidden fess. Get a car on your terms')
                ],
              ),
              children: [
                Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ListTile(
                        leading:Icon(Icons.done,color: AppColors.buttonColor,),
                        title:
                        HeadingTextWidget(title: 'We deliver. ',fontSize: 16,fontWeight: FontWeight.bold,),
                        subtitle:
                        SubHeadingTextWidget(title: "we'll meet you at your house, hotels, or wherever else is convenient",fontSize: 16,)

                      ),
                      SizedBox(height: 10,),
                      ListTile(
                          leading:Icon(Icons.credit_card_rounded,color: AppColors.buttonColor,),
                          title:
                          HeadingTextWidget(title: 'No rental counters. ',fontSize: 16,fontWeight: FontWeight.bold,),
                          subtitle:
                          SubHeadingTextWidget(title: "All drivers must verify their driver's license only before their trip.",fontSize: 16,)

                      ),
                      SizedBox(height: 10,),
                      ListTile(
                          leading:Icon(Icons.phone_android_sharp,color: AppColors.buttonColor,),
                          title:
                          HeadingTextWidget(title: 'Add drivers for free',fontSize: 16,fontWeight: FontWeight.bold,),
                          subtitle:
                          SubHeadingTextWidget(title: "manage your trip on the go using our app.",fontSize: 16,)
                      ),
                      SizedBox(height: 10,),


                    ],
                  ),
                ),
              ],
            ),
          ),
          // Divider(),
        ],
      ),
    ),
  );
}
