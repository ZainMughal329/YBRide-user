import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:yb_ride_user_web/Vehicle/view.dart';
import 'package:yb_ride_user_web/components/snackbar_widget.dart';
import 'package:yb_ride_user_web/helper/AppConstants.dart';
import 'package:yb_ride_user_web/homePage/HomePageWidget/newRangePicker.dart';
import 'package:yb_ride_user_web/homePage/HomePageWidget/rangePicker.dart';
import 'package:yb_ride_user_web/homePage/HomePageWidget/to_bottom_sheet.dart';
import 'package:yb_ride_user_web/homePage/HomePageWidget/where_bottom_sheet.dart';
import 'package:yb_ride_user_web/homePage/controller.dart';
import 'package:yb_ride_user_web/homePage/state.dart';
import '../../components/headingTextWidget.dart';
import '../../components/reuseableButton.dart';
import '../../components/reuseableTextField.dart';
import '../../components/subHeadingText.dart';
import '../../helper/appColors.dart';

Widget HomePageWidget(BuildContext context, HomePageCon controller) {
  // controller.getCurrentDate();

  return Container(
    decoration: BoxDecoration(
        // color: Colors.blue,
        image: DecorationImage(
            image: AssetImage('assets/images/homePage.webp'),
            fit: BoxFit.fill)),
    height: 600,
    width: double.infinity,
    child: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          HeadingTextWidget(
            title: 'Rental Cars, Your Way.',
            fontWeight: FontWeight.bold,
            fontSize: 40,
            textColor: Colors.white,
          ),
          SizedBox(
            height: 30,
          ),
          Container(
            height: 80,
            width: 700,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(100),
              color: Colors.white,
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 25),
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // where widgets

                      SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        child: Container(
                          width: MediaQuery.of(context).size.width * 0.10,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              HeadingTextWidget(
                                title: 'From',
                                fontSize: 13,
                                fontWeight: FontWeight.bold,
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Obx(() {
                                return controller
                                            .state.timeandDateSelected.value ==
                                        true
                                    ? SubHeadingTextWidget(
                                 fontSize: 12,textColor: Colors.grey,
                                        title:
                                            "${controller.state.fromMonthName.value} ${controller.state.fromDate.value}, ${controller.state.fromTime.value}")
                                    : SubHeadingTextWidget(
                                        title: "Select Start Date" , fontSize: 12,textColor: Colors.grey,);
                              }),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      HeadingTextWidget(
                          title: '|',
                          textColor: Colors.black54,
                          fontSize: 50,
                          fontWeight: FontWeight.w100),
                      // SizedBox(
                      //   width: 20,
                      // ),
                      Expanded(
                        child: Container(
                          width: MediaQuery.of(context).size.width * 0.10,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              HeadingTextWidget(
                                title: 'To',
                                fontSize: 13,
                                fontWeight: FontWeight.bold,
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Obx(() {
                                return controller
                                            .state.timeandDateSelected.value ==
                                        true
                                    ? SubHeadingTextWidget(
                                 fontSize: 12,textColor: Colors.grey,
                                        title:
                                            "${controller.state.toMonthName.value} ${controller.state.toDate.value}, ${controller.state.toTime.value}")
                                    : SubHeadingTextWidget(
                                    fontSize: 12,textColor: Colors.grey,
                        
                                        title: 'Select End Date');
                              }),
                            ],
                          ),
                        ),
                      ),
                      HeadingTextWidget(
                          title: '|',
                          textColor: Colors.black54,
                          fontSize: 50,
                          fontWeight: FontWeight.w100),
                      SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            // color: Colors.grey.withOpacity(.1)
                            color: AppColors.buttonColor,
                          ),
                          height: 70,
                          width: 130,
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 10),
                            child: Center(
                              child: InkWell(
                                onTap: () {
                                  // rangePicker(context, controller);
                                  newrangePicker(context, controller);
                                },
                                child: Center(
                                  child: HeadingTextWidget(
                                    title: 'Click to Select Date',
                                    textColor: Colors.white,
                                    fontSize: 10,                                fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),

          // 2nd row
          SizedBox(
            height: 20,
          ),
          Obx(() {
            return controller.state.timeandDateSelected.value == true
                ? Container(
                    height: 80,
                    width: 700,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      color: Colors.white,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 15, horizontal: 25),
                      child: Center(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              // where widgets
                              controller.state.selectedPlace.value ==
                                      'Tap to Search'
                                  ? Expanded(
                                    child: InkWell(
                                        onTap: () {
                                          whereBottomSheet(context, controller);
                                        },
                                        child: Container(
                                          width:
                                              MediaQuery.of(context).size.width *
                                                  0.10,
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              HeadingTextWidget(
                                                title: 'Where',
                                                fontSize: 13,
                                                fontWeight: FontWeight.bold,
                                              ),
                                              SizedBox(
                                                height: 5,
                                              ),
                                              SubHeadingTextWidget(
                                                  title:
                                                      "City,address,hotel,airport..",
                                                fontSize: 11,textColor: Colors.grey,maxLines: 3,overflow: TextOverflow.ellipsis,

                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                  )
                                  : Expanded(
                                    child: InkWell(
                                        onTap: () {
                                          whereBottomSheet(context, controller);
                                        },
                                        child: Center(
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              HeadingTextWidget(title: 'Where',fontSize: 13,),
                                              SizedBox(
                                                height: 5,
                                              ),
                                              Flexible(
                                                  child: SubHeadingTextWidget(
                                                title: controller
                                                    .state.selectedPlace.value,
                                                    fontSize: 11,maxLines: 1,overflow: TextOverflow.ellipsis,textColor: Colors.grey,
                                              )),
                                            ],
                                          ),
                                        ),
                                      ),
                                  ),
                              SizedBox(
                                width: 10,
                              ),
                              HeadingTextWidget(
                                  title: '|',
                                  textColor: Colors.black54,
                                  fontSize: 50,
                                  fontWeight: FontWeight.w100),

                              Expanded(
                                child: controller.state.returnPlace.value ==
                                        'Return Place'
                                    ? InkWell(
                                        onTap: () {
                                          toBottomSheet(context, controller);
                                        },
                                        child: Container(
                                          width:
                                              MediaQuery.of(context).size.width *
                                                  0.10,
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              HeadingTextWidget(
                                                title: 'To',
                                                fontSize: 13,
                                                fontWeight: FontWeight.bold,
                                              ),
                                              SizedBox(
                                                height: 5,
                                              ),
                                              SubHeadingTextWidget(
                                                  title:
                                                      "City,address,hotel,airport..",fontSize: 11,textColor: Colors.grey,maxLines: 1,overflow: TextOverflow.ellipsis,),
                                            ],
                                          ),
                                        ),
                                      )
                                    : InkWell(
                                        onTap: () {
                                          toBottomSheet(context, controller);
                                        },
                                        child: Center(
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              HeadingTextWidget(title: 'To',
                                              fontSize: 13,),
                                              SizedBox(
                                                height: 5,
                                              ),
                                              Flexible(
                                                  child: SubHeadingTextWidget(
                                                title: controller
                                                    .state.returnPlace.value,
                                                    fontSize: 11,textColor: Colors.grey,maxLines: 1,overflow: TextOverflow.ellipsis,
                                              )),
                                            ],
                                          ),
                                        ),
                                      ),
                              ),
                              HeadingTextWidget(
                                  title: '|',
                                  textColor: Colors.black54,
                                  fontSize: 50,
                                  fontWeight: FontWeight.w100),
                              SizedBox(
                                width: 10,
                              ),

                              Expanded(
                                child: Align(
                                  alignment: Alignment.centerRight,
                                  child: InkWell(
                                    onTap: () {
                                      if (controller.state.fromAddressSelected
                                                  .value ==
                                              true &&
                                          controller.state.toAddressSelected
                                                  .value ==
                                              true &&
                                          controller.state.timeandDateSelected
                                                  .value ==
                                              true) {
                                        controller.moveToSelectVehicleScreen();
                                      } else {
                                        Snackbar.showSnackBar(
                                            'YB-Ride',
                                            "Select All Information",
                                            Icons.error_outline);
                                      }
                                    },
                                    child: Container(
                                      height:70,
                                      width:130,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(20),
                                          // color: Colors.grey.withOpacity(.1),
                                          color:
                                          controller.state.fromAddressSelected
                                              .value ==
                                              true &&
                                              controller.state.toAddressSelected
                                                  .value ==
                                                  true &&
                                              controller.state.timeandDateSelected
                                                  .value ==
                                                  true ?
                                          AppColors.buttonColor : Colors.grey.withOpacity(.5),),
                                      child: Center(
                                          child: HeadingTextWidget(
                                        title: 'GO',
                                        fontSize: 10,
                                        textColor: Colors.white,
                                      )),
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  )
                : Container();
          })
        ],
      ),
    ),
  );
}

