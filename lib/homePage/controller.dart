


import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:yb_ride_user_web/Vehicle/view.dart';
import 'package:yb_ride_user_web/helper/AppConstants.dart';
import 'package:yb_ride_user_web/homePage/state.dart';
import 'package:http/http.dart' as http;
import 'package:geocoding/geocoding.dart';

class HomePageCon extends GetxController{
  final state = HomePageState();


  void getCurrentDate(){
    DateTime currentDate = DateTime.now();
    // Format the date as MMDDYYYY
    String formattedDateDay = DateFormat('dd').format(currentDate);
    String formattedDateMonth = DateFormat('MM').format(currentDate);
    String formattedDateYear = DateFormat('yy').format(currentDate);
    state.fromDate.value = formattedDateDay;
    state.fromDateName.value = getDayOfWeek(currentDate);
    state.fromMonth.value = formattedDateMonth;
    state.fromMonthName.value = getMonthName(formattedDateMonth);
    state.fromYear.value = formattedDateYear;
    getLaterDate();
  }

  void getLaterDate(){
    // Get the current date
    DateTime currentDate = DateTime.now();

    // Add 5 days to the current date
    DateTime newDate = currentDate.add(Duration(days: 5));


    String formattedDateDay = DateFormat('dd').format(newDate);
    String formattedDateMonth = DateFormat('MM').format(newDate);
    String formattedDateYear = DateFormat('yy').format(newDate);

    // Print the result
    state.toDateName.value = getDayOfWeek(newDate);
    state.toDate.value = formattedDateDay;
    state.toMonth.value = formattedDateMonth;
    state.toMonthName.value = getMonthName(formattedDateMonth);
    state.toYear.value = formattedDateYear;


    // AppConstants.toDateName = getDayOfWeek(newDate).toString();
    // AppConstants.toDate =formattedDateDay;
    // AppConstants.toMonth = formattedDateMonth;
    // AppConstants.toMonthName = getMonthName(formattedDateMonth);
    // AppConstants.toYear = formattedDateYear;
    // AppConstants.toDateName
    // AppConstants.toDateName
  }





  void getSuggestions(
      String input, dynamic sessionToken, HomePageCon controller) async {
    print("get suggestions called");
    String baseURL = AppConstants.placesBaseUrl;
    String kPLACES_API_KEY = AppConstants.kPlacesApiKey;
    String request =
        '$baseURL?input=$input&key=$kPLACES_API_KEY&sessiontoken=$sessionToken';

    var response = await http.get(Uri.parse(request)).then((response) {
      print(response.toString());
      if (response.statusCode == 200) {
        List predictions = jsonDecode(response.body.toString())['predictions'];
        List bostonPredictions = predictions.where((prediction) {
          return prediction['description'].toLowerCase().contains('boston');
        }).toList();

        state.results.value = bostonPredictions.length;
        // cont.state.placeList.value =
        controller.state.placeList.value = bostonPredictions;
        print(bostonPredictions.toString());

      } else {
        print("status code");
        print(response.statusCode);

      }
    }).onError((error, stackTrace) {
      print(error.toString());
    });
  }


  void GetCoordinates(BuildContext context) async {

    List<Location> coordinates =
    await locationFromAddress(state.selectedPlace.toString());
    if (coordinates.isNotEmpty) {
      final lat = coordinates.first;
      state.fromLat.value = lat.latitude;
      state.fromLang.value = lat.longitude;
      print("Lat Lang");
      print(lat.latitude);
      print(lat.longitude);
      // state.loc.value = LatLng(lat.latitude, lat.longitude);
      // animationOfCamera(state.loc.value);
    }
  }


