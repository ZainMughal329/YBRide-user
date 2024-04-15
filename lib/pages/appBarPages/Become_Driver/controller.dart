
import 'package:fl_country_code_picker/fl_country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yb_ride_user_web/helper/api.dart';
import 'package:yb_ride_user_web/pages/appBarPages/Become_Driver/state.dart';

import '../../../helper/appColors.dart';
import '../../../model/surferModel/surferModel.dart';

class BecomeDriverCon extends GetxController{

  final state = BecomeDriverState();


  void toggleCollapsed() {
    state.isCollapsed.value = !state.isCollapsed.value;
  }
  void setLoading(bool value){
    state.loading.value=value;
  }
  Rx<CountryCode> code =
      CountryCode(name: 'United States', code: 'US', dialCode: '+1').obs;

  Rx<String> serviceOffering = 'Select'.obs;
  void onFocusChange(bool value) {
    state.focused.value = value;
  }


  Future<void> createSurfer(
      String id , String name, String email,String number,String city)async{
    try{
      String dateTime = DateTime.timestamp().millisecondsSinceEpoch.toString();
      setLoading(true);
      await APis.db.collection('surferForm').doc(dateTime).set(DriverModel(
          image: '',
          name: name,
          phone: number,
          email: email,
          pushToken: '',
          id: dateTime,
          dateTime: dateTime,
          isApproved: false,
          city: city
      ).toJson()).then((value) => {
        setLoading(false),
      Get.snackbar('Success','Waiting for admin approval'.toString(),backgroundColor:Colors.white ,colorText: AppColors.buttonColor.withOpacity(.8))
      }).onError((error, stackTrace) => {
        setLoading(false),
      Get.snackbar('Error',error.toString(),backgroundColor:Colors.white ,colorText: AppColors.buttonColor.withOpacity(.8))
      });
    }catch(e){
      setLoading(false);
      Get.snackbar('Error',e.toString(),backgroundColor:Colors.white ,colorText: AppColors.buttonColor.withOpacity(.8));
    }
  }


}