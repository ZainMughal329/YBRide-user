

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class HomePageState{


  final auth  =FirebaseAuth.instance;
  //  homePage Variables
  final pickupController = TextEditingController();
  final returnController = TextEditingController();
  final fromController = TextEditingController();
  final toController = TextEditingController();
  final isSwitchButtonVal =false.obs;
  final isButtonVisible = false.obs;
}