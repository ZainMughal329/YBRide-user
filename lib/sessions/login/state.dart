

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

class loginState{
 FirebaseAuth auth =FirebaseAuth.instance;
 final ref = FirebaseFirestore.instance;
 final emailCon = TextEditingController();
 final passwordCon = TextEditingController();

}