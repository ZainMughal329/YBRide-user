

import 'package:flutter/material.dart';
import 'package:yb_ride_user_web/components/subHeadingText.dart';
import 'package:yb_ride_user_web/pages/appBarPages/FaqS/Widgets/Faqs/Vehicles%20&%20Equipments/vehicleandEquipmentWidget.dart';
import 'package:yb_ride_user_web/pages/appBarPages/FaqS/Widgets/Faqs/Verification%20&%20Drivers%20Requirements/verificationandDriverwidgets.dart';

import '../../ContainerFaqsWidget.dart';
import '../../RentalCars.dart';
import '../../footer.dart';
import 'insuranceandAccidentsWidgtes.dart';

class insuranceandAccidentspPage extends StatelessWidget {
  const insuranceandAccidentspPage({super.key});

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
            InsuranceandAccidentspWidgte(),
            SizedBox(height: 100,),
            FooterWidget(),

          ],
        ),
      ),
    );
  }
}
