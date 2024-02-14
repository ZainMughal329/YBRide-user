import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class AccountState{
final NameCon = TextEditingController();
final emailCon = TextEditingController();
final numberCon = TextEditingController();
RxString countryCode = "+1".obs;
RxBool focused = false.obs;


}