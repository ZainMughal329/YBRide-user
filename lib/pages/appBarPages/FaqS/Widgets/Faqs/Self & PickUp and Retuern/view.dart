

import 'package:flutter/material.dart';
import 'package:yb_ride_user_web/components/subHeadingText.dart';
import 'package:yb_ride_user_web/pages/appBarPages/FaqS/Widgets/Faqs/Self%20&%20PickUp%20and%20Retuern/selfandPickupWidget.dart';
import 'package:yb_ride_user_web/pages/appBarPages/FaqS/Widgets/Faqs/Vehicles%20&%20Equipments/vehicleandEquipmentWidget.dart';
import 'package:yb_ride_user_web/pages/appBarPages/FaqS/Widgets/Faqs/Verification%20&%20Drivers%20Requirements/verificationandDriverwidgets.dart';

import '../../ContainerFaqsWidget.dart';
import '../../RentalCars.dart';
import '../../footer.dart';

class SelfandPickUpPage extends StatelessWidget {
  const SelfandPickUpPage({super.key});
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            RentalcarsWidget(),
            SizedBox(height: 20,),
            SelfandPickUpWidgte(),
            SizedBox(height: 100,),
            FooterWidget(),

          ],
        ),
      ),
    );
  }
}
