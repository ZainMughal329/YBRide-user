



import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yb_ride_user_web/pages/appBarPages/FaqS/controller.dart';

import 'Widgets/ContainerFaqsWidget.dart';
import 'Widgets/RentalCars.dart';
import 'Widgets/footer.dart';

class FaqPage extends StatelessWidget {
  const FaqPage({super.key});

  @override
  Widget build(BuildContext context) {
    final con = Get.put(FaqCon());
    return SingleChildScrollView(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            RentalcarsWidget(),
            SizedBox(height: 50,),
            ContainerFaqs(),
            SizedBox(height: 100,),
            FooterWidget(),

          ],
        ),
      ),
    );
  }
}