  // Extracting Date
  void extractStartEndDate(String output) {

    // state.startEndDateSelected.value=true;

    // state.startEndDateSelected.value=true;
    // Find the index of "startDate" and extract the substring
    int startIndex = output.indexOf("startDate:");
    int endIndex = output.indexOf(",", startIndex);

    // state.timeandDateSelected.value=true;

    // Check if "startDate" is found
    if (startIndex != -1 && endIndex != -1) {
      String startDate =
      output.substring(startIndex + "startDate:".length, endIndex).trim();
      String formattedStartDate = startDate.split(' ')[0];

      DateTime startDateDay = DateTime.parse(formattedStartDate);

      String day = getDayOfWeek(startDateDay);
      String formattedDateDay = DateFormat('dd').format(startDateDay);
      String formattedDateMonth = DateFormat('MM').format(startDateDay);
      String formattedDateYear = DateFormat('yy').format(startDateDay);



      AppConstants.epochFromDate = startDateDay.millisecondsSinceEpoch.toString();
      state.fromDate.value = formattedDateDay;
      state.fromDateName.value = day;
      state.fromMonth.value = formattedDateMonth;
      state.fromMonthName.value = getMonthName(formattedDateMonth);
      state.fromYear.value = formattedDateYear;




      // Find the index of "endDate" and extract the substring
      startIndex = output.indexOf("endDate:");
      endIndex = output.indexOf(")", startIndex);

      // Check if "endDate" is found
      if (startIndex != -1 && endIndex != -1) {
        String endDate =
        output.substring(startIndex + "endDate:".length, endIndex).trim();
        String formattedEndDate = endDate.split(' ')[0];
        // added line



        if (formattedEndDate != "null") {


          print(formattedEndDate);

          DateTime EndDateDay = DateTime.parse(formattedEndDate);



          String day = getDayOfWeek(EndDateDay);

          String formattedDateDay = DateFormat('dd').format(EndDateDay);
          String formattedDateMonth = DateFormat('MM').format(EndDateDay);
          String formattedDateYear = DateFormat('yy').format(EndDateDay);

          AppConstants.epochToDate = EndDateDay.millisecondsSinceEpoch.toString();
          state.toDate.value = formattedDateDay;
          state.toDateName.value = day;
          state.toMonth.value = formattedDateMonth;
          state.toMonthName.value = getMonthName(formattedDateMonth);
          state.toYear.value = formattedDateYear;




          state.startEndDateSelected.value=true;

        }

      }

    }
    state.startEndDateSelected.value=true;
  }

  String getDayOfWeek(DateTime date) {
    switch (date.weekday) {
      case DateTime.monday:
        return "Mon";
      case DateTime.tuesday:
        return "Tue";
      case DateTime.wednesday:
        return "Wed";
      case DateTime.thursday:
        return "Thu";
      case DateTime.friday:
        return "Fri";
      case DateTime.saturday:
        return "Sat";
      case DateTime.sunday:
        return "Sun";
      default:
        return "Invalid day";
    }
  }
  String getMonthName(String mon){
    // Assuming you have the month as a numerical string "01"
    String monthString = mon;

    // Convert the numerical month to an integer
    int month = int.parse(monthString);

    // Use the intl package to get the abbreviated month name
    String monthName = DateFormat('MMM').format(DateTime(2022, month, 1));

    return monthName;
  }


  // Converting time in Epcoh
  int convertTimeEpoch(String time){
    String timeString = time;

    int milliseconds = getTimeInMillisecondsSinceMidnight(timeString);
    print('Milliseconds since midnight (${time}): $milliseconds');
    return milliseconds;


  }

  int getTimeInMillisecondsSinceMidnight(String timeString) {
    List<String> parts = timeString.split(' ');

    // Extract hour and minute
    List<String> timeParts = parts[0].split(':');
    int hour = int.parse(timeParts[0]);
    int minute = int.parse(timeParts[1]);

    // Adjust for PM times
    if (parts[1] == "PM" && hour != 12) {
      hour += 12;
    }
    // Adjust for midnight
    else if (parts[1] == "AM" && hour == 12) {
      hour = 0;
    }

    // Calculate the milliseconds since midnight
    int millisecondsSinceMidnight =
        hour * Duration.millisecondsPerHour +
            minute * Duration.millisecondsPerMinute;

    return millisecondsSinceMidnight;
  }


  void moveToSelectVehicleScreen(){
    AppConstants.fromMonth = state.fromMonth.value;
    AppConstants.fromMonthName = state.fromMonthName.value;
    AppConstants.fromDate = state.fromDate.value;
    AppConstants.fromDateName = state.fromDateName.value;
    AppConstants.fromYear = state.fromYear.value;
    AppConstants.fromTime = state.fromTime.value;
    AppConstants.toMonth = state.toMonth.value;
    AppConstants.toMonthName = state.toMonthName.value;
    AppConstants.toDate = state.toDate.value;
    AppConstants.toDateName = state.toDateName.value;
    AppConstants.toYear = state.toYear.value;
    AppConstants.toTime = state.toTime.value;
    AppConstants.fromAddress = state.selectedPlace.value;
    AppConstants.toAddress = state.returnPlace.value;
    AppConstants.fromTimeinMiliSeconds = (convertTimeEpoch(state.fromTime.value)).toString();
    AppConstants.toTimeinMiliSeconds = (convertTimeEpoch(state.toTime.value)).toString();

    // if(state.returnPlace.value =='Return Place'){
    //   AppConstants.toAddress = state.selectedPlace.value;
    // }else{
    //
    // }


    Get.to(() => VehiclePage());
    // Get.toNamed(RoutesName.carDetailsScreen,arguments: {'isTextShow',false});

  }



}