

   import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yb_ride_user_web/homePage/view.dart';
import 'package:yb_ride_user_web/sessions/login/state.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../../helper/api.dart';
import '../../helper/appColors.dart';
import '../../helper/session_Controller.dart';
import '../../model/userModel/user_model.dart';

class loginCon extends GetxController{


   final state = loginState();
   void setLoading(bool value){
      state.loading.value=value;
   }
   // void LogIn(BuildContext context , String email,String password)async{
   //    setLoading(true);
   //    try{
   //      bool userExists = await checkIfUserExists(email);
   //      if(userExists){
   //        state.auth.signInWithEmailAndPassword(email: email, password: password).then((value) async{
   //          SessionController().userId= value.user!.uid.toString();
   //          Get.offAll(()=>HomePage());
   //          state.emailCon.clear();
   //          state.passwordCon.clear();
   //          setLoading(false);
   //        })
   //            .onError((error, stackTrace){
   //          setLoading(false);
   //          Get.snackbar('Error',error.toString(),backgroundColor:Colors.white ,colorText: AppColors.buttonColor.withOpacity(.8));
   //          (false);
   //          // state.loading.value=false;
   //        });
   //
   //      }else{
   //        setLoading(false);
   //        Get.snackbar(
   //          'Error',
   //          'User does not exist',
   //          backgroundColor: AppColors.buttonColor.withOpacity(.8),
   //          colorText: Colors.white,
   //        );
   //      }
   //    }catch(e){
   //       setLoading(false);
   //       Get.snackbar('Error', e.toString());
   //       // state.loading.value=false;
   //    }
   // }
   void LogIn(BuildContext context, String email, String password) async {
     setLoading(true);
     try {
       bool userExists = await checkIfUserExists(email);

       if (userExists) {
         // If user exists in the drivers collection, display an error message
         setLoading(false);
         Get.snackbar(
           'Error',
           'Please use the YbBuddy app to log in',
           backgroundColor: AppColors.buttonColor.withOpacity(.8),
           colorText: Colors.white,
         );
       } else {
         // If user does not exist in the drivers collection, proceed with login
         state.auth.signInWithEmailAndPassword(email: email, password: password).then((value) async {
           SessionController().userId = value.user!.uid.toString();
           Get.offAll(() => HomePage(),
               transition: Transition.rightToLeft,duration: Duration(milliseconds: 600));
           state.emailCon.clear();
           state.passwordCon.clear();
           setLoading(false);
         }).onError((error, stackTrace) {
           setLoading(false);
           Get.snackbar('Error', error.toString(), backgroundColor: Colors.white, colorText: AppColors.buttonColor.withOpacity(.8));
           (false);
         });
       }
     } catch (e) {
       setLoading(false);
       Get.snackbar('Error', e.toString());
     }
   }


   Future<bool> checkIfUserExists(String email) async {
     try {
       var snapshot = await APis.db.collection('drivers').where('email', isEqualTo: email).get();
       return snapshot.docs.isNotEmpty;
     } catch (e) {
       // Handle any errors
       print(e);
       return false;
     }
        }

   static User get user => APis.auth.currentUser!;
   //
   // static Future<bool> userExists() async {
   //    return (await APis.db.collection('users').doc(user.uid).get()).exists;
   // }

   static Future<void> createUser() async {
      final chatUser = UserModel(
          userName: user.displayName.toString(),
          id: user.uid.toString(),
          // password:user.updatePassword('').toString(),
          email: user.email.toString(),
          );

      await APis.db.collection('users').doc(APis.auth.currentUser!.uid).set(
         chatUser.toJson(),
      );
   }


   // handleGoogleSignIn(BuildContext context) async {
   //    // showProgressIndicator(context);
   //    signInWithGoogle().then((user) async {
   //       // SessionController().userId = user!.uid.toString();
   //       Navigator.pop(context);
   //       if (user != null) {
   //          SessionController().userId = user.user!.uid.toString();
   //          if ((await userExists())) {
   //             return Get.off(()=>HomePage());
   //          } else {
   //             await createUser().then((value) {
   //                return Get.off(()=>HomePage());
   //             });
   //          }
   //       }
   //    });
   // }
   //
   // Future<UserCredential?> signInWithGoogle() async {
   //    try {
   //       await InternetAddress.lookup('google.com');
   //       // Trigger the authentication flow
   //       final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
   //
   //       // Obtain the auth details from the request
   //       final GoogleSignInAuthentication? googleAuth =
   //       await googleUser?.authentication;
   //
   //       // Create a new credential
   //       final credential = GoogleAuthProvider.credential(
   //          accessToken: googleAuth?.accessToken,
   //          idToken: googleAuth?.idToken,
   //       );
   //
   //       // Once signed in, return the UserCredential
   //       return await APis.auth.signInWithCredential(credential);
   //    } catch (e) {
   //       return null;
   //    }
   // }






}