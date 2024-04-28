



import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yb_ride_user_web/helper/responsive.dart';
import 'package:yb_ride_user_web/pages/appBarPages/FaqS/controller.dart';

import 'Widgets/ContainerFaqsWidget.dart';
import 'Widgets/RentalCars.dart';
import 'Widgets/footer.dart';

class FaqPage extends StatelessWidget {
  const FaqPage({super.key});

  @override
  Widget build(BuildContext context) {
    final con = Get.put(FaqCon());
    return ResponsiveWidget.isSmallScreen(context) ?
    SingleChildScrollView(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            RentalcarsWidgetSmall(context),
            SizedBox(height: 50,),
            ContainerFaqsSmall(),
            SizedBox(height: 100,),
            FooterWidget(),

          ],
        ),
      ),
    ):
    SingleChildScrollView(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            RentalcarsWidget(context),
            SizedBox(height: 50,),
            ContainerFaqs(context),
            SizedBox(height: 100,),
            FooterWidget(),

          ],
        ),
      ),
    )

    ;
  }
}
