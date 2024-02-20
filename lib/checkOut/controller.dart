

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yb_ride_user_web/checkOut/state.dart';
import 'package:yb_ride_user_web/components/snackbar_widget.dart';
import 'package:yb_ride_user_web/helper/AppConstants.dart';
import 'package:yb_ride_user_web/helper/api.dart';
import 'package:yb_ride_user_web/helper/session_Controller.dart';

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
        firstDocument['CDW'];
        state.delivery = double.parse((firstDocument['delivery']).toString());
        state.CDW = double.parse((firstDocument['CDW']).toString());
        state.RCLI = double.parse((firstDocument['RCLI']).toString());
        state.SLI = double.parse((firstDocument['SLI']).toString());
        state.essential = double.parse((firstDocument['essential']).toString());
        state.licenseFee = double.parse((firstDocument['licenseFee']).toString());
        state.standard = double.parse((firstDocument['standard']).toString());
        state.unlimitedMiles = double.parse((firstDocument['unlimitedMiles']).toString());
        state.assistance = double.parse((firstDocument['assistance']).toString());
        state.pickupLoc = firstDocument['pickUpLoc'];
        AppConstants.deliveryCharges = double.parse((firstDocument['delivery']).toString());
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


  void checkAllCustomValues(){
    if(state.cdwSwitchVal.value==false
    && state.rcliSwitchVal.value==false
    && state.assistantSwitchVal.value ==false
    && state.sliSwitchVal.value==false
    ){
      state.customCoverageValue.value=false;
    }
  }




  Future<void> checkPromoCode(BuildContext context, String code) async {
    try {
      final doc = await APis.db.collection('promoCodes').where(
          'code', isEqualTo: code).get();

      if (doc.docs.isNotEmpty) {
        final amountInt = doc.docs[0]['discountAmount'];
        final amount = double.parse(amountInt.toString());
        state.promoDiscount.value = amount;
        await checkAndAddValueToUserList(context, code, amount);
      } else {
        Snackbar.showSnackBar(
            "YB-Ride", 'PromoCode not found', Icons.error_outline);
      }
    } catch (e) {
      Snackbar.showSnackBar('YB-Ride', e.toString(), Icons.error_outline);
    }
  }


  Future<void> checkAndAddValueToUserList(BuildContext context,
      String promoCode, double amount) async {
    // Reference to the "user" collection and document with ID "1231231231"
    DocumentReference userDocumentRef = APis.db.collection('users').doc(
        'PbeNV2oob0bEWvBDFp1YUJhkuip1');

    // Fetch the current document snapshot
    final userDocument = await userDocumentRef.get();
    List list = userDocument['listOfCodes'];
    if (list.length == 0) {
      await userDocumentRef.update({
        'listOfCodes': FieldValue.arrayUnion([promoCode]),
      });
      // handle logic for giving discount
      applyDiscount(amount);
      state.promoCodeapplied.value = true;
      state.promoDiscount.value = amount;
      Navigator.pop(context);
      print("give discount");
    } else {
      if (list != 0 && !list.contains(promoCode)) {
        // Update the document to add the new value to the list
        await userDocumentRef.update({
          'listOfCodes': FieldValue.arrayUnion([promoCode]),
        });
        applyDiscount(amount);
        state.promoCodeapplied.value = true;
        state.promoDiscount.value = amount;
        Navigator.pop(context);
        print('give discount');
      } else if (list.length != 0 && list.contains(promoCode)) {
        // Handle the case where the value already exists in the list
        // handle logic for not giving discount
        // return false;

        Snackbar.showSnackBar(
            'YB-Ride', 'Already Used Promo Code', Icons.error_outline);
      }
    }
  }


  void applyDiscount(amount) {
    subtractFromTotalPrince(amount,false);
    AppConstants.isPromoApplied=true;
    AppConstants.promoDiscountAmount=amount;
  }


  // void setValues(){
  //   AppConstants.totalPrice=state.totalPrice.value;
  //
  //   // condition for getting vehicle
  //   if(state.isSelfPickup.value==true){
  //     AppConstants.isPickup=true;
  //     AppConstants.isDeliver=false;
  //   }else{
  //     AppConstants.isPickup=false;
  //     AppConstants.isDeliver=true;
  //   }
  //   // condition for extra miles and driving license
  //   if(controller.state.extraSwitchVal.value==true){
  //     AppConstants.unlimitedMiles=true;
  //   }else{
  //     AppConstants.unlimitedMiles=false;
  //   }
  //   if(controller.state.driversCheckBoxVal.value==true){
  //     AppConstants.under25Years=true;
  //   }
  //   else{
  //     AppConstants.under25Years=false;
  //   }
  //   //coverage conditions
  //   if(controller.state.standard_protection.value==true){
  //     AppConstants.standardProtection=true;
  //   }else{
  //     AppConstants.standardProtection=false;
  //   }
  //
  //   if(controller.state.essential_protection.value==true){
  //     AppConstants.liabilityProtection=true;
  //   }else{
  //     AppConstants.liabilityProtection=false;
  //   }
  //   if(controller.state.i_have_own.value==true){
  //     AppConstants.i_have_own=true;
  //   }else{
  //     AppConstants.i_have_own=false;
  //   }
  //
  //   //customCoverageConditions
  //   if(controller.state.customCoverage==true){
  //     AppConstants.customCoverage=true;
  //     if(controller.state.cdwSwitchVal.value==true){
  //       controller.addInTotalCustomCoverageValue(controller.state.CDW!);
  //     }
  //     if(controller.state.rcliSwitchVal.value==true){
  //       controller.addInTotalCustomCoverageValue(controller.state.RCLI!);
  //     }
  //     if(controller.state.assistanceVal.value==true){
  //       controller.addInTotalCustomCoverageValue(controller.state.assistance!);
  //     }
  //     if(controller.state.sliSwitchVal.value==true){
  //       controller.addInTotalCustomCoverageValue(controller.state.SLI!);
  //     }
  //   }else{
  //     AppConstants.customCoverage=false;
  //     AppConstants.totalCustomCoverage=0.0;
  //   }
  //
  //   AppConstants.bookingDate = DateTime.now().millisecondsSinceEpoch.toString();
  //
  // }

  void addInTotalCustomCoverageValue(double amount){
    AppConstants.totalCustomCoverage=AppConstants.totalCustomCoverage+(amount*AppConstants.rentDays);
  }

}