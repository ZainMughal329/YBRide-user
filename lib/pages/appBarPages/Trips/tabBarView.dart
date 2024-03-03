

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:yb_ride_user_web/pages/appBarPages/Trips/allTripPage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:yb_ride_user_web/pages/appBarPages/Trips/widgets/completedTrips.dart';
import 'package:yb_ride_user_web/pages/appBarPages/Trips/widgets/deliveredTrips.dart';
import 'package:yb_ride_user_web/pages/appBarPages/Trips/widgets/pendingsTrips.dart';
import 'package:yb_ride_user_web/pages/appBarPages/Trips/widgets/shippedTrips.dart';
import '../../../components/drwer.dart';
import '../../../components/headingTextWidget.dart';
import '../../../helper/appColors.dart';
import '../../../helper/responsive.dart';
import '../Become_Driver/view.dart';
import '../FaqS/view.dart';
import 'controller.dart';
import '../../../helper/session_Controller.dart';
import '../../../helper/show_progress_indicator.dart';
import '../../../sessions/signUp/view.dart';
import '../Accounts/view.dart';
import '../Become_Driver/view.dart';
import '../FaqS/view.dart';
import '../Referrals/view.dart';


class TripsHomePage extends GetView<TripCon> {
  const TripsHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(TripCon());
    final GlobalKey<ScaffoldState> _scaffoldKey =
    new GlobalKey<ScaffoldState>();
    return Scaffold(
      key: _scaffoldKey,
      drawer: BuildDrawer.buildDrawer(context),
      drawerScrimColor: Colors.white,
      drawerEnableOpenDragGesture: false,
      backgroundColor: Color.fromRGBO(255, 255, 255, 1),
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(255, 255, 255, 1),
        // scrolledUnderElevation: 1,
        leading: Container(),
        title: Padding(
          padding: EdgeInsets.only(left: 20),
          child: HeadingTextWidget(
            title: 'YBRide',
            fontWeight: FontWeight.bold,
            fontSize: 30,
          ),
        ),
        actions: ResponsiveWidget.isLargeScreen(context)
            ? [
          InkWell(
            onTap: () {
              Get.to(() => BecomeDriverPage());
            },
            child: HeadingTextWidget(
                title: 'Become a driver partner',
                textColor: AppColors.appBarTextColor,
                fontSize: 14,
                fontWeight: FontWeight.normal),
          ),
          SizedBox(
            width: 20,
          ),
          HeadingTextWidget(
              title: '|',
              textColor: AppColors.appBarTextColor,
              fontSize: 14,
              fontWeight: FontWeight.normal),
          SizedBox(
            width: 20,
          ),
          InkWell(
            onTap: () {
              Get.to(() => FaqPage());
            },
            child: HeadingTextWidget(
                title: 'FAQ',
                textColor: AppColors.appBarTextColor,
                fontSize: 14,
                fontWeight: FontWeight.normal),
          ),
          SizedBox(
            width: 20,
          ),
          InkWell(
              onTap: () {
                Get.to(() => AccountPage());
              },
              child: HeadingTextWidget(
                title: 'Account',
                textColor: AppColors.appBarTextColor,
                fontSize: 14,
                fontWeight: FontWeight.normal,
              )),

          SizedBox(
            width: 20,
          ),
          InkWell(
              onTap: () {
                Get.to(() => TripsHomePage());
              },
              child: HeadingTextWidget(
                  title: 'My Trips',
                  textColor: AppColors.appBarTextColor,
                  fontSize: 14,
                  fontWeight: FontWeight.normal)),
          SizedBox(
            width: 20,
          ),
          GestureDetector(
              onTap: () async {
                showProgressIndicator(context);
                Future.delayed(Duration(seconds: 3) , () async {
                  await FirebaseAuth.instance.signOut().then((value) {

                    SessionController().userId = '';
                    Navigator.pop(context);
                    Get.offAll(SignUpPages());
                  });
                });

              },
              child: HeadingTextWidget(
                  title: 'Sign out',
                  textColor: AppColors.appBarTextColor,
                  fontSize: 14,
                  fontWeight: FontWeight.normal)),
          SizedBox(
            width: 30,
          ),
        ]
            : [
          IconButton(
            onPressed: () {
              _scaffoldKey.currentState!.openDrawer();
            },
            icon: Icon(
              Icons.menu,
              color: Colors.grey,
            ),
          ),
          SizedBox(
            width: 30,
          ),
        ],
      ),
      body: SafeArea(
        child: Column(
          children: [
            Container(
              child: TabBar(
                indicatorSize: TabBarIndicatorSize.tab,
                tabAlignment:TabAlignment.fill,
                labelColor: Colors.black,
                        indicatorColor: AppColors.buttonColor,
                        indicator: UnderlineTabIndicator(
                          borderSide: BorderSide(width: 2.0,color: AppColors.buttonColor), // Adjust the width of the line
                        ),
                        labelStyle: GoogleFonts.openSans(
                          fontSize: 16.0, // Customize the font size
                          fontWeight: FontWeight.w600,
                        ),

                        indicatorPadding: EdgeInsets.all(0),
                        unselectedLabelColor: Colors.black,
                        unselectedLabelStyle: GoogleFonts.openSans(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,

                        ),
                tabs: [
                  Tab(
                    text: 'All Trips',
                  ),
                Tab(
                            text: 'Pending',
                          ),
                  Tab(
                    text: 'Shipped',
                  ),
                  Tab(
                    text: 'Delivered',
                  ),
                  Tab(
                    text: 'Completed',
                  ),
                ],
                controller: controller.tabController,


              ),
            ),
            Expanded(
                flex: 5,
                child: Container(
                  width: double.infinity,
              margin: EdgeInsets.only(top: 10),
                  child: TabBarView(
                    controller: controller.tabController,
                    children: [
                      TripsPages(),
                      pendingTripsPage(),
                      shippedTripspage(),
                      deliveredTripsPage(),
                      completedTripsPage(),


                    ],
                  ),
            ))
          ],
        ),
      ),

    );
  }
}
