
import 'package:fl_country_code_picker/fl_country_code_picker.dart';
import 'package:get/get.dart';
import 'package:yb_ride_user_web/pages/appBarPages/Become_Driver/state.dart';

class BecomeDriverCon extends GetxController{

  final state = BecomeDriverState();


  void toggleCollapsed() {
    state.isCollapsed.value = !state.isCollapsed.value;
  }
  Rx<CountryCode> code =
      CountryCode(name: 'United States', code: 'US', dialCode: '+1').obs;

  Rx<String> serviceOffering = 'Select'.obs;
  void onFocusChange(bool value) {
    state.focused.value = value;
  }


}