import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:yb_ride_user_web/checkOut/Widget/payment/payment_details_sheet.dart';
import 'package:yb_ride_user_web/checkOut/Widget/payment_con.dart';
import 'package:yb_ride_user_web/checkOut/controller.dart';
import 'package:yb_ride_user_web/components/reuseableButton.dart';
import 'package:yb_ride_user_web/components/snackbar_widget.dart';
import 'package:yb_ride_user_web/components/subHeadingText.dart';
import 'package:yb_ride_user_web/helper/responsive.dart';
import 'package:yb_ride_user_web/helper/AppConstants.dart';
import '../helper/appColors.dart';
import 'Widget/card_payment_widget/card_payment_widget.dart';
import 'Widget/coverage/CoverageWidget.dart';
import 'Widget/driver/driversWidgte.dart';
import 'Widget/payment/paymentWidget.dart';
import 'Widget/priceContainer/priceContainerWidget.dart';
import 'Widget/promoCode/promoCodeWidget.dart';
import 'Widget/tripDetails/tripDetailsWidget.dart';
import 'Widget/welcomeToYBride/welcometoYBRide.dart';

class CheckOutPage extends StatelessWidget {
  final double carPrice;
  final double carRent;
  final String carType;
  final String carDescription;

  CheckOutPage(
      {super.key,
      required this.carType,
      required this.carRent,
      required this.carPrice,
      required this.carDescription});

  Widget _checkBox(bool val, ValueChanged<bool>? onChanged) {
    return Checkbox(
        shape: ContinuousRectangleBorder(
            borderRadius: BorderRadius.circular(8),
            side: BorderSide(color: Colors.grey.withOpacity(.2), width: .8)),
        visualDensity: VisualDensity.compact,
        value: val,
        onChanged: (bool? value) {
          onChanged?.call(value!);
        });
  }

  final fNameCon = TextEditingController();
  final lNameCon = TextEditingController();
  final emailCon = TextEditingController();
  final phoneCon = TextEditingController();


