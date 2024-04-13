import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_admin_scaffold/admin_scaffold.dart';
import 'package:get/get.dart';
import 'package:yb_ride_user_web/components/snackbar_widget.dart';
import 'package:yb_ride_user_web/components/subHeadingText.dart';
import 'package:yb_ride_user_web/helper/AppConstants.dart';
import 'package:yb_ride_user_web/helper/responsive.dart';
import 'package:yb_ride_user_web/homePage/HomePageWidget/HomePage.dart';
import 'package:yb_ride_user_web/pages/BostonPage/view.dart';
import 'package:yb_ride_user_web/pages/appBarPages/Become_Driver/view.dart';
import 'package:yb_ride_user_web/sessions/signUp/view.dart';
import '../checkOut/Widget/payment_con.dart';
import '../components/drwer.dart';
import '../components/headingTextWidget.dart';
import '../helper/appColors.dart';
import '../helper/session_Controller.dart';
import '../helper/show_progress_indicator.dart';
import '../pages/CarsTypeWidget/carTypeWidget.dart';
import '../pages/Footer/HomePageFooter.dart';
import '../pages/RatingStarsWidget/ratingStarsWidget.dart';
import '../pages/appBarPages/Accounts/view.dart';
import '../pages/appBarPages/FaqS/view.dart';
import '../pages/appBarPages/Referrals/view.dart';
import '../pages/appBarPages/Trips/allTripPage.dart';
import '../pages/appBarPages/Trips/tabBarView.dart';
import '../pages/averageRentalCarWidget/averageRentalCarWidget.dart';
import '../pages/downlaodYBRideWidget/downlaod_ybRide.dart';
import '../pages/gotAnswerWidget/gotAnswerWidget.dart';
import '../pages/howItWorkWidgets/how_It_WorkWidget.dart';
import 'controller.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    AppConstants.resetToInitialState();
    print("Sessionid");
    print(SessionController().userId.toString());
    // SessionController().userId=FirebaseAuth.instance.currentUser!.uid.toString();
    final con = Get.put(HomePageCon());
    con.fetchContactDetails();
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
          leading: Container(
          ),
          title: Padding(
            padding: EdgeInsets.only(left: 5),
            child: InkWell(
              onTap:(){
                Get.offAll(()=>HomePage());
              },
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    child: Image.asset('assets/images/circleLogo.png',height: 40,width: 40,),
                  ),
                  SizedBox(width: 10,),
                  HeadingTextWidget(
                    title: 'YBRide',
                    fontWeight: FontWeight.bold,
                    fontSize: 30,
                  ),
                ],
              ),
            ),
          ),
          actions: ResponsiveWidget.isLargeScreen(context)
              ? [
            InkWell(
              onTap: () {
                Get.to(() => BecomeDriverPage());
                // final contt = Get.put(PaymentController());
                // contt.sendPaymentRequest();
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
                  SessionController().userId == null ? Snackbar.showSnackBar('YB-Rude',"Login to Your Account", Icons.error_outline) :
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
                  SessionController().userId == null ? Snackbar.showSnackBar('YB-Rude',"Login to Your Account", Icons.error_outline) :
                  Get.to(() => TripsHomePage()) ;
                },
                child: HeadingTextWidget(
                    title: 'My Trips',
                    textColor: AppColors.appBarTextColor,
                    fontSize: 14,
                    fontWeight: FontWeight.normal)),
            SizedBox(
              width: 20,
            ),
            SessionController().userId != null  ? GestureDetector(
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
                    fontWeight: FontWeight.normal))  : GestureDetector(
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
                    title: 'Login/Sign up',
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
                  ? HomePageWidget(context,con)
                  : ResponsiveWidget.isMediumScreen(context)
                  ? HomePageWidgetMediumScreen(context,con)
                  : HomePageWidgetSmallScreen(context,con),
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
                padding: EdgeInsets.symmetric(horizontal: 10),
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
                  Get.to(()=>HomePage());
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
  }
}
