

import 'dart:js';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:yb_ride_user_web/checkOut/controller.dart';
import 'package:yb_ride_user_web/checkOut/state.dart';
import 'package:yb_ride_user_web/components/headingTextWidget.dart';
import 'package:yb_ride_user_web/components/subHeadingText.dart';
import 'package:yb_ride_user_web/components/textField.dart';
import 'package:yb_ride_user_web/helper/appColors.dart';

import '../../../components/countryCodeTextField.dart';
import 'customCoverage.dart';

Widget CoverageWidget(BuildContext context,CheckOutCon controller){
  final state = controller.state;
  controller.getCheckoutPayments();
  controller.getReceiptCharges();
  print("standard"+state.standard.toString());
  return Obx((){
    return controller.state.dataLoaded.value==true ? Container(
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
                          Obx(() =>_checkBox(state.standardCoverage.value,
                                (value) {
                              state.standardCoverage.value = value;
                              if(value==true){
                                controller.addInTotalPrice(state.standard, true);
                              }
                              if(value==false){
                                controller.subtractFromTotalPrince(state.standard, true);
                              }
                            },
                          ),),

                        ],),
                      SizedBox(height: 10,),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SubHeadingTextWidget(title: 'Provides liability insurance which is a mandatory legal requirements in all'
                              '50 states, and covers any damage done to the car past a \$500 deductible'),
                          SizedBox(height: 10,),
                          SubHeadingTextWidget(title: '\$${state.standard} | day'),

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
                          Obx(() =>_checkBox(state.liabilityInsurance.value,
                                  (value) {
                                state.liabilityInsurance.value = value;
                                if(value==true){
                                  controller.addInTotalPrice(state.essential, true);
                                }
                                if(value==false){
                                  controller.subtractFromTotalPrince(state.essential, true);
                                }
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
                          SubHeadingTextWidget(title: '\$${state.essential} | day'),
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
                          Obx(() =>_checkBox(state.iHaveMyOwn.value,
                                  (value) {
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
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
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
                              coverageBottomSheet(context,controller);

                            },
                            child: HeadingTextWidget(title: 'Add custom coverage',)),
                      ),
                    ),
                  ),
                  _switchButtonWithOutAppSettings(
                      state.customCoverageValue.value, (value) {
                    if(value==false){
                      state.customCoverageValue.value=false;
                      if(state.cdwSwitchVal.value==true){
                        state.cdwSwitchVal.value=false;
                        controller.subtractFromTotalPrince(state.CDW, true);
                      }
                      if(state.rcliSwitchVal.value==true){
                        state.rcliSwitchVal.value=false;
                        controller.subtractFromTotalPrince(state.RCLI, true);
                      }
                      if(state.assistantSwitchVal.value==true){
                        state.assistantSwitchVal.value=false;
                        controller.subtractFromTotalPrince(state.assistance, true);
                      }
                      if(state.sliSwitchVal.value==true){
                        state.sliSwitchVal.value=false;
                        controller.subtractFromTotalPrince(state.SLI, true);
                      }
                    }
                    if(value==true){
                      coverageBottomSheet(context, controller);
                    }
                  }),
                ],
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
              trailing: Obx(() =>_checkBox(state.UnlimitedMiles.value,
                      (value) {
                        if(value==true){
                          controller.addInTotalPrice(state.unlimitedMiles, true);
                        }
                        if(value==false){
                          controller.subtractFromTotalPrince(state.unlimitedMiles, true);
                        }
                        state.UnlimitedMiles.value = value;
              }),),
            ),
            SizedBox(height: 20,),








          ],
        ),
      ),
    ) : Container(
      child: Lottie.asset('assets/lottie/loading2.json'),
    );
  });
}


Widget CoverageWidgetSmall(BuildContext context,CheckOutCon controller){
  final state = controller.state;
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
            child: HeadingTextWidget(title: '3. Coverage',fontWeight: FontWeight.bold,fontSize: 23,),
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
                        HeadingTextWidget(title: 'Standard Coverage',fontSize: 15,),
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
                            '50 states, and covers any damage done to the car past a \$500 deductible',fontSize: 13,textColor: Colors.black,),
                        SizedBox(height: 10,),
                        SubHeadingTextWidget(title: '\$49.98 | day',fontSize: 13,textColor: Colors.black,),

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
                        HeadingTextWidget(title: 'Liability insurance',fontSize: 15,),
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
                            '50 states. Driving without liability insurance is illegal',fontSize: 13,textColor: Colors.black,),
                        SizedBox(height: 10,),
                        SubHeadingTextWidget(title: '\$19.98 | day',fontSize: 13,textColor: Colors.black,),
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
                        HeadingTextWidget(title: 'I have my own',fontSize: 15,),
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
                            "you'll be liable for any damage done to a 3rd party.",fontSize: 13,textColor: Colors.black,),
                        SizedBox(height: 10,),
                        SubHeadingTextWidget(title: '\$0.00 | day',fontSize: 13,textColor: Colors.black,),
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
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
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
                            coverageBottomSheet(context,controller);

                          },
                          child: HeadingTextWidget(title: 'Add custom coverage',fontSize: 13,textColor: Colors.black,)),
                    ),
                  ),
                ),
                _switchButtonWithOutAppSettings(state.customCoverageValue.value, (value) { })
              ],
            ),
          ),
          SizedBox(height: 20,),
          Divider(color: Colors.black54,),
          SizedBox(height: 20,),
          ListTile(
            leading: Icon(Icons.location_on),
            title: HeadingTextWidget(title: 'Unlimited miles',fontSize: 15,),
            subtitle: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SubHeadingTextWidget(title: '300 miles/day included before upgrading.We charge',fontSize: 13,textColor: Colors.black,),
                SubHeadingTextWidget(title: '\$0.45/mile after that',fontSize: 13,textColor: Colors.black,),
              ],
            ),
            trailing: Obx(() =>_checkBox(state.UnlimitedMiles.value,
                    (value) {
              if(value==true){
                controller.addInTotalPrice(state.unlimitedMiles, true);
              }
              if(value==false){
                controller.subtractFromTotalPrince(state.unlimitedMiles, true);
              }
              state.UnlimitedMiles.value = value;
            },
            ),),
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
Widget _switchButtonWithOutAppSettings(
    bool val, ValueChanged<bool>? onChanged) {
  return Switch(
    activeColor: AppColors.whiteColor,
    activeTrackColor: AppColors.buttonColor,
    value: val,
    onChanged: onChanged,
  );
}