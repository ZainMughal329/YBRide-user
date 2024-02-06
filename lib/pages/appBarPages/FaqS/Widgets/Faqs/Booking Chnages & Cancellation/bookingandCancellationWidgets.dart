import 'package:flutter/material.dart';
import 'package:yb_ride_user_web/components/subHeadingText.dart';

import '../../../../../../components/headingTextWidget.dart';
import '../../../../../../helper/appColors.dart';

Widget BookingandCancellationWidgte(){

  return Material(
    child: Container(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 150,vertical: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SubHeadingTextWidget(title: 'All Collections > Booking & Cancellations'),
            SizedBox(height: 20,),
            Icon(Icons.edit_note,color: AppColors.buttonColor,size: 50,),
            SizedBox(height: 20,),
            HeadingTextWidget(title: 'Booking & Cancellations'),
            SizedBox(height: 20,),
            SubHeadingTextWidget(title: '4 articles'),
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
                    onTapAnswer('What is the cancellation policy for booking?', "Cancellations made 48 hours prior to your scheduled delivery time are eligible for a full refund to your original payment method."
                        "Cancellations made within 48 hours of your scheduled delivery time are eligible for a full refund in YBRide credit."
                        "Cancellations made within 24 hours of your scheduled delivery time will be subject to a \$25 cancellation fee which will be deducted from your refunded YBRide credit."),
                    onTapAnswer('How can I edit my trip? can I extend or shorten it ?', "Need to change your trip dates, times, or address? No problem, you can do it through our App or on our Website! Just follow the steps below:"
                        "Sign in to your YBRide account through the YBRide App or our website"
                        "Go to 'My Trips'."
                        "Tap the trip you'd like to edit."
                        "Tap 'Edit' in the Where & When section."
                        "Just change the trip details and press the confirm button."),
                    onTapAnswer('Can I add additional drivers?', "We know trips are more fun with friends! You can add up to 4 additional drivers at no additional cost on your trip's page. All drivers must be added up to 2 hours before the trip begins, so we have time to verify their accounts."),
                    onTapAnswer('Where can I find my rental agreement?', "With the YBRide counter-free guarantee, there's no need to bother with paperwork. "
                        "Your digital rental agreement is available in the app. When you get your Kyte, you will also receive a link to your rental agreement after signing!"),
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
