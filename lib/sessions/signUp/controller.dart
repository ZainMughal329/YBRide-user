import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yb_ride_user_web/helper/appColors.dart';
import 'package:yb_ride_user_web/homePage/view.dart';
import 'package:yb_ride_user_web/main.dart';
import 'package:yb_ride_user_web/sessions/signUp/state.dart';
import '../../helper/api.dart';
import '../../helper/session_Controller.dart';
import '../../model/userModel/user_model.dart';
import 'package:google_sign_in/google_sign_in.dart';


class signUpCon extends GetxController {
  final state = SignUpState();

  void setLoading(bool value) {
    state.loading.value = value;
  }
  static User get user => APis.auth.currentUser!;
  static Future<bool> userExists() async {
    return (await APis.db.collection('users').doc(user.uid).get()).exists;
  }
  void registerUserWithEmailAndPassword(
      UserModel userinfo, String email, password,userName) async {
    setLoading(true);
    try {
        UserCredential userCredential = await state.auth.createUserWithEmailAndPassword(
          email: email,
          password: password,
        );
        userinfo.id = userCredential.user!.uid.toString();
        SessionController().userId = userCredential.user!.uid;
        userId = userCredential.user!.uid.toString();
        createUser(userinfo);
        setLoading(false);
      // var user = await state.auth
      //     .createUserWithEmailAndPassword(email: email, password: password,
      // )
      //     .then((value) {
      //   userinfo.id = state.auth.currentUser!.uid.toString();
      //   SessionController().userId = APis.auth.currentUser!.uid.toString();
      //   createUser(userinfo);
      // }).onError((error, stackTrace) {
      //   setLoading(false);
      //   Get.snackbar('Error',error.toString(),backgroundColor: AppColors.buttonColor.withOpacity(.8),colorText: Colors.white);
      // });
    } on FirebaseAuthException catch (e) {
      setLoading(false);
      Get.snackbar('msg', e.toString(),backgroundColor:AppColors.buttonColor.withOpacity(.8) ,colorText: Colors.white.withOpacity(.8));
    } catch (e) {
      setLoading(false);
        Get.snackbar('Error',e.toString(),backgroundColor: AppColors.buttonColor.withOpacity(.8),colorText: Colors.white);

    }
  }
  createUser(UserModel user) async {
    await state.dbFireStore
        .doc(state.auth.currentUser!.uid)
        .set(user.toJson())
        .whenComplete(() {
      Get.snackbar('Message', 'Registered Successfully',
          backgroundColor: Colors.white,
          colorText: AppColors.buttonColor.withOpacity(.8));

      Get.off(() => HomePage()

       , transition: Transition.rightToLeft,duration: Duration(milliseconds: 600));

    }).catchError((error, stackTrace) {
      Get.snackbar('Message', "Error occurred",
          backgroundColor: Colors.white,
          colorText: AppColors.buttonColor.withOpacity(.8));
    },
      );
  }

  void storeUser(UserModel user, BuildContext context, String email,
      String pass, String userName) async {
    registerUserWithEmailAndPassword(user, email, pass, userName);
  }

    handleGoogleSignIn(BuildContext context) async {
    signInWithGoogle().then((user) async {
      if (user != null) {
        SessionController().userId = user.user!.uid.toString();
        if ((await userExists())) {
          return Get.offAll(()=>HomePage(),
              transition: Transition.rightToLeft,duration: Duration(milliseconds: 600));
        } else {
          UserModel us1 = UserModel(
              id: APis.auth.currentUser!.uid.toString(),
              userName: user.user!.displayName.toString(), email: user.user!.email.toString());
          await createUser(us1).then((value) {
            return Get.offAll(()=>HomePage(),
                transition: Transition.rightToLeft,duration: Duration(milliseconds: 600));
          });
        }
      }
    });
  }
  Future<UserCredential> signInWithGoogle() async {
    GoogleAuthProvider googleProvider = GoogleAuthProvider();
    googleProvider.addScope('https://www.googleapis.com/auth/contacts.readonly');
    googleProvider.setCustomParameters({
      'login_hint': 'user@example.com'
    });
    return await FirebaseAuth.instance.signInWithPopup(googleProvider);
  }
}