Widget HomePageWidgetMediumScreen(
    BuildContext context, HomePageCon controller) {
  // controller.getCurrentDate();
  final state = HomePageState();
  state.pickupController.addListener(
    () {
      if (state.pickupController.text.trim().isNotEmpty) {
        state.isButtonVisible.value = true;
      } else {
        state.isButtonVisible.value = false;
      }
    },
  );

  return Obx(
    () {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              decoration: BoxDecoration(
                  // color: Colors.blue,
                  borderRadius: BorderRadius.all(Radius.circular(15)),
                  image: DecorationImage(
                      image: AssetImage('assets/images/homePage.webp'),
                      fit: BoxFit.fill)),
              height: 350,
              // width: 800,
            ),
            SizedBox(
              height: 30,
            ),
            HeadingTextWidget(
              title: 'Rental Cars, Your-Way.',
              fontWeight: FontWeight.bold,
              fontSize: 30,
              textColor: Colors.black,
            ),
            SizedBox(
              height: 10,
            ),
            SubHeadingTextWidget(
                title: 'New clean cars, No lines or paperwork.'),
            SizedBox(
              height: 15,
            ),
            Row(
              children: [
                Expanded(
                  child: InkWell(
                    onTap: () {
                      rangePicker(context, controller);
                    },
                    child: Container(
                      height: 50,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: AppColors.buttonColor)),
                      child: Align(
                        alignment: Alignment.center,
                        child: controller.state.timeandDateSelected.value ==
                                true
                            ? SubHeadingTextWidget(
                                title:
                                    "${controller.state.fromMonthName.value} ${controller.state.fromDate.value}, ${controller.state.fromTime.value}")
                            : SubHeadingTextWidget(title: "Select Start Date"),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: InkWell(
                    onTap: () {
                      rangePicker(context, controller);
                    },
                    child: Container(
                      height: 50,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: AppColors.buttonColor)),
                      child: Align(
                          alignment: Alignment.center,
                          child: controller.state.timeandDateSelected.value ==
                                  true
                              ? SubHeadingTextWidget(
                                  title:
                                      "${controller.state.toMonthName.value} ${controller.state.toDate.value}, ${controller.state.toTime.value}")
                              : SubHeadingTextWidget(title: 'Select End Date')),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            controller.state.timeandDateSelected.value == true
                ? InkWell(
                    onTap: () {
                      whereBottomSheet(context, controller);
                    },
                    child: Container(
                      height: 50,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: AppColors.buttonColor)),
                      child: Padding(
                        padding: EdgeInsets.only(left: 10),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                              controller.state.selectedPlace.value.toString()),
                        ),
                      ),
                    ),
                  )
                : Container(),
            // reuseAbleTextField(state.pickupController, 'PickUp', TextInputType.text,
            //     TextInputAction.next),
            SizedBox(
              height: 15,
            ),
            controller.state.timeandDateSelected.value == true
                ? InkWell(
                    onTap: () {
                      toBottomSheet(context, controller);
                    },
                    child: Container(
                      height: 50,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: AppColors.buttonColor)),
                      child: Padding(
                        padding: EdgeInsets.only(left: 10),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                              controller.state.returnPlace.value.toString()),
                        ),
                      ),
                    ),
                  )
                : Container(),
            SizedBox(
              height: 15,
            ),

            SizedBox(
              height: 15,
            ),
            controller.state.timeandDateSelected.value == true
                ? RoundButton(
                    title: 'GO',
                    onPress: () {
                      if (controller.state.fromAddressSelected.value == true &&
                          controller.state.toAddressSelected.value == true &&
                          controller.state.timeandDateSelected.value == true) {
                        controller.moveToSelectVehicleScreen();
                      } else {
                        Snackbar.showSnackBar('YB-Ride',
                            "Select All Information", Icons.error_outline);
                      }
                    })
                : Container(),
          ],
        ),
      );
    },
  );
}

