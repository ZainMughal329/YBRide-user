

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
   void LogIn(BuildContext context , String email,String password)async{
      try{
         state.auth.signInWithEmailAndPassword(email: email, password: password).then((value) async{
            SessionController().userid= value.user!.uid.toString();
            Get.offAll(()=>HomePage());
            state.emailCon.clear();
            state.passwordCon.clear();
         }).onError((error, stackTrace){
            Get.snackbar('Error',error.toString(),backgroundColor:Colors.white ,colorText: AppColors.buttonColor.withOpacity(.8));
            (false);
            // state.loading.value=false;
         });
      }catch(e){
         Get.snackbar('Error', e.toString());
         // state.loading.value=false;
      }
   }
   static User get user => APis.auth.currentUser!;

   static Future<bool> userExists() async {
      return (await APis.db.collection('web_users').doc(user.uid).get()).exists;
   }

   static Future<void> createUser() async {
      final chatUser = UserModel(
          userName: user.displayName.toString(),
          id: user.uid.toString(),
          password:user.updatePassword('').toString(),
          email: user.email.toString(),
          );

      await APis.db.collection('web_users').doc(APis.auth.currentUser!.uid).set(
         chatUser.toJson(),
      );
   }


   handleGoogleSignIn(BuildContext context) async {
      // showProgressIndicator(context);
      _signInWithGoogle().then((user) async {
         // SessionController().userId = user!.uid.toString();
         Navigator.pop(context);
         if (user != null) {
            SessionController().userid = user.user!.uid.toString();
            if ((await userExists())) {
               return Get.off(()=>HomePage());
            } else {
               await createUser().then((value) {
                  return Get.off(()=>HomePage());
               });
            }
         }
      });
   }

   Future<UserCredential?> _signInWithGoogle() async {
      try {
         await InternetAddress.lookup('google.com');
         // Trigger the authentication flow
         final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

         // Obtain the auth details from the request
         final GoogleSignInAuthentication? googleAuth =
         await googleUser?.authentication;

         // Create a new credential
         final credential = GoogleAuthProvider.credential(
            accessToken: googleAuth?.accessToken,
            idToken: googleAuth?.idToken,
         );

         // Once signed in, return the UserCredential
         return await APis.auth.signInWithCredential(credential);
      } catch (e) {
         return null;
      }
   }




}