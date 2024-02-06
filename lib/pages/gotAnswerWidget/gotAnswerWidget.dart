import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:yb_ride_user_web/helper/appColors.dart';

import '../../components/headingTextWidget.dart';
import '../../components/subHeadingText.dart';
import '../../helper/responsive.dart';

Widget gotAnswerWidget(BuildContext context) {
  return Row(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Expanded(
          child: Column(
        children: [
          HeadingTextWidget(
            title: 'We’ve got answers',
            fontWeight: FontWeight.bold,
            fontSize: 40,
          ),
          SizedBox(
            height: 10,
          ),
          SubHeadingTextWidget(
              title:
                  'Can’t find what you’re looking for? Visit our Help Center.')
        ],
      )),
      SizedBox(
        width: 30,
      ),
      Expanded(
          child: Column(
        children: [
          onTapAnswer(
              'Do you own your cars',
              'Yes! We buy our cars direct from manufacturers like Volkswagen, Hyundai, and Audi. We clean and maintain our vehicles so you can enjoy peace of mind on your trip.',
              context),
          onTapAnswer(
              'How does the delivery work?',
              "A YBRide Surfer will deliver your vehicle to your chosen address within 15 minutes of your scheduled delivery. You’ll receive updates via SMS and can track the delivery on our app. After your Surfer takes photos of the vehicle and verifies your driver’s license, you’re good to go!",
              context),
          onTapAnswer(
              'How old do I need to be book a kyte?',
              'Our minimum required age is 21 everywhere, except 18 in New York.',
              context),
          onTapAnswer(
              'Can I extend my trip?',
              "Trip extensions are subject to vehicle availability. You may extend for as long as you’d like, just let us know at least 2 hours before your original scheduled return. Extensions made within 2 hours of your return will incur a \$25 rescheduling fee to cover our Surfers’ time.",
              context),
          onTapAnswer(
              'How does Self Pickups & Return work?',
              "or maximum flexibility, we offer a 2 hour window from your scheduled time to pick up or return your car. We’ll send you instructions on where and how to meet us. After we take photos of the vehicle and verify your driver’s license, you’re good to go!",
              context),
          onTapAnswer(
              'What payment method does YBRide accept?',
              "We accept all major credit and debit cards. If using a debit card, the standard deposit during your booking will be \$500. We do not accept cash or pre-paid debit card payments for the booking cost or the deposit.",
              context),
          onTapAnswer(
              'What is the cancellation plicy?',
              "We get it, plans change. Cancellations made 48 hours prior to your scheduled delivery time are eligible for a full refund to your original payment method. Cancellations made within 48 hours of your scheduled delivery time are eligible for a full refund in Kyte credit. Cancellations made within 24 hours of your scheduled delivery time will be subject to a \$25 cancellation fee which will be deducted from your refunded YBRide credit.",
              context)
        ],
      )),
    ],
  );
}

Widget gotAnswerWidgetMediumScreen(BuildContext context) {
  return Container(
    width: 450,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        HeadingTextWidget(
          title: 'We’ve got answers',
          fontWeight: FontWeight.bold,
          fontSize: ResponsiveWidget.isLargeScreen(context) ? 40 : 26,
        ),
        SizedBox(
          height: 10,
        ),
        SubHeadingTextWidget(
          title: 'Can’t find what you’re looking for? Visit our Help Center.',
          textColor: AppColors.blackColor,
          fontWeight: FontWeight.normal,
          fontSize: ResponsiveWidget.isLargeScreen(context) ? 16 : 14,
        ),
        SizedBox(
          height: 50,
        ),
        onTapAnswer(
            'Do you own your cars',
            'Yes! We buy our cars direct from manufacturers like Volkswagen, Hyundai, and Audi. We clean and maintain our vehicles so you can enjoy peace of mind on your trip.',
            context),
        onTapAnswer(
            'How does the delivery work?',
            "A YBRide Surfer will deliver your vehicle to your chosen address within 15 minutes of your scheduled delivery. You’ll receive updates via SMS and can track the delivery on our app. After your Surfer takes photos of the vehicle and verifies your driver’s license, you’re good to go!",
            context),
        onTapAnswer(
            'How old do I need to be book a kyte?',
            'Our minimum required age is 21 everywhere, except 18 in New York.',
            context),
        onTapAnswer(
            'Can I extend my trip?',
            "Trip extensions are subject to vehicle availability. You may extend for as long as you’d like, just let us know at least 2 hours before your original scheduled return. Extensions made within 2 hours of your return will incur a \$25 rescheduling fee to cover our Surfers’ time.",
            context),
        onTapAnswer(
            'How does Self Pickups & Return work?',
            "or maximum flexibility, we offer a 2 hour window from your scheduled time to pick up or return your car. We’ll send you instructions on where and how to meet us. After we take photos of the vehicle and verify your driver’s license, you’re good to go!",
            context),
        onTapAnswer(
            'What payment method does YBRide accept?',
            "We accept all major credit and debit cards. If using a debit card, the standard deposit during your booking will be \$500. We do not accept cash or pre-paid debit card payments for the booking cost or the deposit.",
            context),
        onTapAnswer(
            'What is the cancellation plicy?',
            "We get it, plans change. Cancellations made 48 hours prior to your scheduled delivery time are eligible for a full refund to your original payment method. Cancellations made within 48 hours of your scheduled delivery time are eligible for a full refund in Kyte credit. Cancellations made within 24 hours of your scheduled delivery time will be subject to a \$25 cancellation fee which will be deducted from your refunded YBRide credit.",
            context),
      ],
    ),
  );
}

Widget onTapAnswer(String title, String subTitle, BuildContext context) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.start,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Theme(
        data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
        child: ExpansionTile(
          title: HeadingTextWidget(
            title: title,
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
          children: [
            Padding(
              padding: EdgeInsets.all(16.0),
              child: SubHeadingTextWidget(title: "  " + subTitle),
            ),
          ],
        ),
      ),
      // Divider(),
    ],
  );
}
