

import 'package:flutter/cupertino.dart';
import 'package:yb_ride_user_web/components/headingTextWidget.dart';
import 'package:yb_ride_user_web/components/subHeadingText.dart';

Widget ratingStarsWidget(){
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Row(
        children: [
          Expanded(child: ratingStarComponent('No long lines, excellent service.', 'Frederick T.')),
          SizedBox(width: 20,),
          Expanded(child: ratingStarComponent('Finally renting a car is easy.', 'Santi P.')),
          SizedBox(width: 20,),
          Expanded(child: ratingStarComponent('YBRide is THE PLACE -- the only place for our rental cars from now on.', 'Gina F.')),
        ],
      ),
      SizedBox(height: 20,),
      Row(
        children: [
          Expanded(child: ratingStarComponent('It’s our first choice anytime we look for rentals now!', 'Seena H.')),
          SizedBox(width: 20,),
          Expanded(child: ratingStarComponent('The car got here exactly when I had requested.', 'Maria B.')),
          SizedBox(width: 20,),
          Expanded(child: ratingStarComponent("Feels like I'm a jet setting millionaire!", 'Edgar M.')),
        ],
      ),
      SizedBox(height: 20,),
      Row(
        children: [
          Expanded(child: ratingStarComponent('My new favorite car rental service.', 'Karan L.')),
          SizedBox(width: 20,),
          Expanded(child: ratingStarComponent('The pick up and drop off service was a game-changer.', 'Stephanie K.')),
          SizedBox(width: 20,),
          Expanded(child: ratingStarComponent('Brand new, sparkling clean cars.', 'Michelle T.')),
        ],
      ),

    ],
  );
}

Widget ratingStarComponent(String title,String subtitle){
  return Column(
    mainAxisAlignment: MainAxisAlignment.start,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Align(
        alignment: Alignment.topLeft,
        child: Container(
            height: 60,
            width: 150,
            child: Image(image: AssetImage('assets/images/ratingStars.webp'))),
      ),
      SizedBox(height: 5,),
      HeadingTextWidget(
        title: title,fontSize: 18,
        fontWeight: FontWeight.w600,),
      SizedBox(height: 5,),
      SubHeadingTextWidget(title: subtitle)
      
    ],
  );
}