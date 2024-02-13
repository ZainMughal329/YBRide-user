

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yb_ride_user_web/checkOut/state.dart';
import 'package:yb_ride_user_web/components/snackbar_widget.dart';
import 'package:yb_ride_user_web/helper/AppConstants.dart';
import 'package:yb_ride_user_web/helper/api.dart';

class CheckOutCon extends GetxController{
  final state = CheckOutState();

  void setDataLoaded(bool val) {
    state.dataLoaded.value = val;
  }

  Future<void> getCheckoutPayments() async {
    setDataLoaded(false);
    try {
      CollectionReference usersCollection =
      APis.db.collection('checkoutPayment');
      QuerySnapshot querySnapshot = await usersCollection.get();

      // Check if there are any documents in the collection
      if (querySnapshot.docs.isNotEmpty) {
        // Get the first document
        QueryDocumentSnapshot firstDocument = querySnapshot.docs.first;

        // Get the details from the document
        state.delivery = firstDocument['delivery'];
        state.CDW = firstDocument['CDW'];
        state.RCLI = firstDocument['RCLI'];
        state.SLI = firstDocument['SLI'];
        state.essential = firstDocument['essential'];
        state.licenseFee = firstDocument['licenseFee'];
        state.standard = firstDocument['standard'];
        state.unlimitedMiles = firstDocument['unlimitedMiles'];
        state.assistance = firstDocument['assistance'];
        state.pickupLoc = firstDocument['pickUpLoc'];
        AppConstants.deliveryCharges = firstDocument['delivery'];
        AppConstants.pickUpLoc = firstDocument['pickUpLoc'];
        getReceiptCharges();
        setDataLoaded(true);
      } else {
        Snackbar.showSnackBar(
            'Error', 'Something went wrong', Icons.error_outline_outlined);
        setDataLoaded(true);
      }
    } catch (e) {
      Snackbar.showSnackBar(
          'Error', e.toString(), Icons.error_outline_outlined);

      setDataLoaded(true);
    }
  }

  Future<void> getReceiptCharges() async{
    try{
      CollectionReference usersCollection =
      APis.db.collection('receipt_charges');
      QuerySnapshot querySnapshot = await usersCollection.get();

      // Check if there are any documents in the collection
      if (querySnapshot.docs.isNotEmpty) {
        // Get the first document
        QueryDocumentSnapshot firstDocument = querySnapshot.docs.first;

        // Get the details from the document
        AppConstants.bostonPoliceFees = double.parse((firstDocument['Boston Convention Center Financing Surcharge']).toString());
        AppConstants.bostonParking = double.parse((firstDocument['Boston Parking Surcharge']).toString());
        AppConstants.bostonConventionCenter = double.parse((firstDocument['Boston Police Training Fees']).toString());
        AppConstants.tempDeposit = double.parse((firstDocument['tempDeposit']).toString());
        AppConstants.salesTaxPercentage = double.parse((firstDocument['salesTaxPercentage']).toString());

      }
    }catch(e){
      Snackbar.showSnackBar(
          'Error', e.toString(), Icons.error_outline_outlined);
    }
  }

  //
  void addInTotalPrice(double? price, bool withRentDays) {
    if(withRentDays==true){
      double? newprice = AppConstants.rentDays*price!;
      state.totalPrice.value = state.totalPrice.value + newprice;
    }else if(withRentDays==false){
      state.totalPrice.value = state.totalPrice.value + price!;
    }

  }

  void subtractFromTotalPrince(double? price, bool withRentDays) {
    if(withRentDays == true){
      double? newprice = AppConstants.rentDays*price!;
      state.totalPrice.value = state.totalPrice.value - newprice!;
    }else if(withRentDays==false){
      state.totalPrice.value = state.totalPrice.value - price!;
    }

  }



}