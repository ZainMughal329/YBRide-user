

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yb_ride_user_web/pages/BostonPage/Widgets/deliverToYourWidget.dart';
import 'package:yb_ride_user_web/pages/appBarPages/appBarFooter/appBatFooter.dart';

import '../../components/headingTextWidget.dart';
import '../../helper/appColors.dart';
import '../appBarPages/Accounts/view.dart';
import '../appBarPages/Referrals/view.dart';
import '../appBarPages/Trips/view.dart';
import '../gotAnswerWidget/gotAnswerWidget.dart';
import 'Widgets/RealPeopleHaveToSayWidget.dart';
import 'Widgets/gotAnswerQuestionsWidget.dart';
import 'Widgets/howitWorksWidget.dart';

class BostonPage extends StatelessWidget {
  const BostonPage({super.key});

  @override
  Widget build(BuildContext context) {
    final con = Get.put(BostonPage());
    return Scaffold(
      backgroundColor: Color.fromRGBO(255, 255, 255, 1),
      appBar:
      AppBar(
        backgroundColor: Color.fromRGBO(255, 255, 255, 1),
        // scrolledUnderElevation: 1,
        title: Padding(
          padding:  EdgeInsets.only(left: 20),
          child: HeadingTextWidget(title:'YBRide',fontWeight: FontWeight.bold,fontSize:30 ,),
        ),
        actions: [
          HeadingTextWidget(title: 'FAQ',textColor: AppColors.appBarTextColor,fontSize: 14,fontWeight: FontWeight.normal),
          SizedBox(width: 20,),
          InkWell(
              onTap: (){
                Get.to(()=>AccountPage());
              },
              child: HeadingTextWidget(title: 'Account',textColor: AppColors.appBarTextColor,fontSize: 14,fontWeight: FontWeight.normal,)),
          SizedBox(width: 20,),
          InkWell(
              onTap: (){
                Get.to(()=>TripsPages());
              },
              child: HeadingTextWidget(title: 'My Trips',textColor: AppColors.appBarTextColor,fontSize: 14,fontWeight: FontWeight.normal)),
          SizedBox(width: 20,),
          GestureDetector(

              child: HeadingTextWidget(title: 'Sign out',textColor: AppColors.appBarTextColor,fontSize: 14,fontWeight: FontWeight.normal)),
          SizedBox(width: 30,),
        ],
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              DeliverToYourDoorWidget(context),
              SizedBox(height: 50,),
              HeadingTextWidget(title: 'How it works',fontWeight: FontWeight.bold,fontSize: 40,),
              SizedBox(height: 25,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 80),
                child: Divider(thickness: .5,),
              ),
              SizedBox(height: 25,),
              HowitWorks(),
              SizedBox(height: 50,),
              RealPeopleHaveWidget(),
              SizedBox(height: 60,),
              gotFrequesntlyaQuestionsWidget(),
              SizedBox(height: 100,),
              Divider(),
              SizedBox(height:15,),
              appBarFooter(),
            ],
          ),
        ),
      ),
    );
  }
}
