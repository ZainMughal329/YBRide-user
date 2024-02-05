



import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:yb_ride_user_web/components/subHeadingText.dart';
import 'package:yb_ride_user_web/sessions/login/controller.dart';
import 'package:yb_ride_user_web/sessions/signUp/view.dart';
import '../../components/headingTextWidget.dart';
import '../../helper/appColors.dart';

class LoginPages extends StatelessWidget {
  const LoginPages({super.key});


  @override
  Widget build(BuildContext context) {
    final con =Get.put(loginCon());
    return Scaffold(
      backgroundColor: Colors.grey.withOpacity(.3),
      body: Center(
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
                              title: 'Welcome back',
                              textColor: AppColors.blackColor,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 16.0),
                TextFormField(
                  style: GoogleFonts.openSans(
                    fontSize: 15,
                  ),
                  controller: con.state.emailCon,
                  textInputAction: TextInputAction.next,
                  decoration: InputDecoration(
                    labelText: 'Email Address',
                    border: OutlineInputBorder(),
                    enabled: true,
                    enabledBorder: OutlineInputBorder(
                      borderSide:
                      BorderSide(color: AppColors.nonActiveTextFieldColor),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide:
                      BorderSide(color: AppColors.activeTextFieldColor,width: 1.5),
                    ),
                    labelStyle: GoogleFonts.openSans(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                SizedBox(height: 16.0),
                TextFormField(
                  style: GoogleFonts.openSans(
                    fontSize: 15,
                  ),
                  controller: con.state.passwordCon,
                  textInputAction: TextInputAction.next,
                  decoration: InputDecoration(
                    labelText: 'Password',
                    border: OutlineInputBorder(),
                    enabled: true,
                    enabledBorder: OutlineInputBorder(
                      borderSide:
                      BorderSide(color: AppColors.nonActiveTextFieldColor),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide:
                      BorderSide(color: AppColors.activeTextFieldColor,width: 1.5),
                    ),
                    labelStyle: GoogleFonts.openSans(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                SizedBox(height: 16.0),
                Align(
                    alignment: Alignment.topLeft,
                    child: HeadingTextWidget(title: 'Forgot password?',textColor: AppColors.buttonColor,fontWeight: FontWeight.bold,fontSize: 14,)),

                SizedBox(height: 24.0),
                InkWell(
                  onTap: (){
                    con.LogIn(context, con.state.emailCon.text.trim().toString(), con.state.passwordCon.text.trim().toString());

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
                ),
                SizedBox(height: 16.0),
                Align(
                  alignment: Alignment.topLeft,
                  child: Row(
                    children: [
                      SubHeadingTextWidget(title: "Don't have a account?",fontSize: 16,),
                      SizedBox(width: 5,),
                      InkWell(
                          onTap: (){
                            Get.to(()=>SignUpPages());
                          },
                          child: HeadingTextWidget(title: 'SignUp',textColor: AppColors.buttonColor,fontSize: 16,))
                    ],
                  ),
                ),
                SizedBox(height: 16.0),
                Row(
                  children: [
                    Expanded(child: Divider()),
                    SubHeadingTextWidget(title: 'OR'),
                    Expanded(child: Divider()),
                  ],
                ),
                SizedBox(height: 16.0),
                Container(
                  width: 400,
                  height: 50,
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.black54)
                  ),
                  child: Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(width: 10,),
                        Container(
                          height:25,
                          width: 30,
                          decoration: BoxDecoration(
                            image: DecorationImage(image: AssetImage('assets/images/google.webp')),
                          ),
                        ),
                        SizedBox(width: 5,),
                        SubHeadingTextWidget(title: 'Continue with Google',fontSize: 16,)
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
