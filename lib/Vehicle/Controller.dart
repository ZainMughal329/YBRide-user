

import 'package:get/get.dart';
import 'package:yb_ride_user_web/Vehicle/state.dart';
import 'package:yb_ride_user_web/Vehicle/view.dart';

class VehicleCon extends GetxController{
  final state = VehicleState();

  //  for hide weekDay container
  void hideContainer() {
    state.isContainerVisible.value = false;
  }
}