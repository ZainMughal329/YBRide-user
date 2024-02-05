

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yb_ride_user_web/helper/appColors.dart';
import 'package:yb_ride_user_web/sessions/forgot/state.dart';
import 'package:yb_ride_user_web/sessions/login/view.dart';

class forgotCon extends GetxController{

final state = forgotState();
  void forgotPassword(BuildContext context , String email)async{
    try{
      state.auth.sendPasswordResetEmail(email: email).then((value) {
        Get.to(()=>LoginPages());
        Get.snackbar('Sucess','Check your email to recover your password',backgroundColor:Colors.white ,colorText: AppColors.buttonColor.withOpacity(.8));

      }).onError((error, stackTrace) {
        Get.snackbar('Error',error.toString(),backgroundColor:Colors.white ,colorText: AppColors.buttonColor.withOpacity(.8));
      });
    }catch(e){
      Get.snackbar('Error', e.toString(),backgroundColor:Colors.white ,colorText: AppColors.buttonColor.withOpacity(.8));
    }


  }


}