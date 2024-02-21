

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class forgotState{
  final auth = FirebaseAuth.instance;
  final email = TextEditingController();
  final loading = false.obs;

}