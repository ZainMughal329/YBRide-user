

import 'package:flutter/material.dart';
import 'package:yb_ride_user_web/components/subHeadingText.dart';
import 'package:yb_ride_user_web/helper/responsive.dart';

import '../../ContainerFaqsWidget.dart';
import '../../RentalCars.dart';
import '../../footer.dart';
import 'gettingStartedWidget.dart';

class GettingStartedPage extends StatelessWidget {
  final String colName , appBarName;
  const GettingStartedPage({super.key, required this.colName, required this.appBarName});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            RentalcarsWidget(context),
            SizedBox(height: 20,),
            ResponsiveWidget.isSmallScreen(context)  ? GettingStartedWidgteSmall(colName,appBarName):GettingStartedWidgte(colName,appBarName),
            SizedBox(height: 100,),
            FooterWidget(),

          ],
        ),
      ),
    );
  }
}
