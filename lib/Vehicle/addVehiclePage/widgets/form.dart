import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../helper/responsive.dart';
import '../../../components/headingTextWidget.dart';
import '../../../components/reuseableButton.dart';
import '../../../helper/appColors.dart';
import '../controller.dart';

class AddVehicleForm extends StatelessWidget {
  static String id = '\webPageAddVehicleForm';

  AddVehicleForm({super.key});

  final con = Get.put(VehicleController());
  Widget _reuseAbleTextField(
      TextEditingController controller,
      String hint,
      String labelText,
  TextInputType textInputType,
      String helperText,
      TextInputAction textInputAction) {
    return TextField(
      textInputAction: textInputAction,
      keyboardType: textInputType,
      controller: controller,
      style: GoogleFonts.openSans(
          fontSize: 15,
          color: Colors.black,
          fontWeight: FontWeight.bold
      ),

      decoration: InputDecoration(
        helperText: helperText,
        helperStyle: GoogleFonts.openSans(
          fontSize: 14,
          fontWeight: FontWeight.w500,
          color: Colors.grey,
        ),
        alignLabelWithHint: true,
        hintText: hint,
        label: HeadingTextWidget(title: labelText,
          fontSize: 14,
          fontWeight: FontWeight.w500,),
        hintStyle: GoogleFonts.openSans(
          fontSize: 14,
          fontWeight: FontWeight.w500,
        ),
        border: OutlineInputBorder(),
        enabled: true,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: AppColors.nonActiveTextFieldColor),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: AppColors.activeTextFieldColor),
        ),
        labelStyle: GoogleFonts.openSans(
          fontSize: 14,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }

  Widget typeList() {
    return Obx(() {
      return Padding(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            HeadingTextWidget(title: 'Vehicle Type'),
            DropdownButton(
                iconEnabledColor: AppColors.buttonColor,
                hint: Text(
                  con.state.typeVal.value,
                  style: GoogleFonts.poppins(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                items: con.state.typeItems,
                onChanged: (value) {
                  con.state.typeVal.value = value.toString();
                }),
          ],
        ),
      );
    });
  }


  Widget fuelTypeList() {
    return Obx(() {
      return Padding(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            HeadingTextWidget(title: 'Fuel Type'),
            DropdownButton(
                iconEnabledColor: AppColors.buttonColor,
                hint: Text(
                  con.state.fuelTypeVal.value,
                  style: GoogleFonts.poppins(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                items: con.state.fuelTypeItems,
                onChanged: (value) {
                  con.state.fuelTypeVal.value = value.toString();
                }),
          ],
        ),
      );
    });
  }

  Widget transmissionList() {
    return Obx(() {
      return Padding(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            HeadingTextWidget(title: 'Transmission Type'),
            DropdownButton(
                iconEnabledColor: AppColors.buttonColor,
                hint: Text(
                  con.state.transmissionVal.value,
                  style: GoogleFonts.poppins(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                items: con.state.transmissionItems,
                onChanged: (value) {
                  con.state.transmissionVal.value = value.toString();
                }),
          ],
        ),
      );
    });
  }

  Widget bluetoothList() {
    return Obx(() {
      return Padding(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            HeadingTextWidget(title: 'Bluetooth'),
            DropdownButton(
                iconEnabledColor: AppColors.buttonColor,
                hint: Text(
                  con.state.bluetoothVal.value,
                  style: GoogleFonts.poppins(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                items: con.state.bluetoothItems,
                onChanged: (value) {
                  con.state.bluetoothVal.value = value.toString();
                }),
          ],
        ),
      );
    });
  }

