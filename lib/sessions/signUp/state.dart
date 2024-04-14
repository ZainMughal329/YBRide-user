import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
class SignUpState{
  final loading = false.obs;
  final dbFireStore = FirebaseFirestore.instance.collection('web_users');
  final auth = FirebaseAuth.instance;
  final userNameCon = TextEditingController();
  final emailCon = TextEditingController();
  final passwordCon = TextEditingController();

  RxBool isObscure = true.obs;

}