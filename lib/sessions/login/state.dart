

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class loginState{
 final loading = false.obs;
 FirebaseAuth auth =FirebaseAuth.instance;
 final ref = FirebaseFirestore.instance;
 final emailCon = TextEditingController();
 final passwordCon = TextEditingController();

}