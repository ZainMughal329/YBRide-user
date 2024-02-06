

import 'package:flutter/material.dart';
import 'package:yb_ride_user_web/pages/appBarPages/appBarFooter/appBatFooter.dart';

import '../../../../../components/headingTextWidget.dart';
import '../../../../../components/reuseableButton.dart';
import '../../../../../components/subHeadingText.dart';
import '../../../../../helper/appColors.dart';
import '../../../../../helper/responsive.dart';

class SharedTripPages extends StatelessWidget {
  const SharedTripPages({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.all(20),
        child: Container(
          decoration: BoxDecoration(
            color: Color.fromRGBO(255, 255, 255, 1),
          ),
          child: Padding(
            padding: const EdgeInsets.only(top: 50),
            child: Column(
              children: [
                Container(
                  // height: 400,
                  width: 650,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(
                      Radius.circular(10),
                    ),
                    border: Border.all(
                      color: Colors.grey,
                    ),
                  ),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 60,
                      ),
                      Container(
                        height: 50,
                        width: 50,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25),
                        ),
                        child: Icon(
                          Icons.share_location_rounded,
                          color: AppColors.iconColor,
                          size: 40,
                        ),
                      ),
                      SizedBox(
                        height:40,
                      ),
                      Center(
                        child: SizedBox(
                          width:900,
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
                        height:20,
                      ),
                      Center(
                        child: SizedBox(
                            width: 800,
                            child: SubHeadingTextWidget(
                              textAlign: TextAlign.center,
                              title:
                              "Trips, where you have accepted and invite to be an additional driver, will show up here!",
                              fontWeight: FontWeight.w600,
                              textColor: Colors.black54,
                              fontSize: 15,
                              maxLines:5,
                              overflow: TextOverflow.ellipsis,
                            )),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                            left:20, right: 20),
                        child:Container(
                            width: ResponsiveWidget.isLargeScreen(context)
                                ? 400
                                : 200,
                          height: 50,
                          decoration: BoxDecoration(
                              color: AppColors.buttonColor,
                              boxShadow: [
                                BoxShadow(color: Colors.grey.withOpacity(.1))
                              ]
                          ),
                          child: Center(
                            child: HeadingTextWidget(
                              title: 'Book a YBCar',textColor:AppColors.whiteColor,fontSize: 14,fontWeight: FontWeight.w500,
                            ),
                          ),
                        )
                      ),
                      SizedBox(
                        height: 20,
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 50,),
                Divider(),
                SizedBox(height: 20,),
                ResponsiveWidget.isLargeScreen(context) ?  appBarFooter() : appBarFooterSmall(context),
                SizedBox(height: 30,)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
