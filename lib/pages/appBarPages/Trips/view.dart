

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:yb_ride_user_web/pages/customAppBar/customAppBar.dart';

import '../../../components/headingTextWidget.dart';
import '../../../helper/appColors.dart';
import 'controller.dart';
import 'my_trips/my_trips/view.dart';
import 'my_trips/shared_trips/view.dart';

class TripsPages extends StatelessWidget {
  const TripsPages({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = TripCon();
    return Scaffold(
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
     body: SafeArea(child: Column(
       children: [
         Container(
           child: TabBar(
             indicatorSize: TabBarIndicatorSize.tab,
             tabAlignment:TabAlignment.fill,
             labelColor: Colors.black54,
             indicatorColor: AppColors.buttonColor,
             indicator: UnderlineTabIndicator(
               borderSide: BorderSide(width: 2.0,color: AppColors.buttonColor), // Adjust the width of the line
             ),
             labelStyle: GoogleFonts.openSans(
               fontSize: 16.0, // Customize the font size
               fontWeight: FontWeight.w600,
             ),
             indicatorPadding: EdgeInsets.all(0),
             unselectedLabelColor: Colors.black54,
             unselectedLabelStyle: GoogleFonts.openSans(
               fontSize: 16,
               fontWeight: FontWeight.w600,
             ),
             tabs: [

               Tab(
                 text: 'My Trips',
               ),
               Tab(
                 text: 'Shared Trips',

               ),

             ],
             controller: controller.tabController,
           ),
         ),
         Expanded(
           flex: 5,
           child: Container(
             decoration: BoxDecoration(
             ),
             margin: EdgeInsets.only(top: 10),
             // height: MediaQuery.of(context).size.height,
             width: double.infinity,
             child: TabBarView(
               controller: controller.tabController,
               children: [
                 MyTripPages(),
                 SharedTripPages(),
               ],
             ),
           ),)
       ],
     )),
    );
  }
}
