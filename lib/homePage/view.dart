import 'package:flutter/material.dart';
import 'package:flutter_admin_scaffold/admin_scaffold.dart';
import 'package:get/get.dart';
import 'package:yb_ride_user_web/components/subHeadingText.dart';
import 'package:yb_ride_user_web/helper/responsive.dart';
import 'package:yb_ride_user_web/pages/BostonPage/view.dart';
import 'package:yb_ride_user_web/pages/appBarPages/Become_Driver/view.dart';
import '../components/drwer.dart';
import '../components/headingTextWidget.dart';
import '../helper/appColors.dart';
import '../pages/CarsTypeWidget/carTypeWidget.dart';
import '../pages/Footer/HomePageFooter.dart';
import '../pages/HomePageWidget/HomePage.dart';
import '../pages/RatingStarsWidget/ratingStarsWidget.dart';
import '../pages/appBarPages/Accounts/view.dart';
import '../pages/appBarPages/FaqS/view.dart';
import '../pages/appBarPages/Referrals/view.dart';
import '../pages/appBarPages/Trips/view.dart';
import '../pages/averageRentalCarWidget/averageRentalCarWidget.dart';
import '../pages/downlaodYBRideWidget/downlaod_ybRide.dart';
import '../pages/gotAnswerWidget/gotAnswerWidget.dart';
import '../pages/howItWorkWidgets/how_It_WorkWidget.dart';
import 'controller.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final con = Get.put(HomePageCon());
    final GlobalKey<ScaffoldState> _scaffoldKey =
        new GlobalKey<ScaffoldState>();

    return GetBuilder<HomePageCon>(builder: (con) {
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
                          Get.to(() => ReferralPage());
                        },
                        child: HeadingTextWidget(
                          title: 'Referrals',
                          textColor: AppColors.appBarTextColor,
                          fontSize: 14,
                          fontWeight: FontWeight.normal,
                        )),
                    SizedBox(
                      width: 20,
                    ),
                    InkWell(
                        onTap: () {
                          Get.to(() => TripsPages());
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
                        onTap: () {
                          con.state.auth.signOut();
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
          body: SingleChildScrollView(
            child: Column(
              children: [
                ResponsiveWidget.isLargeScreen(context)
                    ? HomePageWidget()
                    : ResponsiveWidget.isMediumScreen(context)
                        ? HomePageWidgetMediumScreen()
                        : HomePageWidgetSmallScreen(),
                SizedBox(
                  height: 70,
                ),
                HeadingTextWidget(
                  title: 'Not your average rental car',
                  fontSize: ResponsiveWidget.isLargeScreen(context) ? 40 : 26,
                  fontWeight: FontWeight.bold,
                ),
                SizedBox(
                  height: 50,
                ),
                ResponsiveWidget.isLargeScreen(context)
                    ? Padding(
                        padding: EdgeInsets.symmetric(horizontal: 48),
                        child: AverageRentalCar(),
                      )
                    : ResponsiveWidget.isMediumScreen(context)
                        ? Padding(
                            padding: EdgeInsets.symmetric(horizontal: 250),
                            child: AverageRentalCarMediumScreen(),
                          )
                        : Padding(
                            padding: EdgeInsets.symmetric(horizontal: 120),
                            child: AverageRentalCarSmallScreen(),
                          ),
                SizedBox(
                  height: 90,
                ),
                ResponsiveWidget.isLargeScreen(context)
                    ? downlaod_YBRide()
                    : downlaod_YBRideMediumScreen(),
                SizedBox(
                  height: 90,
                ),
                HeadingTextWidget(
                  title: 'Cars in our fleet',
                  fontSize: ResponsiveWidget.isLargeScreen(context) ? 40 : 26,
                  fontWeight: FontWeight.bold,
                ),
                SizedBox(
                  height: 30,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal:
                          ResponsiveWidget.isLargeScreen(context) ? 64 : 0),
                  child: ResponsiveWidget.isLargeScreen(context)
                      ? CarTypes()
                      : SingleChildScrollView(child: CarTypesMediumScreen()),
                ),
                SizedBox(
                  height: 50,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal:
                          ResponsiveWidget.isLargeScreen(context) ? 70 : 0),
                  child: ResponsiveWidget.isLargeScreen(context)
                      ? howItWorkWidget()
                      : howItWorkWidgetMediumScreen(context),
                ),
                SizedBox(
                  height: 50,
                ),
                HeadingTextWidget(
                  title: '150,000 customers later',
                  fontSize: ResponsiveWidget.isLargeScreen(context) ? 40 : 26,
                  fontWeight: FontWeight.bold,
                ),
                SizedBox(
                  height: 5,
                ),
                SubHeadingTextWidget(
                    title: '93% of customers give us five stars'),
                SizedBox(
                  height: 20,
                ),
                ResponsiveWidget.isLargeScreen(context)
                    ? Padding(
                        padding: EdgeInsets.symmetric(horizontal: 80),
                        child: ratingStarsWidget(),
                      )
                    : Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        child: ratingStarsWidgetMediumScreen(),
                      ),
                SizedBox(
                  height: 50,
                ),
                HeadingTextWidget(
                  title: 'Locations',
                  fontSize: ResponsiveWidget.isLargeScreen(context) ? 40 : 26,
                  fontWeight: FontWeight.bold,
                ),
                SizedBox(
                  height: 30,
                ),
                Container(
                  height: ResponsiveWidget.isLargeScreen(context)
                      ? 350
                      : ResponsiveWidget.isMediumScreen(context)
                          ? 250
                          : 150,
                  width: ResponsiveWidget.isLargeScreen(context)
                      ? 1050
                      : MediaQuery.of(context).size.width * .85,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('assets/images/locations.webp'),
                          fit: BoxFit.fill),
                      borderRadius: BorderRadius.all(Radius.circular(15))),
                ),
                SizedBox(
                  height: 15,
                ),
                InkWell(
                  onTap: (){
                    Get.to(()=>BostonPage());
                  },
                  child: SubHeadingTextWidget(
                    title: 'BOSTON',
                    textColor: AppColors.blackColor,
                    decorationColor: AppColors.blackColor,
                    decoration: TextDecoration.underline,
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                SizedBox(
                  height: 60,
                ),
                ResponsiveWidget.isLargeScreen(context)
                    ? Padding(
                        padding: EdgeInsets.symmetric(horizontal: 80),
                        child: gotAnswerWidget(context))
                    : gotAnswerWidgetMediumScreen(context),
                SizedBox(
                  height: 90,
                ),
                Footer(context),
                SizedBox(
                  height: 40,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 100),
                  child: Divider(),
                ),
                SizedBox(
                  height: 100,
                ),
              ],
            ),
          ));
    });
  }
}
