import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yb_ride_user_web/helper/appColors.dart';
import 'package:yb_ride_user_web/homePage/view.dart';
import 'package:yb_ride_user_web/sessions/signUp/state.dart';
import '../../helper/api.dart';
import '../../helper/session_Controller.dart';
import '../../model/userModel/user_model.dart';

class signUpCon extends GetxController {
  final state = SignUpState();

  void setLoading(bool value) {
    state.loading.value = value;
  }

  void registerUserWithEmailAndPassword(
      UserModel userinfo, String email, password,userName) async {
    setLoading(true);
    try {
        UserCredential userCredential = await state.auth.createUserWithEmailAndPassword(
          email: email,
          password: password,
        );
        userinfo.id = userCredential.user!.uid;
        SessionController().userId = userCredential.user!.uid;
        createUser(userinfo);
        setLoading(false);
      var user = await state.auth
          .createUserWithEmailAndPassword(email: email, password: password,
      )
          .then((value) {
        userinfo.id = state.auth.currentUser!.uid.toString();
        SessionController().userId = APis.auth.currentUser!.uid.toString();
        createUser(userinfo);
      }).onError((error, stackTrace) {
        setLoading(false);
        Get.snackbar('Error',error.toString(),backgroundColor: AppColors.buttonColor.withOpacity(.8),colorText: Colors.white);
      });
    } on FirebaseAuthException catch (e) {
      setLoading(false);
      Get.snackbar('msg', e.toString(),backgroundColor:AppColors.buttonColor.withOpacity(.8) ,colorText: Colors.blueGrey.withOpacity(.8));
    } catch (_) {
      setLoading(false);
    }
  }
  //
  //   Future<void> registerUserWithEmailAndPassword(UserModel userinfo,
  //       String email, String password, String userName) async {
  //     setLoading(true);
  //     try {
  //       // Check if the user already exists in the "drivers" collection
  //       bool userExists = await checkIfUserExists(email);
  //
  //       if (!userExists) {
  //         // User does not exist, proceed with signup
  //         UserCredential userCredential =
  //             await state.auth.createUserWithEmailAndPassword(
  //           email: email,
  //           password: password,
  //         );
  //
  //         userinfo.id = userCredential.user!.uid;
  //         SessionController().userId = userCredential.user!.uid;
  //         createUser(userinfo);
  //
  //         setLoading(false);
  //       } else {
  //         // User already exists, display error message
  //         setLoading(false);
  //         Get.snackbar(
  //           'Error',
  //           'User already exists',
  //           backgroundColor: AppColors.buttonColor.withOpacity(.8),
  //           colorText: Colors.white,
  //         );
  //       }
  //     } catch (e) {
  //       setLoading(false);
  //       Get.snackbar(
  //         'Error',
  //         e.toString(),
  //         backgroundColor: AppColors.buttonColor.withOpacity(.8),
  //         colorText: Colors.white,
  //       );
  //     }
  //   }
  //
  //
  createUser(UserModel user) async {
    await state.dbFireStore
        .doc(state.auth.currentUser!.uid)
        .set(user.toJson())
        .whenComplete(() {
      Get.snackbar('Message', 'Registered Successfully',
          backgroundColor: Colors.white,
          colorText: AppColors.buttonColor.withOpacity(.8));
      Get.off(() => HomePage());
    }).catchError((error, stackTrace) {
      Get.snackbar('Message', "Error occurred",
          backgroundColor: Colors.white,
          colorText: AppColors.buttonColor.withOpacity(.8));
    });
  }

  void storeUser(UserModel user, BuildContext context, String email,
      String pass, String userName) async {
    registerUserWithEmailAndPassword(user, email, pass, userName);
  }
}
