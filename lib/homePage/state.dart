

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class HomePageState{
  //  homePage Variables
  final pickupController = TextEditingController();
  final returnController = TextEditingController();
  final fromController = TextEditingController();
  final toController = TextEditingController();
  final isSwitchButtonVal =false.obs;
  final isButtonVisible = false.obs;
}