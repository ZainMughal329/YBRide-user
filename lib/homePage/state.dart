

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uuid/uuid.dart';
import 'package:geocoding/geocoding.dart';

class HomePageState{


  RxBool isExpanded = false.obs;


  final auth  =FirebaseAuth.instance;
  //  homePage Variables
  final pickupController = TextEditingController();
  final returnController = TextEditingController();
  final fromController = TextEditingController();
  final toController = TextEditingController();
  final isSwitchButtonVal =false.obs;
  final isButtonVisible = false.obs;
  TextEditingController locationSearchController = TextEditingController();



  //Places Variables
  Uuid? uuid ;
  String? sessionToken;

  RxInt results = 0.obs;
  RxList placeList = [].obs;
  RxList primaryText = [].obs;
  RxBool searchLoading = false.obs;
  RxBool locationSelected = false.obs;
  // var loc = LatLng(42.361145, -71.057083).obs;


  RxString selectedPlace = 'Tap to Search'.obs;
  RxBool fromAddressSelected = false.obs;
  RxString returnPlace = 'Return Place'.obs;
  RxBool toAddressSelected = false.obs;
  RxDouble fromLat = 0.0.obs;
  RxDouble fromLang = 0.0.obs;
  RxDouble toLat = 0.0.obs;
  RxDouble toLang = 0.0.obs;

  RxBool timeandDateSelected = false.obs;
//trued
  RxBool startEndDateSelected = false.obs;

  RxString fromMonth = "".obs;
  RxString fromMonthName = "".obs;
  RxString fromDate = "".obs;
  RxString fromDateName = "".obs;
  RxString fromYear = "".obs;
  RxString fromTime = "11:00 AM".obs;
  RxString toMonth = "".obs;
  RxString toMonthName = "".obs;
  RxString toDate = "".obs;
  RxString toDateName = "".obs;
  RxString toYear = "".obs;
  RxString toTime = "11:00 AM".obs;
  String fromTimeinMiliSeconds = "";
  String toTimeinMiliSeconds = "";
  final items = <DropdownMenuItem>[
    DropdownMenuItem(
      child: Text('7:30 AM'),
      value: '7:30 AM',
    ),DropdownMenuItem(
      child: Text('8:00 AM'),
      value: '8:00 AM',
    ),
    DropdownMenuItem(
      child: Text('8:30 AM'),
      value: '8:30 AM',
    ),
    DropdownMenuItem(
      child: Text('9:00 AM'),
      value: '9:00 AM',
    ),
    DropdownMenuItem(
      child: Text('9:30 AM'),
      value: '9:30 AM',
    ),DropdownMenuItem(
      child: Text('10:00 AM'),
      value: '10:00 AM',
    ),DropdownMenuItem(
      child: Text('10:30 AM'),
      value: '10:30 AM',
    ),DropdownMenuItem(
      child: Text('11:00 AM'),
      value: '11:00 AM',
    ),DropdownMenuItem(
      child: Text('11:30 AM'),
      value: '11:30 AM',
    ),DropdownMenuItem(
      child: Text('12:00 PM'),
      value: '12:00 PM',
    ),DropdownMenuItem(
      child: Text('12:30 PM'),
      value: '12:30 PM',
    ),DropdownMenuItem(
      child: Text('1:00 PM'),
      value: '1:00 PM',
    ),DropdownMenuItem(
      child: Text('1:30 PM'),
      value: '1:30 PM',
    ),DropdownMenuItem(
      child: Text('2:00 PM'),
      value: '2:00 PM',
    ),DropdownMenuItem(
      child: Text('2:30 PM'),
      value: '2:30 PM',
    ),DropdownMenuItem(
      child: Text('3:00 PM'),
      value: '3:00 PM',
    ),DropdownMenuItem(
      child: Text('3:30 PM'),
      value: '3:30 PM',
    ),
    DropdownMenuItem(
      child: Text('4:00 PM'),
      value: '4:00 PM',
    ),DropdownMenuItem(
      child: Text('4:30 PM'),
      value: '4:30 PM',
    ),DropdownMenuItem(
      child: Text('5:00 PM'),
      value: '5:00 PM',
    ),DropdownMenuItem(
      child: Text('5:30 PM'),
      value: '5:30 PM',
    ),DropdownMenuItem(
      child: Text('6:00 PM'),
      value: '6:00 PM',
    ),DropdownMenuItem(
      child: Text('6:30 PM'),
      value: '6:30 PM',
    ),DropdownMenuItem(
      child: Text('7:00 PM'),
      value: '7:00 PM',
    ),DropdownMenuItem(
      child: Text('7:30 PM'),
      value: '7:30 PM',
    ),DropdownMenuItem(
      child: Text('8:00 PM'),
      value: '8:00 PM',
    ),DropdownMenuItem(
      child: Text('8:30 PM'),
      value: '8:30 PM',
    ),DropdownMenuItem(
      child: Text('9:00 PM'),
      value: '9:00 PM',
    ),DropdownMenuItem(
      child: Text('9:30 PM'),
      value: '9:30 PM',
    ),DropdownMenuItem(
      child: Text('10:00 PM'),
      value: '10:00 PM',
    ),DropdownMenuItem(
      child: Text('10:30 PM'),
      value: '10:30 PM',
    ),DropdownMenuItem(
      child: Text('11:00 PM'),
      value: '11:00 PM',
    ),
  ];
}