// Smal Address Widget
Widget HomePageWidgetSmallScreen(BuildContext context, HomePageCon controller) {
  final state = controller.state;
  state.pickupController.addListener(() {
    if (state.pickupController.text.trim().isNotEmpty) {
      state.isButtonVisible.value = true;
    } else {
      state.isButtonVisible.value = false;
    }
  });

  return Obx(() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            decoration: BoxDecoration(
                // color: Colors.blue,
                borderRadius: BorderRadius.all(Radius.circular(15)),
                image: DecorationImage(
                    image: AssetImage('assets/images/homePage.webp'),
                    fit: BoxFit.fill)),
            height: 200,
            width: 750,
          ),
          SizedBox(
            height: 30,
          ),
          HeadingTextWidget(
            title: 'Rental Cars, Your Way.',
            fontWeight: FontWeight.bold,
            fontSize: 30,
            textColor: Colors.black,
          ),
          SizedBox(
            height: 10,
          ),
          SubHeadingTextWidget(title: 'New clean cars, No lines or paperwork.'),
          SizedBox(
            height: 15,
          ),
          Row(
            children: [
              Expanded(
                child: InkWell(
                  onTap: () {
                    rangePicker(context, controller);
                  },
                  child: Container(
                    height: 50,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: AppColors.buttonColor)),
                    child: Align(
                      alignment: Alignment.center,
                      child: controller.state.timeandDateSelected.value == true
                          ? SubHeadingTextWidget(
                              title:
                                  "${controller.state.fromMonthName.value} ${controller.state.fromDate.value}, ${controller.state.fromTime.value}")
                          : SubHeadingTextWidget(title: "Select Start Date"),
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: 10,
              ),
              Expanded(
                child: InkWell(
                  onTap: () {
                    rangePicker(context, controller);
                  },
                  child: Container(
                    height: 50,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: AppColors.buttonColor)),
                    child: Align(
                        alignment: Alignment.center,
                        child: controller.state.timeandDateSelected.value ==
                                true
                            ? SubHeadingTextWidget(
                                title:
                                    "${controller.state.toMonthName.value} ${controller.state.toDate.value}, ${controller.state.toTime.value}")
                            : SubHeadingTextWidget(title: 'Select End Date')),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          controller.state.timeandDateSelected.value == true
              ? InkWell(
                  onTap: () {
                    whereBottomSheet(context, controller);
                  },
                  child: Container(
                    height: 50,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: AppColors.buttonColor)),
                    child: Padding(
                      padding: EdgeInsets.only(left: 10),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                            controller.state.selectedPlace.value.toString()),
                      ),
                    ),
                  ),
                )
              : Container(),
          SizedBox(
            height: 15,
          ),
          controller.state.timeandDateSelected.value == true
              ? InkWell(
                  onTap: () {
                    toBottomSheet(context, controller);
                  },
                  child: Container(
                    height: 50,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: AppColors.buttonColor)),
                    child: Padding(
                      padding: EdgeInsets.only(left: 10),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child:
                            Text(controller.state.returnPlace.value.toString()),
                      ),
                    ),
                  ),
                )
              : Container(),
          SizedBox(
            height: 15,
          ),

          // Row(
          //   children: [
          //     Obx(() =>
          //         _switchButtonWithOutAppSettings(state.isSwitchButtonVal.value, (value) {
          //
          //         }),
          //
          //     ),
          //     SizedBox(width: 10,),
          //     SubHeadingTextWidget(title: 'Same start and end address',fontSize: 12,)
          //   ],
          // ),
          SizedBox(
            height: 15,
          ),

          controller.state.timeandDateSelected.value == true
              ? RoundButton(
                  title: 'GO',
                  onPress: () {
                    if (controller.state.fromAddressSelected.value == true &&
                        controller.state.toAddressSelected.value == true &&
                        controller.state.timeandDateSelected.value == true) {
                      controller.moveToSelectVehicleScreen();
                    } else {
                      Snackbar.showSnackBar('YB-Ride', "Select All Information",
                          Icons.error_outline);
                    }
                  })
              : Container(),
        ],
      ),
    );
  });
}

Widget _switchButtonWithOutAppSettings(
    bool val, ValueChanged<bool>? onChanged) {
  return Switch(
    activeColor: AppColors.whiteColor,
    activeTrackColor: AppColors.whiteColor,
    value: val,
    onChanged: onChanged,
  );
}
