

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:yb_ride_user_web/components/textField.dart';
import 'package:yb_ride_user_web/homePage/controller.dart';
import 'package:yb_ride_user_web/sessions/forgot/controller.dart';
import 'package:yb_ride_user_web/sessions/login/view.dart';

import '../../components/headingTextWidget.dart';
import '../../components/subHeadingText.dart';
import '../../helper/appColors.dart';

class ForgotPages extends StatelessWidget {
  const ForgotPages({super.key});

  @override
  Widget build(BuildContext context) {
    final con = Get.put(forgotCon());
    return Scaffold(
      backgroundColor: Colors.grey.withOpacity(.3),
      body: Stack(
        children: [
          Container(
              height: double.infinity,
              width: double.infinity,
              child: Image.asset('assets/images/homePage.webp',fit: BoxFit.cover,)),
          Center(
            child: SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.all(48.0),
                width: 400,
                decoration: BoxDecoration(
                  // border: Border.all(color: Colors.grey),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(.3),
                      spreadRadius: 1,
                      blurRadius: 5,
                      offset: Offset(1, -3),
                    ),
                  ],
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SingleChildScrollView(
                      child: Container(
                        child: Padding(
                          padding: EdgeInsets.symmetric(vertical: 10, horizontal: 50),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    height: 100,
                                    width: 100,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(50),
                                      image: DecorationImage(
                                          image: AssetImage('assets/images/yBRideLogo.jpg'),
                                          fit: BoxFit.fill),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 30),
                              Padding(
                                padding: EdgeInsets.only(bottom: 17),
                                child: HeadingTextWidget(
                                  title: 'Forgot Your Password?',
                                  textColor: AppColors.blackColor,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 16.0),
                    SubHeadingTextWidget(title: "Enter your email address and we will send you instructions to reset your password."),
                    SizedBox(height: 16.0),
                    SizedBox(height: 16.0),
                    ReuseableTextField(
                      obsecure: false,
                      keyboardType: TextInputType.emailAddress,
                      useEmailValidation: true,
                      label:'Email Address' ,
                      contr: con.state.email,
                      textInputAction: TextInputAction.next,
                    ),
                    SizedBox(height: 16.0),
                    Align(
                        alignment: Alignment.topLeft,
                        child: HeadingTextWidget(title: 'Forgot password?',textColor: AppColors.buttonColor,fontWeight: FontWeight.bold,fontSize: 14,)),

                    SizedBox(height: 24.0),
                    Obx(() => con.state.loading == false?
                    InkWell(
                      onTap: (){
                        con.forgotPassword(context, con.state.email.text.trim());
                      },
                      child: Container(
                        width: 400,
                        height: 50,
                        decoration: BoxDecoration(
                            color: AppColors.buttonColor,
                            boxShadow: [
                              BoxShadow(color: Colors.grey.withOpacity(.1))
                            ]
                        ),
                        child: Center(
                          child: HeadingTextWidget(
                            title: 'Continue',textColor:AppColors.whiteColor,fontSize: 14,fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ):Lottie.asset('assets/lottie/loading2.json',height: 100,width: 100)),
                    SizedBox(height: 16.0),
                    Align(
                      alignment: Alignment.center,
                      child: Row(
                        children: [
                          InkWell(
                              onTap: (){
                                Get.to(()=>LoginPages());
                              },
                              child: HeadingTextWidget(title: 'Back to YBRide',textColor: AppColors.buttonColor,fontSize: 16,))
                        ],
                      ),
                    ),
                    SizedBox(height: 16.0),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
