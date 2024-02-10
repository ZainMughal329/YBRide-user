import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:yb_ride_user_web/Vehicle/addVehiclePage/state.dart';
import '../../helper/api.dart';
import '../state.dart';

class VehicleController extends GetxController {
  final state = vehicleState();

  Future<List<String>> getAllTypeValues() async {
    try {
      CollectionReference vehicleData = await APis.db.collection('vehicleData');

      QuerySnapshot querySnapshot = await vehicleData.get();

      List<String> typeValues = [];

      for (QueryDocumentSnapshot documentSnapshot in querySnapshot.docs) {
        String? typeValue = documentSnapshot['type'];
        if (typeValue != null) {
          typeValues.add(typeValue);
        }
      }

      log('val:' + typeValues.toString());
      return typeValues;
    } catch (e) {
      print('Error fetching data: $e');
      return [];
    }
  }

  Future<bool> isTypeExists(String newType) async {
    try {
      CollectionReference vehicleData = await APis.db.collection('vehicleData');

      QuerySnapshot querySnapshot = await vehicleData.where('type', isEqualTo: newType).get();

      return querySnapshot.docs.isNotEmpty;
    } catch (e) {
      print('Error checking if type exists: $e');
      return false;
    }
  }

}
