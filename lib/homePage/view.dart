import 'package:flutter/material.dart';
import 'package:flutter_admin_scaffold/admin_scaffold.dart';
import 'package:get/get.dart';
import 'package:yb_ride_user_web/components/subHeadingText.dart';
import 'package:yb_ride_user_web/helper/responsive.dart';
import '../components/headingTextWidget.dart';
import '../helper/appColors.dart';
import '../pages/CarsTypeWidget/carTypeWidget.dart';
import '../pages/Footer/HomePageFooter.dart';
import '../pages/HomePageWidget/HomePage.dart';
import '../pages/RatingStarsWidget/ratingStarsWidget.dart';
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
    return GetBuilder<HomePageCon>(builder: (con){
      return AdminScaffold(
          backgroundColor: Color.fromRGBO(255, 255, 255, 1),
          appBar: AppBar(
              backgroundColor: Color.fromRGBO(255, 255, 255, 1),
            // scrolledUnderElevation: 1,
            title: Padding(
              padding:  EdgeInsets.only(left: 20),
              child: HeadingTextWidget(title:'YBRide',fontWeight: FontWeight.bold,fontSize:30 ,),
            ),
            actions: [
              HeadingTextWidget(title: 'Become a driver partner',textColor:AppColors.appBarTextColor,fontSize: 14,fontWeight: FontWeight.normal),
              SizedBox(width: 20,),
              HeadingTextWidget(title: '|',textColor: AppColors.appBarTextColor,fontSize: 14,fontWeight: FontWeight.normal),
              SizedBox(width: 20,),
              HeadingTextWidget(title: 'FAQ',textColor: AppColors.appBarTextColor,fontSize: 14,fontWeight: FontWeight.normal),
              SizedBox(width: 20,),
              HeadingTextWidget(title: 'Account',textColor: AppColors.appBarTextColor,fontSize: 14,fontWeight: FontWeight.normal,),
              SizedBox(width: 20,),
              HeadingTextWidget(title: 'Referrals',textColor: AppColors.appBarTextColor,fontSize: 14,fontWeight: FontWeight.normal,),
              SizedBox(width: 20,),
              HeadingTextWidget(title: 'My Trips',textColor: AppColors.appBarTextColor,fontSize: 14,fontWeight: FontWeight.normal),
              SizedBox(width: 20,),
              HeadingTextWidget(title: 'Sign out',textColor: AppColors.appBarTextColor,fontSize: 14,fontWeight: FontWeight.normal),
              SizedBox(width: 30,),
            ],
            ),
          body: SingleChildScrollView(
            child: Column(
              children: [
                ResponsiveWidget.isLargeScreen(context) ? HomePageWidget() : ResponsiveWidget.isMediumScreen(context) ?HomePageWidgetMediumScreen() : HomePageWidgetSmallScreen(),
                SizedBox(height: 70,),
                HeadingTextWidget(title: 'Not your average rental car',fontSize: 40,fontWeight: FontWeight.bold,),
                SizedBox(height: 50,),
                ResponsiveWidget.isLargeScreen(context) ? Padding(
                  padding:  EdgeInsets.symmetric(horizontal:48),
                  child: AverageRentalCar(),
                ) : ResponsiveWidget.isMediumScreen(context) ?Padding(
                padding:  EdgeInsets.symmetric(horizontal:250),
                  child:AverageRentalCarMediumScreen(),
                ) : Padding(padding:
                EdgeInsets.symmetric(horizontal:120),
                  child: AverageRentalCarSmallScreen(),
                ),
                SizedBox(height: 90,),
                downlaod_YBRide(),
                SizedBox(height: 90,),
                HeadingTextWidget(title: 'Cars in our fleet',fontSize: 30,fontWeight: FontWeight.bold,),
                SizedBox(height: 30,),
                Padding(
                  padding:  EdgeInsets.symmetric(horizontal:64),
                  child: CarTypes(),
                ),
                SizedBox(height: 50,),
                Padding(
                  padding:  EdgeInsets.symmetric(horizontal:70),
                  child: howItWorkWidget(),
                ),
                SizedBox(height: 50,),
                HeadingTextWidget(title: '150,000 customers later',fontSize: 40,fontWeight: FontWeight.bold,),
                SizedBox(height: 5,),
                SubHeadingTextWidget(title: '93% of customers give us five stars'),
                SizedBox(height: 20,),
                Padding(
                  padding:  EdgeInsets.symmetric(horizontal:80),
                  child: ratingStarsWidget(),
                ),
                SizedBox(height: 50,),
                HeadingTextWidget(title: 'Locations',fontSize: 35,fontWeight: FontWeight.bold,),
                SizedBox(height: 30,),
                Container(
                  height: 350,
                  width: 1050,
                  decoration: BoxDecoration(
                    image: DecorationImage(image: AssetImage('assets/images/locations.webp'),fit: BoxFit.fill),
                    borderRadius: BorderRadius.all(Radius.circular(15))
                  ),
                ),
                SizedBox(height: 15,),
                SubHeadingTextWidget(title: 'BOSTON'),
                SizedBox(height: 60,),
                Padding(
                    padding:  EdgeInsets.symmetric(horizontal:80),
                    child: gotAnswerWidget()),
                SizedBox(height: 90,),
                Footer(),
                SizedBox(height: 40,),
                Padding(
                    padding:  EdgeInsets.symmetric(horizontal:100),
                  child: Divider(),
                ),
                SizedBox(height: 100,),

              ],
            ),
          ));
    });
  }

}

