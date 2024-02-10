

import 'dart:js';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yb_ride_user_web/checkOut/state.dart';
import 'package:yb_ride_user_web/components/headingTextWidget.dart';
import 'package:yb_ride_user_web/components/subHeadingText.dart';
import 'package:yb_ride_user_web/components/textField.dart';

import '../../../components/countryCodeTextField.dart';
import 'customCoverage.dart';

Widget CoverageWidget(BuildContext context){
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
            child: HeadingTextWidget(title: '3. Coverage',fontWeight: FontWeight.bold,fontSize: 30,),
          ),
          SizedBox(height: 20,),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 17),
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  border: Border.all(color: Colors.black54)
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 20,horizontal: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        HeadingTextWidget(title: 'Standard Coverage'),
                        Obx(() =>_checkBox(state.standardCoverage.value, (value) {
                          state.standardCoverage.value = value;
                        }),),

                      ],),
                    SizedBox(height: 10,),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SubHeadingTextWidget(title: 'Provides liability insurance which is a mandatory legal requirements in all'
                            '50 states, and covers any damage done to the car past a \$500 deductible'),
                        SizedBox(height: 10,),
                        SubHeadingTextWidget(title: '\$49.98 | day'),

                      ],
                    )

                  ],
                ),
              ),
            ),
          ),
          SizedBox(height: 20,),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 17),
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  border: Border.all(color: Colors.black54)
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 20,horizontal: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        HeadingTextWidget(title: 'Liability insurance'),
                        Obx(() =>_checkBox(state.liabilityInsurance.value, (value) {
                          state.liabilityInsurance.value = value;
                        }),),

                      ],),
                    SizedBox(height: 10,),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SubHeadingTextWidget(title: 'Provides liability insurance which is a mandatory legal requirements in all'
                            '50 states. Driving without liability insurance is illegal'),
                        SizedBox(height: 10,),
                        SubHeadingTextWidget(title: '\$19.98 | day'),
                      ],
                    ),

                  ],
                ),
              ),
            ),
          ),
          SizedBox(height: 20,),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 17),
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  border: Border.all(color: Colors.black54)
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 20,horizontal: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        HeadingTextWidget(title: 'I have my own'),
                        Obx(() =>_checkBox(state.iHaveMyOwn.value, (value) {
                          state.iHaveMyOwn.value = value;
                        }),),

                      ],),
                    SizedBox(height: 10,),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SubHeadingTextWidget(title: "You have your own insurance that complies with local requirements. You"
                            "understand that is illegal to drive without liability insurance, and that"
                            "you'll be liable for any damage done to a 3rd party."),
                        SizedBox(height: 10,),
                        SubHeadingTextWidget(title: '\$0.00 | day'),
                      ],
                    )

                  ],
                ),
              ),
            ),
          ),
          SizedBox(height: 20,),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 17),
            child: Container(
              width: 277,
              height: 50,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(100)),
                color: Colors.grey.shade100
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
                child: Center(
                  child: InkWell(
                      onTap: (){
                        coverageBottomSheet(context);

                      },
                      child: HeadingTextWidget(title: 'Add custom coverage',)),
                ),
              ),
            ),
          ),
          SizedBox(height: 20,),
          Divider(color: Colors.black54,),
          SizedBox(height: 20,),
          ListTile(
            leading: Icon(Icons.location_on),
            title: HeadingTextWidget(title: 'Unlimited miles',),
            subtitle: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SubHeadingTextWidget(title: '300 miles/day included before upgrading.We charge'),
                SubHeadingTextWidget(title: '\$0.45/mile after that'),
              ],
            ),
            trailing: Obx(() =>_checkBox(state.UnlimitedMiles.value, (value) {
              state.UnlimitedMiles.value = value;
            }),),
          ),
          SizedBox(height: 20,),








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