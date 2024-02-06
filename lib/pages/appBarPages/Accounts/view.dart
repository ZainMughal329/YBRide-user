
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yb_ride_user_web/components/reuseableButton.dart';
import 'package:yb_ride_user_web/components/textField.dart';
import 'package:yb_ride_user_web/helper/appColors.dart';
import 'package:yb_ride_user_web/pages/appBarPages/Accounts/controller.dart';
import 'package:yb_ride_user_web/pages/appBarPages/appBarFooter/appBatFooter.dart';

import '../../../components/drwer.dart';
import '../../../components/headingTextWidget.dart';
import '../../../helper/responsive.dart';
import '../Become_Driver/view.dart';
import '../FaqS/view.dart';
import '../Referrals/view.dart';
import '../Trips/view.dart';

class AccountPage extends StatelessWidget {
  const AccountPage({super.key});

  @override
  Widget build(BuildContext context) {
    final con = Get.put(AccountCon());
    final GlobalKey<ScaffoldState> _scaffoldKey =
    new GlobalKey<ScaffoldState>();
    return Scaffold(

      key: _scaffoldKey,
      drawer: BuildDrawer.buildDrawer(context),
      drawerScrimColor: Colors.white,
      drawerEnableOpenDragGesture: false,
      backgroundColor: Color.fromRGBO(255, 255, 255, 1),
      appBar:  AppBar(
        backgroundColor: Color.fromRGBO(255, 255, 255, 1),
        // scrolledUnderElevation: 1,
        leading: Container(),
        title: Padding(
          padding:  EdgeInsets.only(left: 20),
          child: HeadingTextWidget(title:'YBRide',fontWeight: FontWeight.bold,fontSize:30 ,),
        ),
        actions: ResponsiveWidget.isLargeScreen(context)
        ?  [
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
              },
              child: HeadingTextWidget(
                  title: 'Sign out',
                  textColor: AppColors.appBarTextColor,
                  fontSize: 14,
                  fontWeight: FontWeight.normal)),
          SizedBox(
            width: 30,
          ),
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
      body: ResponsiveWidget.isLargeScreen(context)? SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 70,
              ),
              Padding(
                  padding: EdgeInsets.only(right: 350),
                  child: HeadingTextWidget(title: 'Account',fontWeight: FontWeight.bold,fontSize: 30,)),
              SizedBox(height: 20,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 250),
                child: Row(
                  children: [
                    Expanded(child: ReuseableTextField(
                        contr: con.state.firstNameCon,
                        label: 'First Name',
                        textInputAction: TextInputAction.next,
                        keyboardType: TextInputType.emailAddress,
                        obsecure: false)),
                    Expanded(child: ReuseableTextField(
                        contr: con.state.lastNameCon,
                        label: 'Last Name',
                        textInputAction: TextInputAction.next,
                        keyboardType: TextInputType.emailAddress,
                        obsecure: false)),
                  ],
                ),
              ),
              SizedBox(height: 20,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 250),
                child: Row(
                  children: [
                    Expanded(child: ReuseableTextField(
                        contr: con.state.emailCon,
                        label: 'Email Address',
                        textInputAction: TextInputAction.next,
                        keyboardType: TextInputType.emailAddress,
                        obsecure: false)),
                    Expanded(child: ReuseableTextField(
                        contr: con.state.numberCon,
                        label: 'Phone Number',
                        textInputAction: TextInputAction.next,
                        keyboardType: TextInputType.emailAddress,
                        obsecure: false)),
                  ],
                ),
              ),
              SizedBox(height: 20,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 250),
                child: Row(
                  children: [
                    SizedBox(width: 22,),
                    Expanded(child:
                    Container(
                      height: 60,
                      width: 55,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        color: AppColors.buttonColor
                      ),
                      child: Center(
                        child: HeadingTextWidget(
                          title: 'Save Changes',
                          fontSize: 14,
                          textColor: AppColors.whiteColor,
                        ),
                      ),
                    )
                    ),
                    SizedBox(width: 150,),
                    Expanded(child: HeadingTextWidget(
                      title: 'Delete account',textColor: Colors.red,
                      fontWeight: FontWeight.w500,
                    ))
                  ]
                ),
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
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 20.0),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.0),
                  child: HeadingTextWidget(title: 'Account',fontWeight: FontWeight.bold,fontSize: 20,),
                ),
                SizedBox(height: 20,),
                ReuseableTextField(
                    contr: con.state.firstNameCon,
                    label: 'First Name',
                    textInputAction: TextInputAction.next,
                    keyboardType: TextInputType.emailAddress,
                    obsecure: false),
                ReuseableTextField(
                    contr: con.state.lastNameCon,
                    label: 'Last Name',
                    textInputAction: TextInputAction.next,
                    keyboardType: TextInputType.emailAddress,
                    obsecure: false),
                ReuseableTextField(
                    contr: con.state.emailCon,
                    label: 'Email Address',
                    textInputAction: TextInputAction.next,
                    keyboardType: TextInputType.emailAddress,
                    obsecure: false),
                ReuseableTextField(
                    contr: con.state.numberCon,
                    label: 'Phone Number',
                    textInputAction: TextInputAction.next,
                    keyboardType: TextInputType.emailAddress,
                    obsecure: false),
                SizedBox(height: 20,),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          height: 60,
                          width: 110,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(Radius.circular(10)),
                              color: AppColors.buttonColor
                          ),
                          child: Center(
                            child: HeadingTextWidget(
                              title: 'Save Changes',
                              fontSize: 12,
                              textColor: AppColors.whiteColor,
                            ),
                          ),
                        ),
                        HeadingTextWidget(
                          title: 'Delete account',textColor: Colors.red,
                          fontWeight: FontWeight.w500,
                        )
                      ]
                  ),
                ),
                SizedBox(height: 50,),
                Divider(),
                SizedBox(height: 20,),
                ResponsiveWidget.isLargeScreen(context) ? appBarFooter() : appBarFooterSmall(context),
                SizedBox(
                  height: 20,
                ),

              ],
            ),
          ),
        ),
      )
      ,
    );
  }
}
