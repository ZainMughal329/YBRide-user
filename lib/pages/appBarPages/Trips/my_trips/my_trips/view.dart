


import 'package:flutter/material.dart';

import '../../../../../components/headingTextWidget.dart';
import '../../../../../components/subHeadingText.dart';
import '../../../../../helper/appColors.dart';
import '../../../appBarFooter/appBatFooter.dart';

class MyTripPages extends StatelessWidget {
  const MyTripPages({super.key});
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        decoration: BoxDecoration(
          color: Color.fromRGBO(255, 255, 255, 1),
        ),
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(top: 25),
              child: Image(
                  image: AssetImage(
                      'assets/images/howWorks.webp'),
                  height:300,
                  width: 500),
            ),
            SizedBox(
              height: 30,
            ),
            Center(
              child: SizedBox(
                width: 900,
                child: HeadingTextWidget(
                  fontSize:  16,
                  fontWeight: FontWeight.w600,
                  textAlign: TextAlign.center,
                  textColor: Colors.black54,
                  title:'No trips (yet)',
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Center(
              child: SizedBox(
                  width: 800,
                  child: SubHeadingTextWidget(
                    textAlign: TextAlign.center,
                    title:
                    "You haven't booked YBCars yet. How about doing so for your next adventure?",
                    fontWeight: FontWeight.w600,
                    textColor: Colors.black54,
                    fontSize: 14,
                    maxLines:5,
                    overflow: TextOverflow.ellipsis,
                  )),
            ),
            SizedBox(
              height:20,
            ),
            Padding(
              padding: EdgeInsets.only(
                  left: 20, right: 20),
              child: Container(
                width: 400,
                height: 50,
                decoration: BoxDecoration(
                    color: AppColors.buttonColor,
                    boxShadow: [
                      BoxShadow(color: Colors.grey.withOpacity(.1))
                    ]
                ),
                child: Center(
                  child: HeadingTextWidget(
                    title: 'Book your YBCar now',textColor:AppColors.whiteColor,fontSize: 14,fontWeight: FontWeight.w500,
                  ),
                ),
              )

            ),
            SizedBox(height: 50,),
            Divider(),
            SizedBox(height: 20,),
            appBarFooter(),
            SizedBox(height: 30,)
      
      
          ],
        ),
      ),
    );
  }
}
