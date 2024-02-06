import 'package:flutter/material.dart';
import 'package:yb_ride_user_web/components/subHeadingText.dart';

import '../../../../../../components/headingTextWidget.dart';
import '../../../../../../helper/appColors.dart';

Widget VerificationandDriverWidgte(){

  return Material(
    child: Container(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 150,vertical: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SubHeadingTextWidget(title: 'All Collections > Verification & Driver Requirements'),
            SizedBox(height: 20,),
            Icon(Icons.person,color: AppColors.buttonColor,size: 50,),
            SizedBox(height: 20,),
            HeadingTextWidget(title: 'Verification & Driver Requirements'),
            SizedBox(height: 20,),
            SubHeadingTextWidget(title: '8 articles'),
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
                    onTapAnswer('Can I book a trip with a foreign/international driver’s license?',

                        "es, you can! If we need additional information, we'll send a separate link where you can submit a photo of your passport after you've booked your trip. You should also physically have your license during the handoffs."),
                    onTapAnswer('How To Verify Your Account?',
                        "Before delivering your YBRide, we will need to verify your account! Please note, if verification is not complete 2 hours before your scheduled delivery time, we may need to delay your Kyte delivery. To avoid any delays, make sure you complete your verification right after booking!"),
                    onTapAnswer('Who needs to be the primary driver?', "The primary driver for every trip booked under an account is the account holder. "),
                    onTapAnswer('Verification Requirements for Renting?', "You must be 21 years or older (please note, all drivers under the age of 25 are subject to a Young Renter Fee"
                    "You must be 18 years or older in New York state."
                        "You must a valid driver’s license. Your driver's license must be valid though the entire rental period."),
                    onTapAnswer('How old do I need to be to book a YBRide?', "Drivers under the age of 25 will be charged an additional Young Renter Fee The value of the fee may vary by region. The exact rate can be viewed in the price details section after selecting I am under 25 years old when making a booking on YBRide."),
                    onTapAnswer("Accepted Driver's Licenses by Country", "Australia,Azerbaijan 🇦🇿 ,Bahrain ,Belgium"),
                    onTapAnswer("What's the verification process for additional drivers?", "Looks like you're about to embark on a YBRide adventure! First, let's make sure you have everything you need before your trip begins."),
                    onTapAnswer('Why was my verification declined??', "We understand changes in plans can be frustrating. If you do not meet our eligibility requirements, we immediately cancel your trip and process a refund back to your original form of payment. This should be reflected in your bank account within 5-7 business days."),
                    onTapAnswer('Who needs to be the primary driver?', "The primary driver for every trip booked under an account is the account holder. "),

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
