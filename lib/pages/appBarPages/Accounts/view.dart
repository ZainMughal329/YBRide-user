
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yb_ride_user_web/components/reuseableButton.dart';
import 'package:yb_ride_user_web/components/textField.dart';
import 'package:yb_ride_user_web/helper/appColors.dart';
import 'package:yb_ride_user_web/pages/appBarPages/Accounts/controller.dart';
import 'package:yb_ride_user_web/pages/appBarPages/appBarFooter/appBatFooter.dart';

import '../../../components/headingTextWidget.dart';

class AccountPage extends StatelessWidget {
  const AccountPage({super.key});

  @override
  Widget build(BuildContext context) {
    final con = Get.put(AccountCon());
    return Scaffold(
      appBar:  AppBar(
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
          GestureDetector(
              child: HeadingTextWidget(title: 'Sign out',textColor: AppColors.appBarTextColor,fontSize: 14,fontWeight: FontWeight.normal)),
          SizedBox(width: 30,),
        ],
      ),
      body: SingleChildScrollView(
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
      ),
    );
  }
}