  @override
  Widget build(BuildContext context) {
    final controller = Get.put(CheckOutCon());
    controller.getReceiptCharges();

    AppConstants.vehicleType = carType;
    controller.state.carPricePerDay = carPrice;
    controller.state.carRent = carRent;
    controller.state.totalPrice.value = carRent;
    controller.state.carDescription = carDescription;
    controller.getCheckoutPayments();
    // controller.fetchContactDetails();
    controller.getReceiptCharges();
    log('name:'+AppConstants.ybEmail.toString());
    // return Container();
    return Scaffold(

      body: Center(
        child: ResponsiveWidget.isLargeScreen(context)
            ? Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            SizedBox(
                              height: 20,
                            ),
                            // Image(image: AssetImage('assets/images/YBRIDE text.jpg',),height: 80,width: 80,),
                            SizedBox(
                              height: 10,
                            ),
                            Divider(
                              thickness: .6,
                            ),
                            SizedBox(
                              height: 30,
                            ),
                            welcomeYBRide(context),
                            SizedBox(
                              height: 20,
                            ),
                            driverWidget(context, controller,fNameCon,lNameCon,emailCon,phoneCon),
                            SizedBox(
                              height: 20,
                            ),
                            TripDetailsWidget(controller),
                            SizedBox(
                              height: 20,
                            ),
                            CoverageWidget(context, controller),
                            SizedBox(
                              height: 20,
                            ),
                            paymentWidget(),
                            SizedBox(
                              height: 20,
                            ),
                            promoCodeWidget(context, controller),
                            SizedBox(
                              height: 10,
                            ),
                            Divider(),
                            SizedBox(
                              height: 10,
                            ),
                            showAdminPayment(context),
                            SizedBox(
                              height: 20,
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 17.0),
                              child: Row(
                                children: [
                                  Obx(
                                    () => _checkBox(
                                      controller.state.paymentCheck.value,
                                      (value) {
                                        controller.state.paymentCheck.value =
                                            !controller.state.paymentCheck.value;
                                      },
                                    ),
                                  ),
                                  SizedBox(width: 10,),
                                  SubHeadingTextWidget(title: 'Agree and continue'),
                                ],
                              ),
                            ),
                            Obx(
                                () => controller.state.paymentCheck.value == false ?
                              Center(
                                child: Padding(
                                  padding: EdgeInsets.symmetric(vertical: 10 , horizontal: 40),
                                  child: InkWell(
                                    onTap: (){
                                      Snackbar.showSnackBar('YB-Ride', 'All fields must be filled', Icons.error);
                                    },
                                    borderRadius:  BorderRadius.circular(5),
                                    child: Container(
                                      height: 60,
                                      width: double.infinity,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(5),
                                        color: AppColors.buttonColor.withOpacity(.5),
                                      ),
                                      child: Center(
                                        child: Text(
                                          'Book Now',
                                          style: GoogleFonts.openSans(color: AppColors.buttonTextColor, fontSize: 14,fontWeight: FontWeight.w600),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              )


                                  : RoundButton(
                                  title: 'Book now',
                                  onPress: () {
                                    // print('name::'+nameCon.text);
                                    setValues(controller);
                                    print(AppConstants.bookingDate +
                                        fNameCon.text.trim.toString() +
                                        lNameCon.text +
                                        phoneCon.text.trim.toString() +
                                        emailCon.text+
                                        AppConstants.fromAddress +
                                        AppConstants.toAddress +
                                        AppConstants.fromDate +
                                        AppConstants.fromTimeinMiliSeconds +
                                        AppConstants.customCoverage.toString() +
                                        AppConstants.isDeliver.toString() +
                                        AppConstants.i_have_own.toString() +
                                        AppConstants.liabilityProtection
                                            .toString() +
                                        AppConstants.isPickup.toString() +
                                        AppConstants.isPromoApplied.toString() +
                                        AppConstants.standardProtection
                                            .toString() +
                                        AppConstants.under25Years.toString() +
                                        AppConstants.unlimitedMiles.toString() +
                                        AppConstants.rentDays.toString() +
                                        AppConstants.toDate.toString() +
                                        AppConstants.toTimeinMiliSeconds +
                                        AppConstants.totalCustomCoverage
                                            .toString() +
                                        AppConstants.vehicleType);
                                    showRecipetSheet(
                                      context,
                                      AppConstants.rentDays,
                                      AppConstants.totalPrice.toStringAsFixed(2),
                                      DateTime.now().toString(),
                                      '${AppConstants.fromDate} ${AppConstants.fromTime}',
                                      '${AppConstants.toDate} ${AppConstants.toTime}',
                                      AppConstants.rentDays,
                                      AppConstants.bookingDate,
                                      'Card Payment',
                                      {
                                        'Liability Charges\nRent & others':
                                        AppConstants.totalPrice,
                                        'Boston Police Training Fees':
                                        AppConstants.bostonPoliceFees,
                                        'Boston Parking Surcharge':
                                        AppConstants.bostonParking,
                                        'Boston Convention Center\nFinancing Surcharge':
                                        AppConstants.bostonConventionCenter,
                                        'Delivery and Return':
                                        AppConstants.deliveryCharges,
                                        'Temporary Deposit':
                                        AppConstants.tempDeposit,
                                      },
                                    );
                                  }),
                            ),
                            SizedBox(
                              height: 30,
                            ),
                            SubHeadingTextWidget(
                                title:
                                    'By continuing, you confirm that you have read and accepted the trip information'),
                            SizedBox(
                              height: 5,
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 50),
                              child: SubHeadingTextWidget(
                                title: 'Terms and Conditions',
                              ),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 50),
                              child: SubHeadingTextWidget(
                                title:
                                    'You can also view a sample rental contact',
                              ),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Expanded(child: priceContainerWidget(controller))
                  ],
                ),
              )
            : ResponsiveWidget.isMediumScreen(context)
                ? Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          SizedBox(
                            height: 20,
                          ),
                          // Image(image: AssetImage('assets/images/YBRIDE text.jpg',),height: 80,width: 80,),
                          SizedBox(
                            height: 10,
                          ),
                          Divider(
                            thickness: .6,
                          ),
                          SizedBox(
                            height: 30,
                          ),

                          SizedBox(
                            height: 20,
                          ),
                          priceContainerWidgetSmall(),
                          welcomeYBRide(context),
                          SizedBox(
                            height: 20,
                          ),
                          driverWidget(context, controller,fNameCon,lNameCon,emailCon,phoneCon),
                          SizedBox(
                            height: 20,
                          ),
                          TripDetailsWidget(controller),
                          SizedBox(
                            height: 20,
                          ),
                          CoverageWidget(context, controller),
                          SizedBox(
                            height: 20,
                          ),
                          paymentWidget(),
                          SizedBox(
                            height: 20,
                          ),
                          promoCodeWidget(context, controller),
                          SizedBox(
                            height: 10,
                          ),
                          Divider(),
                          SizedBox(
                            height: 10,
                          ),
                          showAdminPayment(context),
                          SizedBox(
                            height: 10,
                          ),
                          Divider(),
                          SizedBox(
                            height: 10,
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 17.0),
                            child: Row(
                              children: [
                                Obx(
                                      () => _checkBox(
                                    controller.state.paymentCheck.value,
                                        (value) {
                                      controller.state.paymentCheck.value =
                                      !controller.state.paymentCheck.value;
                                    },
                                  ),
                                ),
                                SizedBox(width: 10,),
                                SubHeadingTextWidget(title: 'Agree and continue'),
                              ],
                            ),
                          ),
                          Obx(
                                () => controller.state.paymentCheck.value == false ?
                            Center(
                              child: Padding(
                                padding: EdgeInsets.symmetric(vertical: 10 , horizontal: 40),
                                child: InkWell(
                                  onTap: (){
                                    Snackbar.showSnackBar('YB-Ride', 'All fields must be filled', Icons.error);
                                  },
                                  borderRadius:  BorderRadius.circular(5),
                                  child: Container(
                                    height: 60,
                                    width: double.infinity,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5),
                                      color: AppColors.buttonColor.withOpacity(.5),
                                    ),
                                    child: Center(
                                      child: Text(
                                        'Book Now',
                                        style: GoogleFonts.openSans(color: AppColors.buttonTextColor, fontSize: 14,fontWeight: FontWeight.w600),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            )


                                : RoundButton(
                                title: 'Book now',
                                onPress: () {
                                  setValues(controller);
                                  print(AppConstants.bookingDate +
                                      controller.state.firstNameCon.text.trim.toString() +
                                      controller.state.lastNameCon.text.trim.toString() +
                                      controller.state.phoneNumCon.text.trim.toString() +
                                      controller.state.emailCon.text.trim.toString() +
                                      AppConstants.fromAddress +
                                      AppConstants.toAddress +
                                      AppConstants.fromDate +
                                      AppConstants.fromTimeinMiliSeconds +
                                      AppConstants.customCoverage.toString() +
                                      AppConstants.isDeliver.toString() +
                                      AppConstants.i_have_own.toString() +
                                      AppConstants.liabilityProtection
                                          .toString() +
                                      AppConstants.isPickup.toString() +
                                      AppConstants.isPromoApplied.toString() +
                                      AppConstants.standardProtection
                                          .toString() +
                                      AppConstants.under25Years.toString() +
                                      AppConstants.unlimitedMiles.toString() +
                                      AppConstants.rentDays.toString() +
                                      AppConstants.toDate.toString() +
                                      AppConstants.toTimeinMiliSeconds +
                                      AppConstants.totalCustomCoverage
                                          .toString() +
                                      AppConstants.vehicleType);
                                  showRecipetSheet(
                                    context,
                                    AppConstants.rentDays,
                                    AppConstants.totalPrice.toStringAsFixed(2),
                                    DateTime.now().toString(),
                                    '${AppConstants.fromDate} ${AppConstants.fromTime}',
                                    '${AppConstants.toDate} ${AppConstants.toTime}',
                                    AppConstants.rentDays,
                                    AppConstants.bookingDate,
                                    'Card Payment',
                                    {
                                      'Liability Charges\nRent & others':
                                      AppConstants.totalPrice,
                                      'Boston Police Training Fees':
                                      AppConstants.bostonPoliceFees,
                                      'Boston Parking Surcharge':
                                      AppConstants.bostonParking,
                                      'Boston Convention Center\nFinancing Surcharge':
                                      AppConstants.bostonConventionCenter,
                                      'Delivery and Return':
                                      AppConstants.deliveryCharges,
                                      'Temporary Deposit':
                                      AppConstants.tempDeposit,
                                    },
                                  );
                                }),
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          SubHeadingTextWidget(
                              title:
                                  'By continuing, you confirm that you have read and accepted the trip information'),
                          SizedBox(
                            height: 5,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 50),
                            child: SubHeadingTextWidget(
                              title: 'Terms and Conditions',
                            ),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 50),
                            child: SubHeadingTextWidget(
                              title:
                                  'You can also view a sample rental contact',
                            ),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                        ],
                      ),
                    ),
                  )
                : Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          SizedBox(
                            height: 20,
                          ),
                          // Image(image: AssetImage('assets/images/YBRIDE text.jpg',),height: 80,width: 80,),
                          SizedBox(
                            height: 10,
                          ),
                          Divider(
                            thickness: .6,
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          welcomeYBRide(context),
                          SizedBox(
                            height: 20,
                          ),
                          priceContainerWidgetSmall(),
                          SizedBox(
                            height: 20,
                          ),
                          driverWidgetSmall(fNameCon,lNameCon,emailCon,phoneCon),
                          SizedBox(
                            height: 20,
                          ),
                          TripDetailsWidgetSmall(),
                          SizedBox(
                            height: 20,
                          ),
                          CoverageWidgetSmall(context, controller),
                          SizedBox(
                            height: 20,
                          ),
                          paymentWidgetSmall(),
                          SizedBox(
                            height: 20,
                          ),
                          promoCodeWidget(context, controller),
                          SizedBox(
                            height: 10,
                          ),
                          Divider(),
                          SizedBox(
                            height: 10,
                          ),
                          showAdminPaymentSmall(context),
                          SizedBox(
                            height: 10,
                          ),
                          Divider(),
                          SizedBox(
                            height: 10,
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 17.0),
                            child: Row(
                              children: [
                                Obx(
                                      () => _checkBox(
                                    controller.state.paymentCheck.value,
                                        (value) {
                                      controller.state.paymentCheck.value =
                                      !controller.state.paymentCheck.value;
                                    },
                                  ),
                                ),
                                SizedBox(width: 10,),
                                SubHeadingTextWidget(title: 'Agree and continue'),
                              ],
                            ),
                          ),
                          Obx(
                                () => controller.state.paymentCheck.value == false ?
                            Center(
                              child: Padding(
                                padding: EdgeInsets.symmetric(vertical: 10 , horizontal: 40),
                                child: InkWell(
                                  onTap: (){
                                    final contt = Get.put(PaymentController());
                                    contt.createPaymentIntent();
                                    Snackbar.showSnackBar('YB-Ride', 'All fields must be filled', Icons.error);
                                  },
                                  borderRadius:  BorderRadius.circular(5),
                                  child: Container(
                                    height: 60,
                                    width: double.infinity,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5),
                                      color: AppColors.buttonColor.withOpacity(.5),
                                    ),
                                    child: Center(
                                      child: Text(
                                        'Book Now',
                                        style: GoogleFonts.openSans(color: AppColors.buttonTextColor, fontSize: 14,fontWeight: FontWeight.w600),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            )


                                : RoundButton(
                                title: 'Book now',
                                onPress: () {
                                  setValues(controller);
                                  print(AppConstants.bookingDate +
                                      controller.state.firstNameCon.text.trim.toString() +
                                      controller.state.lastNameCon.text.trim.toString() +
                                      controller.state.phoneNumCon.text.trim.toString() +
                                      controller.state.emailCon.text.trim.toString() +
                                      AppConstants.fromAddress +
                                      AppConstants.toAddress +
                                      AppConstants.fromDate +
                                      AppConstants.fromTimeinMiliSeconds +
                                      AppConstants.customCoverage.toString() +
                                      AppConstants.isDeliver.toString() +
                                      AppConstants.i_have_own.toString() +
                                      AppConstants.liabilityProtection
                                          .toString() +
                                      AppConstants.isPickup.toString() +
                                      AppConstants.isPromoApplied.toString() +
                                      AppConstants.standardProtection
                                          .toString() +
                                      AppConstants.under25Years.toString() +
                                      AppConstants.unlimitedMiles.toString() +
                                      AppConstants.rentDays.toString() +
                                      AppConstants.toDate.toString() +
                                      AppConstants.toTimeinMiliSeconds +
                                      AppConstants.totalCustomCoverage
                                          .toString() +
                                      AppConstants.vehicleType);
                                  showRecipetSheet(
                                    context,
                                    AppConstants.rentDays,
                                    AppConstants.totalPrice.toStringAsFixed(2),
                                    DateTime.now().toString(),
                                    '${AppConstants.fromDate} ${AppConstants.fromTime}',
                                    '${AppConstants.toDate} ${AppConstants.toTime}',
                                    AppConstants.rentDays,
                                    AppConstants.bookingDate,
                                    'Card Payment',
                                    {
                                      'Liability Charges\nRent & others':
                                      AppConstants.totalPrice,
                                      'Boston Police Training Fees':
                                      AppConstants.bostonPoliceFees,
                                      'Boston Parking Surcharge':
                                      AppConstants.bostonParking,
                                      'Boston Convention Center\nFinancing Surcharge':
                                      AppConstants.bostonConventionCenter,
                                      'Delivery and Return':
                                      AppConstants.deliveryCharges,
                                      'Temporary Deposit':
                                      AppConstants.tempDeposit,
                                    },
                                  );
                                }),
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          SubHeadingTextWidget(
                            title:
                                'By continuing, you confirm that you have read and accepted the trip information',
                            fontSize: 12,
                            textColor: Colors.black,
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 50),
                            child: SubHeadingTextWidget(
                              title: 'Terms and Conditions',
                              fontSize: 13,
                              textColor: Colors.black,
                            ),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 50),
                            child: SubHeadingTextWidget(
                              title:
                                  'You can also view a sample rental contact',
                              fontSize: 13,
                              textColor: Colors.black,
                            ),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                        ],
                      ),
                    ),
                  ),
      ),
    );
  }

  void setValues(CheckOutCon controller) {
    AppConstants.totalPrice = controller.state.totalPrice.value;
    AppConstants.vehicleType = carType;

    AppConstants.custFirstName =
        fNameCon.text;
    AppConstants.custLastName =
        lNameCon.text;
    AppConstants.custEmail = emailCon.text;
    AppConstants.custPhoneNo =
        phoneCon.text;

    // condition for getting vehicle
    if (controller.state.isSelfPickup.value == true) {
      AppConstants.isPickup = true;
      AppConstants.isDeliver = false;
    } else {
      AppConstants.isPickup = false;
      AppConstants.isDeliver = true;
    }
    // condition for extra miles and driving license
    if (controller.state.UnlimitedMiles.value == true) {
      AppConstants.unlimitedMiles = true;
    } else {
      AppConstants.unlimitedMiles = false;
    }
    if (controller.state.isDriverAge.value == true) {
      AppConstants.under25Years = true;
    } else {
      AppConstants.under25Years = false;
    }
    //coverage conditions
    if (controller.state.standardCoverage.value == true) {
      AppConstants.standardProtection = true;
    } else {
      AppConstants.standardProtection = false;
    }

    if (controller.state.liabilityInsurance.value == true) {
      AppConstants.liabilityProtection = true;
    } else {
      AppConstants.liabilityProtection = false;
    }

    if (controller.state.iHaveMyOwn.value == true) {
      AppConstants.i_have_own = true;
    } else {
      AppConstants.i_have_own = false;
    }

    //customCoverageConditions
    if (controller.state.customCoverageValue == true) {
      AppConstants.customCoverage = true;
      if (controller.state.cdwSwitchVal.value == true) {
        controller.addInTotalCustomCoverageValue(controller.state.CDW!);
      }
      if (controller.state.rcliSwitchVal.value == true) {
        controller.addInTotalCustomCoverageValue(controller.state.RCLI!);
      }
      if (controller.state.assistantSwitchVal.value == true) {
        controller.addInTotalCustomCoverageValue(controller.state.assistance!);
      }
      if (controller.state.sliSwitchVal.value == true) {
        controller.addInTotalCustomCoverageValue(controller.state.SLI!);
      }
    } else {
      AppConstants.customCoverage = false;
      AppConstants.totalCustomCoverage = 0.0;
    }
    AppConstants.bookingDate = DateTime.now().millisecondsSinceEpoch.toString();
  }
}
