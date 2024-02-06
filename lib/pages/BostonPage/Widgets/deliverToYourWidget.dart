

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yb_ride_user_web/components/reuseableButton.dart';
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
      child: Center(
        child: Container(
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
      ),
    ),
  );
}
Widget DeliverToYourDoorWidgetMediumPage(BuildContext context){
  final con = Get.put(BostonCon());
  final state = BostonState();
  return Container(

    decoration: BoxDecoration(
      // color: Colors.white,
      //   image: DecorationImage(image: AssetImage('assets/images/homePage.webp'),fit: BoxFit.fill),


    ),
    height: 600,
    width: double.infinity,
    child: Padding(
      padding: const EdgeInsets.symmetric(horizontal:20),
      child: Center(
        child: Container(

          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 50,),
              HeadingTextWidget(title: 'Rental cars in Boston, MA',fontWeight: FontWeight.bold,fontSize: 25,textColor:AppColors.buttonColor,),
              SizedBox(height: 10,),
              HeadingTextWidget(title: 'Delivered to Your Door..',fontWeight: FontWeight.bold,fontSize: 42,textColor:AppColors.blackColor,),
              SizedBox(height: 30,),
              Padding(
                padding:  EdgeInsets.symmetric(horizontal: 30),
                child: Container(
                  height: 90,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(.1),
                        blurRadius: 5,
                        spreadRadius: 1,offset: Offset(1,1),
                      )
                    ],
                    color: Colors.white,


                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Expanded(
                          flex: 2,
                          child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Spacer(),
                            SubHeadingTextWidget(title: 'Delivery and Return Location' , textColor: AppColors.buttonColor,fontSize: 15,fontWeight: FontWeight.w600,),
                            SubHeadingTextWidget(title: 'Type the exact address you want us to...' , textColor: Colors.grey,fontSize: 13,fontWeight: FontWeight.w600, maxLines: 1,overflow: TextOverflow.ellipsis,),
                            Spacer(),

                          ],
                        ),),
                        VerticalDivider(),

                        Expanded(child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,

                          children: [
                            Spacer(),

                            SubHeadingTextWidget(title: 'From' , textColor: AppColors.buttonColor,fontSize: 15,fontWeight: FontWeight.w600,),
                            SubHeadingTextWidget(title: "Feb 03, 11.00 AM" , textColor: Colors.black,fontSize: 13,fontWeight: FontWeight.w600, maxLines: 1,overflow: TextOverflow.ellipsis,),
                            Spacer(),

                          ],
                        ),),
                        VerticalDivider(),

                        Expanded(
                          flex: 2,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,

                            children: [
                              Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Spacer(),
                                SubHeadingTextWidget(title: 'To' , textColor: AppColors.buttonColor,fontSize: 15,fontWeight: FontWeight.w600,),
                                SubHeadingTextWidget(title: 'Feb 03, 11:00 AM' , textColor: Colors.black,fontSize: 13,fontWeight: FontWeight.w600,),
                                Spacer(),

                              ],
                                                      ),
                              Container(
                                height: 50,
                                width: 90,
                                decoration: BoxDecoration(
                                  color: AppColors.buttonColor,
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                child: Center(
                                  child: HeadingTextWidget(title: 'Book a car' , textColor: AppColors.buttonTextColor,fontSize: 14,),
                                ),
                              ),
                            ],
                          ),),

                      ],
                    ),
                  ),
                ),

              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    HeadingTextWidget(
                      title: 'Same delivery & return locations',
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
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
  );
}

Widget DeliverToYourDoorWidgetSmall(BuildContext context){
  final con = Get.put(BostonCon());
  final state = BostonState();
  return Container(

    decoration: BoxDecoration(

    ),
    height: 600,
    width: double.infinity,
    child: Padding(
      padding: const EdgeInsets.symmetric(horizontal:20),
      child: Center(
        child: Container(

          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 50,),
              Center(child: HeadingTextWidget(title: 'Rental cars in Boston, MA',fontWeight: FontWeight.bold,fontSize: 17,textColor:AppColors.buttonColor,)),
              SizedBox(height: 15,),
              Center(child: HeadingTextWidget(title: 'Delivered to Your Door.',fontWeight: FontWeight.bold,fontSize: 22,textColor:AppColors.blackColor,)),
              SizedBox(height: 20,),
              Padding(
                padding:  EdgeInsets.symmetric(horizontal: 10),
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(.2),
                        blurRadius: 5,
                        spreadRadius: 1,offset: Offset(1,1),
                      )
                    ],
                    color: Colors.white,


                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              Icon(Icons.location_pin,color: Colors.black,),
                              SizedBox(width: 10,),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  HeadingTextWidget(title: 'Delivery Location', textColor: AppColors.buttonColor,fontSize: 13,fontWeight: FontWeight.w600,),
                                   SizedBox(height: 10,),
                                   HeadingTextWidget(title: 'Tap to search', textColor: Colors.grey,fontSize: 13,fontWeight: FontWeight.w600,),
                                ],
                              ),
                            ],
                          ),
                        ),
                        Divider(),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              Icon(Icons.location_pin,color: Colors.black,),
                              SizedBox(width: 10,),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  HeadingTextWidget(title: 'Return Location', textColor: AppColors.buttonColor,fontSize: 13,fontWeight: FontWeight.w600,),
                                  SizedBox(height: 10,),
                                  HeadingTextWidget(title: 'Tap to search', textColor: Colors.grey,fontSize: 13,fontWeight: FontWeight.w600,),
                                ],
                              ),
                            ],
                          ),
                        ),
                        Divider(),
                        Padding(
                          padding: const EdgeInsets.all(8),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              HeadingTextWidget(
                                title: 'Same delivery & return locations',
                                fontSize: 13,
                                fontWeight: FontWeight.w600,
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
              SizedBox(height: 10,),
              Padding(
                padding:  EdgeInsets.symmetric(horizontal: 10),
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(.2),
                        blurRadius: 5,
                        spreadRadius: 1,offset: Offset(1,1),
                      )
                    ],
                    color: Colors.white,


                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              Icon(Icons.calendar_month,color: Colors.black,),
                              SizedBox(width: 10,),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      HeadingTextWidget(title: 'From', textColor: AppColors.buttonColor,fontSize: 13,fontWeight: FontWeight.w600,),
                                      SizedBox(width: 10,),
                                      HeadingTextWidget(title: 'Feb 07, 11:00 PM', textColor: Colors.black,fontSize: 13,fontWeight: FontWeight.w600,),
                                    ],
                                  ),
                                  SizedBox(height: 10,),
                                  Row(
                                    children: [
                                      HeadingTextWidget(title: 'To', textColor: AppColors.buttonColor,fontSize: 13,fontWeight: FontWeight.w600,),
                                      SizedBox(width: 10,),
                                      HeadingTextWidget(title: 'Feb 07, 11:00 PM', textColor: Colors.black,fontSize: 13,fontWeight: FontWeight.w600,),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),


                      ],
                    ),
                  ),
                ),

              ),
              SizedBox(height: 10,),

              RoundButton(title: 'Book a car', onPress: (){

              }),
            ],
          ),
        ),
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