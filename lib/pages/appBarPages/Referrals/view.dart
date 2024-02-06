

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yb_ride_user_web/components/subHeadingText.dart';
import 'package:yb_ride_user_web/pages/Footer/HomePageFooter.dart';
import 'package:yb_ride_user_web/pages/appBarPages/Referrals/controller.dart';
import 'package:yb_ride_user_web/pages/appBarPages/appBarFooter/appBatFooter.dart';

import '../../../components/drwer.dart';
import '../../../components/headingTextWidget.dart';
import '../../../helper/appColors.dart';
import '../../../helper/responsive.dart';

class ReferralPage extends StatelessWidget {
  const ReferralPage({super.key});

  @override
  Widget build(BuildContext context) {

    final GlobalKey<ScaffoldState> _scaffoldKey =
    new GlobalKey<ScaffoldState>();
    final con = Get.put(ReferralsCon());
    return Scaffold(

      key: _scaffoldKey,
      drawer: BuildDrawer.buildDrawer(context),
      drawerScrimColor: Colors.white,
      drawerEnableOpenDragGesture: false,
      backgroundColor: Color.fromRGBO(255, 255, 255, 1),
      appBar:
      AppBar(
        backgroundColor: Color.fromRGBO(255, 255, 255, 1),
        // scrolledUnderElevation: 1,
        leading: Container(),
        title: HeadingTextWidget(title:'YBRide',fontWeight: FontWeight.bold,fontSize:30 ,),
        actions: ResponsiveWidget.isLargeScreen(context)
            ?  [
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
          GestureDetector(
              child: HeadingTextWidget(title: 'Sign out',textColor: AppColors.appBarTextColor,fontSize: 14,fontWeight: FontWeight.normal)),
          SizedBox(width: 30,),
        ] :[
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
      body: ResponsiveWidget.isLargeScreen(context) ?  SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 70,
              ),
              CircleAvatar(
                radius: 50,

                backgroundColor: (Color.fromRGBO(255, 239, 2,.1)),
                child: Image(
                  height: 70,
                  image: AssetImage('assets/images/gift.png'),
                ),
              ),
              SizedBox(
                height: 40,
              ),
              HeadingTextWidget(title: 'Invite Your Friends',fontSize: 50,fontWeight: FontWeight.bold,),
              SizedBox(
                height: 20,
              ),
              HeadingTextWidget(title: 'Give \$30.00, Get',fontSize: 50,fontWeight: FontWeight.bold,textColor: AppColors.buttonColor,),
              SizedBox(
                height: 10,
              ),
              HeadingTextWidget(title: '\$30.00',fontSize: 55,fontWeight: FontWeight.bold,textColor: AppColors.buttonColor,),
              SizedBox(
                height: 20,
              ),
              SubHeadingTextWidget(title: 'Your friend gets a \$30.00 discount on their first booking and you',fontWeight: FontWeight.w500,),
              SizedBox(
                height: 10,
              ),
              SubHeadingTextWidget(title: 'earn \$30.00 in YBRide credits.',fontWeight: FontWeight.w500,),
              SizedBox(
                height: 20,
              ),
              SubHeadingTextWidget(title: 'Referral Terms & Conditions',textColor: AppColors.buttonColor,),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 400),
                child: Divider(thickness: .7,),
              ),
              SizedBox(
                height: 20,
              ),
              HeadingTextWidget(title: 'Complete a Trip to Get Your Referral Code',fontSize: 23,fontWeight: FontWeight.bold,),
              SizedBox(
                height:15,
              ),
              SubHeadingTextWidget(title: 'Book your trip today!',fontWeight: FontWeight.w500,fontSize: 16,),
              SizedBox(
                height:20,
              ),
              Container(
                height: 140,
                width: 600,
                decoration: BoxDecoration(
                  color:Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  border: Border.all(color: Colors.black54),
                  boxShadow: [
                    BoxShadow(color: Colors.black.withOpacity(.7))
                  ],
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: ListTile(
                        leading: Icon(Icons.location_on),
                        title: SubHeadingTextWidget(title: 'Delivery and return location',textColor: AppColors.buttonColor,),
                        subtitle:SubHeadingTextWidget(title: 'Tap to search',) ,
                      ),
                    ),
                    Divider(thickness: 1,),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          HeadingTextWidget(
                            title: 'Same delivery & return locations',
                            fontSize: 16,
                          ),
                          Spacer(),
                          Obx(() =>_checkBox(con.state.isCheckBox.value, (value) {
                            con.state.isCheckBox.value = value;
                          }, context), ),


                        ],
                      ),
                    ),


                  ],
                ),
              ),
              SizedBox(
                height:15,
              ),
              Container(
                height: 90,
                width: 600,
                decoration: BoxDecoration(
                  color:Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  border: Border.all(color: Colors.black54),
                  boxShadow: [
                    BoxShadow(color: Colors.black.withOpacity(.7))
                  ],
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: ListTile(
                        leading: Icon(Icons.calendar_month),
                        title: Row(
                          children: [
                            HeadingTextWidget(title: 'From',textColor: AppColors.buttonColor,fontSize: 18,),
                            SizedBox(width: 10,),
                            SubHeadingTextWidget(title: 'Feb 05, 11.00 AM',textColor: Colors.black,fontSize: 18,),
                          ],
                        ),
                        subtitle: Row(
                          children: [
                            HeadingTextWidget(title: 'To     ',textColor: AppColors.buttonColor,fontSize: 18,),
                            SizedBox(width: 10,),
                            SubHeadingTextWidget(title: 'Feb 09, 11.00 AM',textColor: Colors.black,fontSize: 18,),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                height: 60,
                width: 600,
                decoration: BoxDecoration(
                  color:AppColors.buttonColor,
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  boxShadow: [
                    BoxShadow(color: Colors.black.withOpacity(.7))
                  ],
                ),
                child: Center(
                  child: HeadingTextWidget(
                    title: 'Search',
                    fontWeight: FontWeight.bold,
                    textColor: AppColors.whiteColor,
                  ),
                )
              ),
              SizedBox(height: 50,),
              Divider(),
              SizedBox(height: 20,),
              appBarFooter(),
              SizedBox(
                height: 20,
              ),





            ],
          ),
        ),
      ) :

      SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 30.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 20,
                    ),
                    CircleAvatar(
                      radius: 50,

                      backgroundColor: (Color.fromRGBO(255, 239, 2,.1)),
                      child: Image(
                        height: 50,
                        image: AssetImage('assets/images/gift.png'),
                      ),
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    HeadingTextWidget(title: 'Invite Your Friends',fontSize: 30,fontWeight: FontWeight.bold,),
                    SizedBox(
                      height: 20,
                    ),
                    HeadingTextWidget(title: 'Give \$30.00, Get',fontSize: 30,fontWeight: FontWeight.bold,textColor: AppColors.buttonColor,),
                    SizedBox(
                      height: 10,
                    ),
                    HeadingTextWidget(title: '\$30.00',fontSize: 30,fontWeight: FontWeight.bold,textColor: AppColors.buttonColor,),
                    SizedBox(
                      height: 20,
                    ),
                    SubHeadingTextWidget(title: 'Your friend gets a \$30.00 discount on their first booking and you earn \$30.00 in YBRide credits.',fontWeight: FontWeight.w500,fontSize:15,textAlign: TextAlign.center,),

                    SizedBox(
                      height: 20,
                    ),
                    SubHeadingTextWidget(title: 'Referral Terms & Conditions',textColor: AppColors.buttonColor,fontWeight: FontWeight.w600,),
                    SizedBox(
                      height: 20,
                    ),
                    Divider(),
                    SizedBox(
                      height: 20,
                    ),
                    HeadingTextWidget(title: 'Complete a Trip to Get Your Referral Code',fontSize: 18,fontWeight: FontWeight.bold,),
                    SizedBox(
                      height:15,
                    ),
                    SubHeadingTextWidget(title: 'Book your trip today!',fontWeight: FontWeight.w500,fontSize: 15,),
                    SizedBox(
                      height:20,
                    ),
                    Container(
                      height: 140,
                      width: 600,
                      decoration: BoxDecoration(
                        color:Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(10)),

                        boxShadow: [
                          BoxShadow(color: Colors.black.withOpacity(.2),
                          blurRadius: 5,
                            spreadRadius: 1,
                            offset: Offset(1, 1),
                          )
                        ],
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: ListTile(
                              leading: Icon(Icons.location_on),
                              title: SubHeadingTextWidget(title: 'Delivery and return location',textColor: AppColors.buttonColor,fontSize: 15,fontWeight: FontWeight.w600,),
                              subtitle:SubHeadingTextWidget(title: 'Tap to search',fontSize: 13,) ,
                            ),
                          ),
                          Divider(thickness: 1,),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                HeadingTextWidget(
                                  title: 'Same delivery & return locations',
                                  fontSize: 14,
                                ),
                                Spacer(),
                                Obx(() =>_checkBox(con.state.isCheckBox.value, (value) {
                                  con.state.isCheckBox.value = value;
                                }, context), ),


                              ],
                            ),
                          ),


                        ],
                      ),
                    ),
                    SizedBox(
                      height:15,
                    ),
                    Container(
                      height: 90,
                      width: 600,
                      decoration: BoxDecoration(
                        color:Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        boxShadow: [
                          BoxShadow(color: Colors.black.withOpacity(.2),
                            blurRadius: 5,
                            spreadRadius: 1,
                            offset: Offset(1, 1),
                          )
                        ],

                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: ListTile(
                              leading: Icon(Icons.calendar_month),
                              title: Row(
                                children: [
                                  HeadingTextWidget(title: 'From',textColor: AppColors.buttonColor,fontSize: 15,fontWeight: FontWeight.w600,),
                                  SizedBox(width: 10,),
                                  SubHeadingTextWidget(title: 'Feb 05, 11.00 AM',textColor: Colors.black,fontSize: 14,fontWeight: FontWeight.w600,),
                                ],
                              ),
                              subtitle: Row(
                                children: [
                                  HeadingTextWidget(title: 'To     ',textColor: AppColors.buttonColor,fontSize: 15,fontWeight: FontWeight.w600,),
                                  SizedBox(width: 10,),
                                  SubHeadingTextWidget(title: 'Feb 09, 11.00 AM',textColor: Colors.black,fontSize: 14,fontWeight: FontWeight.w600,),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                        height: 60,
                        width: 600,
                        decoration: BoxDecoration(
                          color:AppColors.buttonColor,
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          boxShadow: [
                            BoxShadow(color: Colors.black.withOpacity(.7))
                          ],
                        ),
                        child: Center(
                          child: HeadingTextWidget(
                            title: 'Search',
                            fontWeight: FontWeight.bold,
                            textColor: AppColors.whiteColor,
                          ),
                        )
                    ),
                    SizedBox(height: 60,),






                  ],
                ),
              ),

              Divider(),
              ResponsiveWidget.isLargeScreen(context) ?  appBarFooter() : appBarFooterSmall(context),
              SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      )
      ,
    );
  }
}


Widget _checkBox(bool val, ValueChanged<bool>? onChanged,BuildContext context){
  return Checkbox(
      shape: ContinuousRectangleBorder(
      borderRadius: BorderRadius.circular(8),
  side: BorderSide(
  color: Colors.grey.withOpacity(.1),width: .5
  )
  ),
  visualDensity: VisualDensity.compact,
  value: val, onChanged: (bool? value) {
  onChanged?.call(value!);


  });}