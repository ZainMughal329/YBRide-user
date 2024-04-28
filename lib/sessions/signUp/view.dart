

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:lottie/lottie.dart';
import 'package:yb_ride_user_web/helper/show_progress_indicator.dart';
import 'package:yb_ride_user_web/model/userModel/user_model.dart';
import 'package:yb_ride_user_web/sessions/login/view.dart';
import 'package:yb_ride_user_web/sessions/signUp/controller.dart';

import '../../components/headingTextWidget.dart';
import '../../components/reusebale_textField.dart';
import '../../components/subHeadingText.dart';
import '../../helper/appColors.dart';

class SignUpPages extends StatelessWidget {
  const SignUpPages({super.key});

  @override
  Widget build(BuildContext context) {
    final con = Get.put(signUpCon());
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
                                  title: 'Welcome ',
                                  textColor: AppColors.blackColor,
                                ),
                              ),
                              SubHeadingTextWidget(
                                title: 'Sign Up to YBRide to continue to YBRide',
                                textColor: Colors.black,fontSize: 10,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 16.0),
                    ReuseableTextField(
                      contr: con.state.userNameCon,
                      textInputAction: TextInputAction.next,
                      keyboardType: TextInputType.text,
                      obsecure: false,
                      label: 'User Name',
                      inputFormatters:[FilteringTextInputFormatter.allow(RegExp(r'[a-zA-Z]'))],
                    ),
                    SizedBox(height: 16.0),
                    ReuseableTextField(
                      contr: con.state.emailCon,
                      label: 'Email Address',
                      obsecure: false,
                      keyboardType: TextInputType.emailAddress,
                      useEmailValidation: true,
                      textInputAction: TextInputAction.next,

                    ),
                    SizedBox(height: 16.0),
                    Obx(() => ReuseableTextField(
                      obsecure: con.state.isObscure.value,
                      keyboardType: TextInputType.text,
                      contr: con.state.passwordCon,
                      textInputAction: TextInputAction.next,
                      label: 'Password',
                    ),),
                    Obx(() => Align(
                      alignment: Alignment.bottomRight,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                         Text("Hide password "),
                          SizedBox(width: 3,),
                          Checkbox(value: con.state.isObscure.value, onChanged: (bool? value) {
                            con.state.isObscure.value = value!;
                          },),
                        ],
                      ),
                    ),),
                    SizedBox(height: 16.0),
                    Obx(() => con.state.loading.value == false?
                    InkWell(
                      onTap: (){
                        final user =UserModel(
                          userName: con.state.userNameCon.text.trim().toString(),
                          email:con.state.emailCon.text.trim().toString() ,
                        );
                        con.storeUser(user, context, con.state.emailCon.text.trim().toString(), con.state.passwordCon.text.trim().toString(),con.state.userNameCon.text.trim().toString());

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
                    ) :Lottie.asset('assets/lottie/loading2.json',height: 100,width: 100)),
                    SizedBox(height: 16.0),
                    Align(
                      alignment: Alignment.topLeft,
                      child: Row(
                        children: [
                          SubHeadingTextWidget(title: "Already have an account?",fontSize: 14,),
                          SizedBox(width: 5,),
                          InkWell(
                              onTap: (){
                                showProgressIndicator(context);
                                Future.delayed(Duration(seconds: 2),(){
                                  Navigator.pop(context);
                                  Get.to(()=>LoginPages());
                                });
                                // Get.to(()=>LoginPages(),
                                //     transition: Transition.rightToLeft,duration: Duration(milliseconds: 600));
                              },
                              child: HeadingTextWidget(title: 'Log in',textColor: AppColors.buttonColor,fontSize: 16,))
                        ],
                      ),
                    ),
                    SizedBox(height: 16.0),
                    // Row(
                    //   children: [
                    //     Expanded(child: Divider()),
                    //     SubHeadingTextWidget(title: ' OR '),
                    //     Expanded(child: Divider()),
                    //   ],
                    // ),
                    // SizedBox(height: 16.0),
                    // InkWell(
                    //   onTap: (){
                    //     con.handleGoogleSignIn(context);
                    //     // _handleSignIn();
                    //   },
                    //   child: Container(
                    //     width: 400,
                    //     height: 50,
                    //     decoration: BoxDecoration(
                    //         border: Border.all(color: Colors.black54)
                    //     ),
                    //     child: Center(
                    //       child: Row(
                    //         mainAxisAlignment: MainAxisAlignment.start,
                    //         crossAxisAlignment: CrossAxisAlignment.start,
                    //         children: [
                    //           SizedBox(width: 10,),
                    //           Container(
                    //             height:25,
                    //             width: 30,
                    //             decoration: BoxDecoration(
                    //               image: DecorationImage(image: AssetImage('assets/images/google.webp')),
                    //             ),
                    //           ),
                    //           SizedBox(width: 5,),
                    //           SubHeadingTextWidget(title: 'Continue with Google',fontSize: 16,)
                    //         ],
                    //       ),
                    //     ),
                    //   ),
                    // )
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