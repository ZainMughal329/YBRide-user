

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yb_ride_user_web/helper/appColors.dart';
import 'package:yb_ride_user_web/homePage/view.dart';
import 'package:yb_ride_user_web/sessions/signUp/state.dart';

import '../../model/userModel/user_model.dart';

class signUpCon extends GetxController{
  final state = SignUpState();

  void registerUserWithEmailAndPassword(
      UserModel userinfo, String email, password,userName) async {
    try {
      var user = await state.auth
          .createUserWithEmailAndPassword(email: email, password: password,
      )
          .then((value) {
        userinfo.id = state.auth.currentUser!.uid.toString();
        createUser(userinfo);
      }).onError((error, stackTrace) {
        Get.snackbar('Error',error.toString(),backgroundColor: AppColors.buttonColor.withOpacity(.8),colorText: Colors.white);
      });
    } on FirebaseAuthException catch (e) {
      Get.snackbar('msg', e.toString(),backgroundColor:AppColors.buttonColor.withOpacity(.8) ,colorText: Colors.blueGrey.withOpacity(.8));
    } catch (_) {
    }
  }


  createUser(UserModel user) async {
    await state.dbFireStore
        .doc(state.auth.currentUser!.uid)
        .set(user.toJson())
        .whenComplete(() {
      Get.snackbar('Message', 'Registered Successfully',backgroundColor:Colors.white ,colorText: AppColors.buttonColor.withOpacity(.8));
      Get.off(()=>HomePage());
    }).catchError((error, stackTrace) {
      Get.snackbar('Message', "Error occurred",backgroundColor:Colors.white ,colorText: AppColors.buttonColor.withOpacity(.8));
    });
  }


  void storeUser(
      UserModel user, BuildContext context, String email, String pass,String userName) async {
    registerUserWithEmailAndPassword(user, email, pass,userName);
  }

}