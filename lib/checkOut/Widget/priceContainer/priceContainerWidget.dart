


import 'package:flutter/material.dart';
import 'package:yb_ride_user_web/components/headingTextWidget.dart';
import 'package:yb_ride_user_web/components/subHeadingText.dart';

Widget priceContainerWidget(){
  return  Container(
    decoration: BoxDecoration(
      borderRadius: BorderRadius.all(Radius.circular(10)),
      // color: Colors.grey
      border: Border.all(color: Colors.black54.withOpacity(.1)),
      // boxShadow: [
      //   BoxShadow(color: Colors.black54)
      // ]
    ),
    child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Image(image: AssetImage('assets/images/7_seater-3.webp'),height: 180,width: 270,),
              SizedBox(width: 30,),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  HeadingTextWidget(title: 'SUV'),
                  Row(
                    children: [
                      SubHeadingTextWidget(title: '5 days'),
                      SizedBox(width: 7,),
                      SubHeadingTextWidget(title: '.'),
                      SizedBox(width: 7,),
                      SubHeadingTextWidget(title: 'Feb 20'),
                      SizedBox(width: 7,),
                      SubHeadingTextWidget(title: '-'),
                      SizedBox(width: 7,),
                      SubHeadingTextWidget(title: 'Feb 24'),

                    ],
                  )
                  

                ],
              ),
            ],
          ),
          SizedBox(height: 30,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SubHeadingTextWidget(title: 'Your YBRide'),
              SubHeadingTextWidget(title: '\$'+'30.00 * 5 days'),


            ],
          ),
          SizedBox(height: 30,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SubHeadingTextWidget(title: 'Sales tax'),
              SubHeadingTextWidget(title: '\$'+'15.88'),
            ],
          ),
          SizedBox(height: 30,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              HeadingTextWidget(title: 'Total'),
              SubHeadingTextWidget(title: '\$'+'170.99'),
            ],
          ),
          SizedBox(height: 30,),
          Row(
            children: [
              Icon(Icons.emoji_emotions_outlined),
              SizedBox(width: 20,),
              SubHeadingTextWidget(title: "Weekday savings included, you're getting a great deal.")
            ],
          ),
          SizedBox(height: 30,),

          Row(
            children: [
              Icon(Icons.done),
              SizedBox(width: 20,),
              Column(
                children: [
                  Row(
                    children: [
                      HeadingTextWidget(title: 'Free Cancellation ',fontSize: 16,),
                      SubHeadingTextWidget(title: 'until '),
                      HeadingTextWidget(title: 'Feb 21',fontSize: 16,),
                      SubHeadingTextWidget(title: '. Cancel at least 24 hours'),




                    ],
                  ),
                  SubHeadingTextWidget(title: "in advance for a full refund in the form of YBRide Credits")
                ],
              )

            ],
          ),
        ],
      ),
    ),
  );
}