


import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:yb_ride_user_web/Vehicle/view.dart';
import 'package:yb_ride_user_web/helper/AppConstants.dart';
import 'package:yb_ride_user_web/homePage/state.dart';
import 'package:http/http.dart' as http;
import 'package:geocoding/geocoding.dart';

import '../components/snackbar_widget.dart';
import '../helper/api.dart';

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




  void extractFromNewRangePicker(String range){
    String dateString = range;

    List<String> dateParts = dateString.split(' - ');

    // Start Date
    String startDateString = dateParts[0];
    List<String> startDateComponents = startDateString.split('-');
    String startYear = startDateComponents[0];
    String startMonth = startDateComponents[1];
    String startDate = startDateComponents[2].split(' ')[0];
    DateTime startDateObject = DateTime(int.parse(startYear), int.parse(startMonth),int.parse(startDate));
    String startDateDayName = getDayOfWeek(startDateObject);
    int startMillisecondsSinceEpoch = startDateObject.millisecondsSinceEpoch;

    // Storing Start Values
    AppConstants.epochFromDate = startMillisecondsSinceEpoch.toString();
    state.fromDate.value = startDate;
    state.fromDateName.value = startDateDayName;
    state.fromMonth.value = startMonth;
    state.fromMonthName.value = getMonthName(startMonth);
    state.fromYear.value = startYear;


    print("Start values stored");
    print(AppConstants.epochFromDate);
    print(state.fromDate.value);
    print(state.fromDateName.value);
    print(state.fromMonth.value);
    print(state.fromMonthName.value);
    print(state.fromYear.value);

    // remove time part

    // End Date
    String endDateString = dateParts[1];
    List<String> endDateComponents = endDateString.split('-');
    String endYear = endDateComponents[0];
    String endMonth = endDateComponents[1];
    String endDate = endDateComponents[2].split(' ')[0];
    DateTime endDateObject = DateTime(int.parse(endYear), int.parse(endMonth),int.parse(endDate));
    String endDateDayName = getDayOfWeek(endDateObject);
    int endMillisecondsSinceEpoch = startDateObject.millisecondsSinceEpoch;// remove time part

    // storing end values
    AppConstants.epochToDate = endMillisecondsSinceEpoch.toString();
    state.toDate.value = endDate;
    state.toDateName.value = getDayOfWeek(endDateObject);
    state.toMonth.value = endMonth;
    state.toMonthName.value = getMonthName(endMonth);
    state.toYear.value = endYear;

    print("End values stored");
    print(AppConstants.epochToDate);
    print(state.toDate.value);
    print(state.toDateName.value);
    print(state.toMonth.value);
    print(state.toMonthName.value);
    print(state.toYear.value);
    state.startEndDateSelected.value=true;



  }

  Future<void> fetchContactDetails() async {
    try {
      await APis.db
          .collection('constants')
          .doc('constants')
          .get()
          .then((value) {
        AppConstants.ybEmail = value['ybEmail'];
        AppConstants.ybPhone = value['ybPhone'];
        AppConstants.ybAccName = value['ybAccountHolderName'];
        AppConstants.ybAccNumber = value['ybAccountNumber'];

        print(value['ybEmail']);
        print(value['ybPhone']);
      }).onError((error, stackTrace) {
        Snackbar.showSnackBar("YB-Ride", error.toString(), Icons.error_outline);
      });
    } catch (e) {
      Snackbar.showSnackBar("YB-Ride", e.toString(), Icons.error_outline);
    }
  }

  void extractStartEndDate(String output) {
    print(output.toString());

    // state.startEndDateSelected.value=true;

    // state.startEndDateSelected.value=true;
    // Find the index of "startDate" and extract the substring
    int startIndex = output.indexOf("startDate:");
    int endIndex = output.indexOf(",", startIndex);



    String startDate =
    output.substring(startIndex + "startDate:".length, endIndex).trim();
    String formattedStartDate = startDate.split(' ')[0];

    DateTime startDateDay = DateTime.parse(formattedStartDate);

    String day = getDayOfWeek(startDateDay);
    String formattedDateDay = DateFormat('dd').format(startDateDay);
    String formattedDateMonth = DateFormat('MM').format(startDateDay);
    String formattedDateYear = DateFormat('yy').format(startDateDay);



    AppConstants.epochFromDate = startDateDay.millisecondsSinceEpoch.toString();
    print('end date in function in epoch is:' +AppConstants.epochFromDate);
    state.fromDate.value = formattedDateDay;
    state.fromDateName.value = day;
    state.fromMonth.value = formattedDateMonth;
    state.fromMonthName.value = getMonthName(formattedDateMonth);
    state.fromYear.value = formattedDateYear;




    // Find the index of "endDate" and extract the substring
    startIndex = output.indexOf("endDate:");
    endIndex = output.indexOf(")", startIndex);


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
      print('end date in function in epoch is:' + AppConstants.epochToDate,);
      state.toDate.value = formattedDateDay;
      state.toDateName.value = day;
      state.toMonth.value = formattedDateMonth;
      state.toMonthName.value = getMonthName(formattedDateMonth);
      state.toYear.value = formattedDateYear;




      state.startEndDateSelected.value=true;

    }

    // // state.timeandDateSelected.value=true;
    //
    // // Check if "startDate" is found
    // if (startIndex != -1 && endIndex != -1) {
    //
    //
    //   // Check if "endDate" is found
    //   if (startIndex != -1 && endIndex != -1) {
    //
    //
    //   }
    //
    // }
    // state.startEndDateSelected.value=true;
  }


  // Extracting DateTime running function
  // void extractStartEndDate(String output) {
  //
  //   // state.startEndDateSelected.value=true;
  //
  //   // state.startEndDateSelected.value=true;
  //   // Find the index of "startDate" and extract the substring
  //   int startIndex = output.indexOf("startDate:");
  //   int endIndex = output.indexOf(",", startIndex);
  //
  //   // state.timeandDateSelected.value=true;
  //
  //   // Check if "startDate" is found
  //   if (startIndex != -1 && endIndex != -1) {
  //     String startDate =
  //     output.substring(startIndex + "startDate:".length, endIndex).trim();
  //     String formattedStartDate = startDate.split(' ')[0];
  //
  //     DateTime startDateDay = DateTime.parse(formattedStartDate);
  //
  //     String day = getDayOfWeek(startDateDay);
  //     String formattedDateDay = DateFormat('dd').format(startDateDay);
  //     String formattedDateMonth = DateFormat('MM').format(startDateDay);
  //     String formattedDateYear = DateFormat('yy').format(startDateDay);
  //
  //
  //
  //     AppConstants.epochFromDate = startDateDay.millisecondsSinceEpoch.toString();
  //     print('end date in function in epoch is:' +AppConstants.epochFromDate);
  //     state.fromDate.value = formattedDateDay;
  //     state.fromDateName.value = day;
  //     state.fromMonth.value = formattedDateMonth;
  //     state.fromMonthName.value = getMonthName(formattedDateMonth);
  //     state.fromYear.value = formattedDateYear;
  //
  //
  //
  //
  //     // Find the index of "endDate" and extract the substring
  //     startIndex = output.indexOf("endDate:");
  //     endIndex = output.indexOf(")", startIndex);
  //
  //     // Check if "endDate" is found
  //     if (startIndex != -1 && endIndex != -1) {
  //       String endDate =
  //       output.substring(startIndex + "endDate:".length, endIndex).trim();
  //       String formattedEndDate = endDate.split(' ')[0];
  //       // added line
  //
  //
  //
  //       if (formattedEndDate != "null") {
  //
  //
  //         print(formattedEndDate);
  //
  //         DateTime EndDateDay = DateTime.parse(formattedEndDate);
  //
  //
  //
  //         String day = getDayOfWeek(EndDateDay);
  //
  //         String formattedDateDay = DateFormat('dd').format(EndDateDay);
  //         String formattedDateMonth = DateFormat('MM').format(EndDateDay);
  //         String formattedDateYear = DateFormat('yy').format(EndDateDay);
  //
  //         AppConstants.epochToDate = EndDateDay.millisecondsSinceEpoch.toString();
  //         print('end date in function in epoch is:' + AppConstants.epochToDate,);
  //         state.toDate.value = formattedDateDay;
  //         state.toDateName.value = day;
  //         state.toMonth.value = formattedDateMonth;
  //         state.toMonthName.value = getMonthName(formattedDateMonth);
  //         state.toYear.value = formattedDateYear;
  //
  //
  //
  //
  //         state.startEndDateSelected.value=true;
  //
  //       }
  //
  //     }
  //
  //   }
  //   state.startEndDateSelected.value=true;
  // }

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
    print("______________________________");
    print(AppConstants.epochFromDate);
    print(AppConstants.epochFromDate);
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