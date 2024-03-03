

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yb_ride_user_web/pages/appBarPages/Trips/state.dart';

class TripCon extends GetxController with GetTickerProviderStateMixin{
    final state = TripState();
  late TabController tabController = TabController(length: 5, vsync: this);
    String convertMillisecondsToTimeString(String millsec) {

      int milliseconds = int.parse(millsec);
      double hrsVal = milliseconds/(1000*60*60);
      double hrs = double.parse(hrsVal.toStringAsFixed(2));

      String timeString  = convert24HourTo12HourFormat(hrs.toString());


      return timeString;
    }
    String convert24HourTo12HourFormat(String time) {
      List<String> parts = time.split('.');
      int hour = int.parse(parts[0]);
      int minute = int.parse(parts[1]);

      // Adjust hour to 12-hour format
      String period = hour >= 12 ? 'PM' : 'AM';
      hour = hour % 12;
      if (hour == 0) {
        hour = 12;
      }

      // Format hour and minute with leading zeros if needed
      String hourString = hour.toString().padLeft(2, '0');
      String minuteString = minute.toString().padLeft(2, '0');

      // Construct the time string
      String timeString = '$hourString:$minuteString $period';

      return timeString;
    }


}