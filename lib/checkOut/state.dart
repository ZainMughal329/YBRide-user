import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class CheckOutState{

  final firstNameCon = TextEditingController();
  final lastNameCon = TextEditingController();
  final phoneNumCon = TextEditingController();
  RxString countryCode = "+92".obs;
  final isDriverAge = false.obs;
  final isDelivery = false.obs;
  final isSelfPickup = false.obs;
  final UnlimitedMiles = false.obs;
  final standardCoverage = false.obs;
  final liabilityInsurance = false.obs;
  final iHaveMyOwn = false.obs;

  final promoCodeCon = TextEditingController();
  final buttonVisible = false.obs;

  final cdwSwitchVal = false.obs;
  final rcliSwitchVal = false.obs;
  final sliSwitchVal = false.obs;
  RxDouble totalPrice = 2.11.obs;
  var isLoading = true.obs;




}