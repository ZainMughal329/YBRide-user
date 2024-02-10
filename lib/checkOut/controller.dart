

import 'package:get/get.dart';
import 'package:yb_ride_user_web/checkOut/state.dart';

class CheckOutCon extends GetxController{
  final state = CheckOutState();


//   for update total price when click on custom Covergae_CDW

  void updateTotalPrice_Custom_CDW() {
    if (state.cdwSwitchVal.value) {
      state. totalPrice.value = 2.11 +(state.cdwSwitchVal.value?24.99:0)+(state.rcliSwitchVal.value?24.99:0)+(state.sliSwitchVal.value?199.99:0);
    } else {
      state.totalPrice.value = 2.11;
    }
  }

  //   for update total price when click on custom Covergae_RCLI

  void updateTotalPrice_Custom_RCLI() {
    if (state.rcliSwitchVal.value) {
      state. totalPrice.value = 2.11 +(state.rcliSwitchVal.value?24.99:0)+(state.cdwSwitchVal.value?24.99:0)+(state.sliSwitchVal.value?19.99:0);
    } else {
      state.totalPrice.value = 2.11;
    }
  }

//   for update total price when click on custom Covergae_SLI
  void updateTotalPrice_Custom_SLI() {
    if (state.sliSwitchVal.value) {
      state. totalPrice.value = 2.11 +(state.rcliSwitchVal.value?24.99:0)+(state.cdwSwitchVal.value?24.99:0)+(state.sliSwitchVal.value?19.99:0);
    } else {
      state.totalPrice.value = 2.11;
    }
  }




  void subtractCustomCoverageValue(String coverageType) {
    double coverageValue = 0;

    switch (coverageType) {
      case 'CDW':
        coverageValue = 24.99;
        break;
      case 'RCLI':
        coverageValue = 24.99;
        break;
      case 'SLI':
        coverageValue = 19.99;
        break;
    // Add more cases for other custom coverages if needed
    }

    state.totalPrice.value -= coverageValue;
  }



}