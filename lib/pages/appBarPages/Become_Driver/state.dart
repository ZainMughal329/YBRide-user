import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:fl_country_code_picker/fl_country_code_picker.dart';
class BecomeDriverState {

  var isCollapsed = false.obs;
  final loading = false.obs;
  RxBool focused = false.obs;
  final countryPicker = FlCountryCodePicker();
  final NameCon = TextEditingController();
  final emailCon = TextEditingController();
  final phoneNumberCon = TextEditingController();

  Rx<CountryCode> code =
      CountryCode(name: 'United States', code: 'US', dialCode: '+1').obs;

  Rx<String> serviceOffering = 'Select'.obs;


}