

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yb_ride_user_web/pages/appBarPages/Trips/state.dart';

class TripCon extends GetxController with GetTickerProviderStateMixin{
    final state = TripState();
  late TabController tabController = TabController(length: 2, vsync: this);


}