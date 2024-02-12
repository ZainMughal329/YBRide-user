import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:http/http.dart' as http;
import 'package:yb_ride_user_web/components/headingTextWidget.dart';
import 'package:yb_ride_user_web/homePage/controller.dart';

import '../../../../main.dart';

Future timeSelBottomSheet(
    BuildContext context, HomePageCon cont, bool isStartTime) {
  return showModalBottomSheet(
    context: context,
    // isScrollControlled: true,
    // useSafeArea: true,
    isDismissible: true,
    enableDrag: true,
    backgroundColor: Colors.white,
    builder: (BuildContext context) {
      return Container(
        height: 200,
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(15),
            topRight: Radius.circular(15),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.5), // Shadow color
              spreadRadius: 1, // Spread radius
              blurRadius: 5, // Blur radius
              offset: Offset(0,
                  -3), // Offset in the negative y-axis to create a top shadow
            ),
          ],
          color: Colors.white,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              // height: 10,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 10,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      InkWell(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 5),
                          child: Container(
                            width: 20,
                            child: IconButton(
                                onPressed: (){
                              Navigator.pop(context);
                            }, icon: Icon(Icons.cancel_outlined)),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(width: 50,),
                  HeadingTextWidget(
                    title:
                    isStartTime ? 'Select Start Time' : 'Select End Time',
                    fontWeight: FontWeight.w600,
                    fontSize: 19,
                    textColor: Colors.black,
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 10),
              child: Divider(),
            ),
            Obx((){
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    HeadingTextWidget(
                      title: isStartTime
                          ? cont.state.fromTime.value
                          : cont.state.toTime.value,

                      textColor: Colors.black,
                    ),
                    DropdownButton(
                      borderRadius: BorderRadius.all(Radius.circular(10),),
                      style: GoogleFonts.openSans(
                        color: Colors.black,
                      ),
                      hint: isStartTime
                          ? Text('${cont.state.fromTime.value}')
                          : Text('${cont.state.toTime.value}'),
                      items: cont.state.items,
                      onChanged: (value) {
                        isStartTime
                            ? cont.state.fromTime.value = value
                            : cont.state.toTime.value= value;
                      },),
                  ],
                ),
              );
            }),
          ],
        ),
      );
    },
  );
}
