import 'package:flutter/material.dart';


import 'package:get/get.dart';
import 'package:yb_ride_user_web/Vehicle/view.dart';
import 'package:yb_ride_user_web/components/snackbar_widget.dart';
import 'package:yb_ride_user_web/helper/AppConstants.dart';
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
  controller.getCurrentDate();


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
            textColor: AppColors.textColor,
          ),
          SizedBox(
            height: 30,
          ),
          Container(
            height: 100,
            // width: 800,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(100),
              color: Colors.white,
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 35),
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // where widgets
                      Obx((){
                        return controller.state.selectedPlace.value=='Tap to Search' ? InkWell(
                          onTap: (){
                            whereBottomSheet(context, controller);
                          },
                          child: Container(
                            width: MediaQuery.of(context).size.width * 0.15,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                HeadingTextWidget(title: 'Where',fontSize: 14,fontWeight: FontWeight.bold,),
                                SizedBox(
                                  height: 10,
                                ),
                                SubHeadingTextWidget(
                                    title: "City,address,hotel,airport.."),
                              ],
                            ),
                          ),
                        ) : Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              HeadingTextWidget(title: 'Where'),
                              Flexible(child: SubHeadingTextWidget(title: controller.state.selectedPlace.value,)),
                            ],
                          ),
                        );
                      }),
                      SizedBox(
                        width: 50,
                      ),
                      HeadingTextWidget(
                          title: '|',
                          textColor: Colors.black54,
                          fontSize: 50,
                          fontWeight: FontWeight.w100),
                      // to widgets
                      Obx((){
                        return controller.state.returnPlace.value=='Return Place' ? InkWell(
                          onTap: (){
                            toBottomSheet(context, controller);
                          },
                          child: Container(
                            width: MediaQuery.of(context).size.width * 0.15,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                HeadingTextWidget(title: 'To',fontSize: 14,fontWeight: FontWeight.bold,),
                                SizedBox(
                                  height: 10,
                                ),
                                SubHeadingTextWidget(
                                    title: "City,address,hotel,airport.."),
                              ],
                            ),
                          ),
                        ) : Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              HeadingTextWidget(title: 'To'),
                              Flexible(child: SubHeadingTextWidget(title: controller.state.returnPlace.value,)),
                            ],
                          ),
                        );
                      }),
                      // SizedBox(
                      //   width: 50,
                      // ),
                      HeadingTextWidget(
                          title: '|',
                          textColor: Colors.black54,
                          fontSize: 50,
                          fontWeight: FontWeight.w100),
                      SizedBox(
                        width: 20,
                      ),
                      InkWell(
                        onTap: (){
                          rangePicker(context,controller);
                        },
                        child: Container(
                          width: MediaQuery.of(context).size.width * 0.15,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              HeadingTextWidget(
                                title: 'From',
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Obx((){
                                return SubHeadingTextWidget(title: "${controller.state.fromMonthName.value} ${controller.state.fromDate.value}, ${controller.state.fromTime.value}");
                              }),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      HeadingTextWidget(
                          title: '|',
                          textColor: Colors.black54,
                          fontSize: 50,
                          fontWeight: FontWeight.w100),
                      // SizedBox(
                      //   width: 20,
                      // ),
                      InkWell(
                        onTap: (){
                          // rangePicker(context,controller);
                        },
                        child: Container(
                          width: MediaQuery.of(context).size.width * 0.15,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              HeadingTextWidget(
                                title: 'To',
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Obx((){
                                return SubHeadingTextWidget(title: "${controller.state.toMonthName.value} ${controller.state.toDate.value}, ${controller.state.toTime.value}");
                              }),
                            ],
                          ),
                        ),
                      ),
                      // SizedBox(
                      //   width: 30,
                      // ),
                      InkWell(
                        onTap: (){
                          if(controller.state.fromAddressSelected.value==true &&
                              controller.state.toAddressSelected.value==true&&
                              controller.state.timeandDateSelected.value==true
                          ){
                            controller.moveToSelectVehicleScreen();
                          }else{
                            Snackbar.showSnackBar('YB-Ride', "Select All Information", Icons.error_outline);
                          }
                        },
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(100),
                              color: Colors.grey.withOpacity(.1)),
                          height: 60,
                          width: 50,
                          child: Center(
                              child: HeadingTextWidget(title: 'GO')),
                        ),
                      )
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

Widget HomePageWidgetMediumScreen(HomePageCon controller) {
  final state = HomePageState();
  state.pickupController.addListener(() {
    if (state.pickupController.text.trim().isNotEmpty) {
      state.isButtonVisible.value = true;
    } else {
      state.isButtonVisible.value = false;
    }
  });

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
        reuseAbleTextField(state.pickupController, 'PickUp', TextInputType.text,
            TextInputAction.next),
        SizedBox(
          height: 15,
        ),
        reuseAbleTextField(state.returnController, 'Return', TextInputType.text,
            TextInputAction.next),
        SizedBox(
          height: 15,
        ),
        Row(
          children: [
            Expanded(
                child: reuseAbleTextField(state.fromController, 'From',
                    TextInputType.text, TextInputAction.next)),
            SizedBox(
              width: 10,
            ),
            Expanded(
                child: reuseAbleTextField(state.toController, 'To',
                    TextInputType.text, TextInputAction.next))
          ],
        ),
        SizedBox(
          height: 10,
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

        Obx(() => state.isButtonVisible.value
            ? RoundButton(title: 'GO', onPress: () {})
            : SizedBox())
      ],
    ),
  );
}

Widget HomePageWidgetSmallScreen(HomePageCon controller) {
  final state = HomePageState();
  state.pickupController.addListener(() {
    if (state.pickupController.text.trim().isNotEmpty) {
      state.isButtonVisible.value = true;
    } else {
      state.isButtonVisible.value = false;
    }
  });

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
        reuseAbleTextField(state.pickupController, 'PickUp', TextInputType.text,
            TextInputAction.next),
        SizedBox(
          height: 15,
        ),
        reuseAbleTextField(state.returnController, 'Return', TextInputType.text,
            TextInputAction.next),
        SizedBox(
          height: 15,
        ),
        Row(
          children: [
            Expanded(
                child: reuseAbleTextField(state.fromController, 'From',
                    TextInputType.text, TextInputAction.next)),
            SizedBox(
              width: 10,
            ),
            Expanded(
                child: reuseAbleTextField(state.toController, 'To',
                    TextInputType.text, TextInputAction.next))
          ],
        ),
        SizedBox(
          height: 10,
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

        Obx(() => state.isButtonVisible.value
            ? RoundButton(title: 'GO', onPress: () {})
            : SizedBox())
      ],
    ),
  );
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
