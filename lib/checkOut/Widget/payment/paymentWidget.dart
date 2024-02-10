

import 'dart:js';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yb_ride_user_web/checkOut/Widget/promoCode/promoCodeBottomSheet.dart';
import 'package:yb_ride_user_web/checkOut/state.dart';
import 'package:yb_ride_user_web/components/headingTextWidget.dart';
import 'package:yb_ride_user_web/components/subHeadingText.dart';
import 'package:yb_ride_user_web/components/textField.dart';

import '../../../components/countryCodeTextField.dart';

Widget paymentWidget(){
  final state = CheckOutState();
  return Container(
    decoration: BoxDecoration(
        border: Border.all(color: Colors.black54.withOpacity(.1)),
        borderRadius: BorderRadius.all(Radius.circular(10))
    ),
    child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 15,),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: HeadingTextWidget(title: '4. Payment',fontWeight: FontWeight.bold,fontSize: 30,),
          ),
          SizedBox(height: 15,),
          ReuseableTextField(contr: state.firstNameCon, label: 'Card Number',
              prefixIcon: Icon(Icons.credit_card_outlined),
              textInputAction: TextInputAction.next, keyboardType: TextInputType.text, obsecure: false),
          SizedBox(height: 15,),
          Row(
            children: [
              Expanded(child: ReuseableTextField(contr: state.firstNameCon, label: 'Expiration', textInputAction: TextInputAction.next, keyboardType: TextInputType.number, obsecure: false)),
              Expanded(child: ReuseableTextField(contr: state.lastNameCon, label: 'Security', textInputAction: TextInputAction.next, keyboardType: TextInputType.number, obsecure: false)),
              Expanded(child: ReuseableTextField(contr: state.lastNameCon, label: 'Zip', textInputAction: TextInputAction.done, keyboardType: TextInputType.number, obsecure: false)),
            ],
          ),
          SizedBox(height: 30,),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 17),
            child: SubHeadingTextWidget(
              title: "A temporary deposit of \$300.00 (\$500.00 for debit cards) will be held on your"
                  "card 24 hours before your trip starts, Typically, YBRide releases this deposit 3"
                  "days after your trip ends, but your bank may take an additional 5-10 business"
                  "day for processing. Trip longer than 27 days will have the deposit captured"
                  "and refunded after your trip.",
            ),
          ),

          SizedBox(height: 20,)





        ],
      ),
    ),
  );
}
Widget _checkBox(bool val, ValueChanged<bool>? onChanged){
  return Checkbox(
      shape: ContinuousRectangleBorder(
          borderRadius: BorderRadius.circular(8),
          side: BorderSide(
              color: Colors.grey.withOpacity(.2),width: .8
          )
      ),
      visualDensity: VisualDensity.compact,
      value: val, onChanged: (bool? value) {
    onChanged?.call(value!);


  });}