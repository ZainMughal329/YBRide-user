

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:yb_ride_user_web/Vehicle/Controller.dart';

import '../../components/headingTextWidget.dart';
import '../../components/subHeadingText.dart';
import '../../helper/appColors.dart';

Widget weekDayContainer(){
  final controller = VehicleCon();
  return Material(
    child:
    Obx(
          () => controller.state.isContainerVisible.value
          ? Padding(
            padding: EdgeInsets.symmetric(
                vertical: 10,
                horizontal: 70),
            child: Container(

                    child: Padding(
            padding: EdgeInsets.symmetric(
                vertical: 20,
                horizontal: 30),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    CircleAvatar(
                      child: Icon(
                        Icons.done,
                        color: Colors.white,
                        size: 15,
                      ),
                      backgroundColor: AppColors.buttonColor,
                      radius: 12,
                    ),
                    SizedBox(
                      width:20,
                    ),
                    HeadingTextWidget(
                      title: 'Weekday Savings Included',
                      textColor: AppColors.buttonColor,
                      fontSize: 20,
                    ),
                    SizedBox(
                      width: 600,
                    ),
                    GestureDetector(
                        onTap: () {
                          controller.hideContainer();
                        },
                        child: Icon(
                          FontAwesomeIcons.xmark,
                          color: Colors.black,
                          size: 20,
                        ))
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                SubHeadingTextWidget(
                  title:
                  'Your booking includes a weekday -you have the best prices 💸',
                  textColor: Colors.black,
                  fontSize: 18,
                ),
              ],
            ),
                    ),
                    decoration: BoxDecoration(
              color: Color.fromRGBO(255, 255, 255, 1),
              boxShadow: [
                BoxShadow(color: Colors.black.withOpacity(1))
              ],
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                  color: Colors.grey),
                  )

                ),
          ):SizedBox())
  );
}