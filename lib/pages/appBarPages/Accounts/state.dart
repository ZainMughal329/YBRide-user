import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class AccountState{
  final ref = FirebaseFirestore.instance.collection('web_users');
final NameCon = TextEditingController();
RxString Name = ''.obs;
final emailCon = TextEditingController();
final numberCon = TextEditingController();
RxString countryCode = "+1".obs;
RxBool focused = false.obs;


}