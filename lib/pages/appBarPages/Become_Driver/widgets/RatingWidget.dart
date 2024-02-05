

import 'package:flutter/material.dart';

import '../../../../components/headingTextWidget.dart';
import '../../../../components/subHeadingText.dart';

Widget RetingWidgte(){

  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 250),
    child: Column(
      children: [
      Row(
        children: [
          Expanded(child:reuseableContainer("I can't say enough good things about YBRIde, the overall rental experience and their customer service. I rented a car with them today for the first time and it was a great experience. ", 'Jonny') ),
          SizedBox(width: 40,),
          Expanded(child:reuseableContainer("YBRide is THE PLACE -- the only place for our rental cars from now on.last minute changes!  Throughout our many conversations, these people were lovely, caring & oh so easy to work with. ", 'Bobby Badshah') ),

        ],
      ),
        SizedBox(height: 40,),
        Row(
          children: [
            Expanded(child:reuseableContainer("Little hassle. No long lines, excellent service and punctuality. Also, a more personal feel regarding my rental experience. Kyte is an excellent company and I won't rent another way again.", 'Danny') ),
            SizedBox(width: 40,),
            Expanded(child:reuseableContainer("My new favorite car rental service. Person shows up with the car to your doorstep to dropoff and pick up. Hastle free - no need to fill gas or anything, they take care of it for you. Love the app and the great communication.", 'Smith') ),
          ],
        )
      ],
    ),
  );
}


Widget reuseableContainer(String title,String subtitle){
  return Container(
    height: 270,
    width: 900,
    decoration: BoxDecoration(
      color: Colors.purple.withOpacity(.2),
      borderRadius: BorderRadius.all(Radius.circular(10))
    ),
    child: Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Align(
            alignment: Alignment.topLeft,
            child: Container(
                height: 60,
                width: 200,
                child: Image(image: AssetImage('assets/images/ratingStars.webp'))),
          ),
          SizedBox(height: 10,),
          HeadingTextWidget(
            title: title,fontSize: 18,
            fontWeight: FontWeight.w600,),
          SizedBox(height: 5,),
          SubHeadingTextWidget(title: subtitle)

        ],
      ),
    )
  );
}