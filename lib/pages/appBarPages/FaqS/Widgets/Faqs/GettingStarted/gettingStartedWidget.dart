import 'package:flutter/material.dart';
import 'package:yb_ride_user_web/components/subHeadingText.dart';

import '../../../../../../components/headingTextWidget.dart';
import '../../../../../../helper/appColors.dart';

Widget GettingStartedWidgte(){

  return Material(
    child: Container(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 150,vertical: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
          SubHeadingTextWidget(title: 'All Collections > Getting Started'),
            SizedBox(height: 20,),
            Icon(Icons.star,color: AppColors.buttonColor,size: 50,),
            SizedBox(height: 20,),
            HeadingTextWidget(title: 'Getting Started'),
            SizedBox(height: 20,),
            SubHeadingTextWidget(title: '9 articles'),
            SizedBox(height: 20,),
            Container(
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.black54),
                  borderRadius: BorderRadius.all(Radius.circular(10))
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                   onTapAnswer('How does YBRide Work?', "Book a car from our new and clean fleet. Tell us where you want to get the car and choose a good time to meet. "
                       "It's that easy, no lines, no paperwork, just rental cars, your way."),
                    onTapAnswer('Where is YBRide available?', 'BOSTON'),
                    onTapAnswer('What are the mileage limit? Can I purchase unlimited mileage?', "At YBRide, we include 300 miles per day for all our trips, which are cumulative throughout the booking period. So, if you book for 3 days, you will have a total of 900 miles for free that you can use during your trip. However, if you exceed the mileage limit, we will charge a surcharge of \$0.45 per mile."),
                    onTapAnswer('Can I Take my YBRide into canada or mexico?', "Unfortunately, our cars can't travel into Canada or Mexico. "
                        "If for any reason your YBRide is detained in either Canada or Mexico, you'll be fully liable for any costs associated with the retrieval of the car up to the full cost of the car."),
                    onTapAnswer('Can I bring pets on my YBRide trip?', "Absolutely, your furry friends are welcome. We suggest using a carrier or seat cover if you have an extra fluffy copilot."
                        "Pro-Tip: Excessive pet hair left in your Kyte may result in a \$100 cleaning fee."),
                    onTapAnswer('How do I book a YBRide?', "From OUR YBRide App"),
                    onTapAnswer('Contact us ?', "We're here for you. Chat with a live (yes really!) team member any day of the week 3AM - 10PM PST. Send a message to us through the help center to get help."
                        "Just open the app and tap 'Help'. If you don't have the app, you can chat with us here on our website. Just tap the green messenger logo in the bottom right of this page. "
                        "That's cool too! We're available any day of the week from 3AM - 10PM PST. "),
                    onTapAnswer('Hooper & YBRide?', "Welcome to YBRide, where we're reinventing the car rental experience just for you! Imagine a car rental service that's a notch above traditional agencies, that's us! If you're within our service area, we'll deliver the car straight to you, no matter where you are, and pick it up when you're finished. "
                        "We do not have any physical rental counters. Instead of standing in line at a counter, you'll get to meet our friendly 'Surfer' - yes, that's our cool name for our drivers - at a time and place that suits you. With Kyte, it's out with the old and in with the convenience!"),
                    onTapAnswer('Priceline & YBRide?', "We're like a traditional rental car agency... but better! The major difference between YBRide and a traditional rental car agency is that Kyte delivers your vehicle to you at the beginning of your trip and retrieves it at the end. You'll meet with your driver, or Surfer as we call them, at your scheduled delivery and return time. We do not have any physical rental counters. "
                        "You can use the YBRide Apple or Android app to do things like verify your license, edit your trip details including your address and dates, cancel the trip, or add additional drivers! "),

                  ],
                ),

              ),
            )


          ],
        ),
      ),
    ),
  );
}
Widget onTapAnswer(String title, String subTitle) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.start,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      ExpansionTile(
        title: HeadingTextWidget(
          title: title,
          fontSize: 20,
          fontWeight: FontWeight.w600,
          // textColor: AppColors.buttonColor,
        ),
        children: [
          Padding(
            padding: EdgeInsets.all(16.0),
            child: SubHeadingTextWidget(title: "  " + subTitle),
          ),
        ],
      ),
      // Divider(),
    ],
  );
}
