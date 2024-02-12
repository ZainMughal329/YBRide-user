


import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yb_ride_user_web/helper/AppConstants.dart';
import 'package:yb_ride_user_web/homePage/state.dart';
import 'package:http/http.dart' as http;
import 'package:geocoding/geocoding.dart';

class HomePageCon extends GetxController{
  final state = HomePageState();

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
      // state.loc.value = LatLng(lat.latitude, lat.longitude);
      // animationOfCamera(state.loc.value);
    }
  }
}