  Widget acList() {
    return Obx(() {
      return Padding(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            HeadingTextWidget(title: 'A/C'),
            DropdownButton(
                iconEnabledColor: AppColors.buttonColor,
                hint: Text(
                  con.state.acVal.value,
                  style: GoogleFonts.poppins(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                items: con.state.acItems,
                onChanged: (value) {
                  con.state.acVal.value = value.toString();
                }),
          ],
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    con.getAllTypeValues();

    return Scaffold(
      backgroundColor: Color.fromRGBO(255, 255, 255, 1),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                alignment: Alignment.topLeft,
                child: HeadingTextWidget(
                  title: 'Coupons',
                  fontSize: 22,
                ),
                // child: Text('Manage Drivers' ,),
              ),
              SizedBox(
                height: 20,
              ),
              ResponsiveWidget.isLargeScreen(context) ? Padding(
                padding: EdgeInsets.all(18.0),
                child: Container(
                  height: 500,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Color.fromRGBO(255, 255, 255, 1),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(.1),
                        blurRadius: 5,
                        spreadRadius: 1,
                        offset: Offset(1, 1),
                      ),


                    ],
                  ),
                  child: Column(
                    children: [
                      Spacer(),
                      Container(
                        height: 300,
                        width: MediaQuery.of(context).size.width * .5,
                        decoration: BoxDecoration(
                          color: Color.fromRGBO(255, 255, 255, 1),
                          border: Border.all(
                            color: Colors.black12,
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(.1),
                              blurRadius: 5,
                              spreadRadius: 1,
                              offset: Offset(1, 1),
                            ),


                          ],
                        ),

                        child: Padding(
                          padding: EdgeInsets.all(18.0),
                          child: Column(
                            children: [
                              Align(
                                alignment: Alignment.topLeft,
                                child: HeadingTextWidget(title: 'Coupons Details' , textColor: Colors.black,),
                              ),
                              SizedBox(height: 35,),
                              Row(
                                children: [
                                  Expanded(
                                    child: _reuseAbleTextField(con.state.vehicleController, 'Vehicle Name',
                                        'Vehicle Name', TextInputType.text,
                                        'Enter Vehicle Name',
                                        TextInputAction.next),
                                  ),
                                  SizedBox(width: 16.0),
                                  Expanded(
                                    child: _reuseAbleTextField(con.state.seatsController, 'No. of seats',
                                        'No. of seats', TextInputType.number, 'Number of seats' ,TextInputAction.next),
                                  ),
                                ],
                              ),
                              SizedBox(height: 16.0),
                              Row(
                                children: [
                                  Expanded(
                                    child: _reuseAbleTextField(
                                        con.state.suitcaseController,
                                        'No. of suitcases',
                                        'No. of suitcases',
                                        TextInputType.number,
                                        'No. of suitcases',
                                        TextInputAction.next),
                                  ),
                                  SizedBox(width: 16.0),
                                  Expanded(
                                    child: _reuseAbleTextField(
                                        con.state.descriptionController,
                                        'About vehicle',
                                        'About vehicle',
                                        TextInputType.text,
                                        'About vehicle(2 lines)',
                                        TextInputAction.next),
                                  ),
                                ],
                              ),
                              SizedBox(height: 16.0),
                              Row(
                                children: [
                                  Expanded(
                                    child: _reuseAbleTextField(
                                        con.state.pricePerDayController,
                                        'Price Per Day',
                                        'Price Per Day',
                                        TextInputType.number,
                                        'Price Per Day',

                                        TextInputAction.next),
                                  ),
                                  SizedBox(width: 16.0),
                                  Container(),
                                ],
                              ),
                              SizedBox(height: 16.0),
                              Row(
                                children: [
                                  Expanded(child: fuelTypeList()),
                                  SizedBox(width: 16.0),
                                  Expanded(child: transmissionList()),
                                ],
                              ),
                              SizedBox(height: 16.0),
                              Row(
                                children: [
                                  Expanded(child: bluetoothList(),),
                                  SizedBox(width: 16.0),
                                  Expanded(child: acList(),),
                                ],
                              ),
                              SizedBox(height: 16.0),

                              RoundButton(
                                title: 'Save',
                                onPress: () {
                                  if (con.state.typeVal.value == '' &&
                                      con.state.pricePerDayController.text.isEmpty &&
                                      con.state.suitcaseController.text.isEmpty &&
                                      con.state.seatsController.text.isEmpty &&
                                      con.state.vehicleController.text.isEmpty &&
                                      con.state.descriptionController.text.isEmpty &&
                                      con.state.transmissionVal.value == '' &&
                                      con.state.fuelTypeVal.value == '' &&
                                      con.state.acVal.value == '' &&
                                      con.state.bluetoothVal.value == ''

                                  ) {
                                    log('All fields must be filled');
                                  } else {
                                    // con.storeDataInDatabase(context , con.state.typeVal.value);
                                  }
                                },
                              ),
                            ],
                          ),
                        ),
                      ),
                      Spacer(),

                    ],
                  ),
                ),
              ) : Padding(
                padding: EdgeInsets.all(18.0),
                child: Container(
                  height: 550,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Color.fromRGBO(255, 255, 255, 1),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(.1),
                        blurRadius: 5,
                        spreadRadius: 1,
                        offset: Offset(1, 1),
                      ),


                    ],
                  ),
                  child: Column(
                    children: [
                      Spacer(),
                      Padding(
                        padding: EdgeInsets.all(18.0),
                        child: Container(
                          height: 350,
                          width: MediaQuery.of(context).size.width * .9,
                          decoration: BoxDecoration(
                            color: Color.fromRGBO(255, 255, 255, 1),
                            border: Border.all(
                              color: Colors.black12,
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(.1),
                                blurRadius: 5,
                                spreadRadius: 1,
                                offset: Offset(1, 1),
                              ),


                            ],
                          ),

                          child: Padding(
                            padding: EdgeInsets.all(18.0),
                            child: Column(
                              children: [
                                Align(
                                  alignment: Alignment.topLeft,
                                  child: HeadingTextWidget(title: 'Coupons Details' , textColor: Colors.black,),
                                ),
                                SizedBox(height: 35,),
                                _reuseAbleTextField(con.state.vehicleController, 'Vehicle Name',
                                    'Vehicle Name', TextInputType.text,
                                    'Enter Vehicle Name',
                                    TextInputAction.next),
                                SizedBox(height: 16.0),
                                _reuseAbleTextField(con.state.seatsController, 'No. of seats',

                                    'No. of seats', TextInputType.number, 'Number of seats' ,TextInputAction.next),
                                SizedBox(height: 16.0),
                                _reuseAbleTextField(
                                    con.state.suitcaseController,
                                    'No. of suitcases',
                                    'No. of suitcases',
                                    TextInputType.number,
                                    'No. of suitcases',
                                    TextInputAction.next),
                                SizedBox(height: 16.0),
                                _reuseAbleTextField(
                                    con.state.descriptionController,
                                    'About vehicle',
                                    'About vehicle',
                                    TextInputType.text,
                                    'About vehicle(2 lines)',
                                    TextInputAction.next),
                                SizedBox(height: 16.0),
                                _reuseAbleTextField(
                                    con.state.pricePerDayController,
                                    'Price Per Day',
                                    'Price Per Day',
                                    TextInputType.number,
                                    'Price Per Day',

                                    TextInputAction.next),
                                SizedBox(height: 16.0),
                                fuelTypeList(),
                                SizedBox(height: 16.0),
                                transmissionList(),
                                SizedBox(height: 16.0),
                                bluetoothList(),
                                SizedBox(height: 16.0),
                                acList(),
                                SizedBox(height: 16.0),

                                RoundButton(
                                  title: 'Save',
                                  onPress: () {
                                    if (con.state.typeVal.value == '' &&
                                        con.state.pricePerDayController.text.isEmpty &&
                                        con.state.suitcaseController.text.isEmpty &&
                                        con.state.seatsController.text.isEmpty &&
                                        con.state.vehicleController.text.isEmpty &&
                                        con.state.descriptionController.text.isEmpty &&
                                        con.state.transmissionVal.value == '' &&
                                        con.state.fuelTypeVal.value == '' &&
                                        con.state.acVal.value == '' &&
                                        con.state.bluetoothVal.value == ''

                                    ) {
                                      log('All fields must be filled');
                                    } else {
                                      // con.storeDataInDatabase(context , con.state.typeVal.value);
                                    }
                                  },
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Spacer(),

                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),

    );
  }
}
