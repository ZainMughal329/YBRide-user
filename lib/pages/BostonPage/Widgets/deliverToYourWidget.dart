

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yb_ride_user_web/pages/BostonPage/controller.dart';
import 'package:yb_ride_user_web/pages/BostonPage/state.dart';

import '../../../components/headingTextWidget.dart';
import '../../../components/subHeadingText.dart';
import '../../../helper/appColors.dart';

Widget DeliverToYourDoorWidget(BuildContext context){
  final con = Get.put(BostonCon());
  final state = BostonState();
  return Container(
    decoration: BoxDecoration(
      // color: Colors.blue,
        image: DecorationImage(image: AssetImage('assets/images/homePage.webp'),fit: BoxFit.fill)
    ),
    height: 600,
    width: double.infinity,
    child: Padding(
      padding: const EdgeInsets.symmetric(horizontal:50),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 150,),
          HeadingTextWidget(title: 'Rental cars in Boston, MA',fontWeight: FontWeight.bold,fontSize: 40,textColor:AppColors.buttonColor,),
          SizedBox(height: 10,),
          HeadingTextWidget(title: 'Delivered to Your Door..',fontWeight: FontWeight.bold,fontSize: 40,textColor:AppColors.textColor,),
          SizedBox(height: 30,),
          Container(
            height: 195,
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.white70,
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 15,horizontal: 15),
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 5),
                  child: Column(
                    children: [
                      Container(
                        height: 110,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white,
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 30,horizontal: 15),

                          child: Row(
                            children: [
                              Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  HeadingTextWidget(title: 'Delivery & return location',fontSize: 18,fontWeight: FontWeight.bold,textColor: AppColors.buttonColor,),
                                  SizedBox(height: 7,),
                                  SubHeadingTextWidget(title: "Type in the exact address you want us to deliver & pick up.",fontWeight: FontWeight.bold,)
                                ],
                              ),
                              SizedBox(width: 50,),
                              HeadingTextWidget(title: '|',textColor:Colors.black54,fontSize: 70,fontWeight: FontWeight.w100),
                              SizedBox(width: 20,),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  HeadingTextWidget(title: 'From',fontSize: 18,fontWeight: FontWeight.bold,textColor: AppColors.buttonColor,),
                                  SizedBox(height: 7,),
                                  SubHeadingTextWidget(title: "Feb 03, 11.00 AM")
                                ],
                              ),
                              SizedBox(width: 20,),
                              HeadingTextWidget(title: '|',textColor:Colors.black54,fontSize: 70,fontWeight: FontWeight.w100),
                              SizedBox(width: 20,),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  HeadingTextWidget(title: 'To',fontSize: 18,fontWeight: FontWeight.bold,textColor: AppColors.buttonColor,),
                                  SizedBox(height: 7,),
                                  SubHeadingTextWidget(title: "Feb 07, 2.00 PM")
                                ],
                              ),
                              SizedBox(width: 70,),
                              Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: AppColors.buttonColor
                                ),
                                height: 140,
                                width: 140,
                                child: Center(child: HeadingTextWidget(title: 'Book a car',textColor: AppColors.whiteColor,)),
                              )




                            ],

                          ),
                        ),
                      ),
                      SizedBox(height: 10,),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            HeadingTextWidget(
                              title: 'Same delivery & return locations',
                              fontSize: 20,
                              fontWeight: FontWeight.w500,
                            ),
                            Spacer(),
                            Obx(() =>_checkBox(state.isCheckBox.value, (value) {
                              state.isCheckBox.value = value;
                            }, context), ),


                          ],
                        ),
                      ),



                    ],
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    ),
  );
}
Widget _checkBox(bool val, ValueChanged<bool>? onChanged,BuildContext context){
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