import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:yb_ride_user_web/components/headingTextWidget.dart';
import 'package:yb_ride_user_web/components/snackbar_widget.dart';
import 'package:yb_ride_user_web/components/subHeadingText.dart';
import 'package:yb_ride_user_web/helper/responsive.dart';
import 'package:yb_ride_user_web/helper/session_Controller.dart';
import 'package:yb_ride_user_web/helper/show_progress_indicator.dart';
import 'package:yb_ride_user_web/homePage/privacyPolicy/view.dart';
import 'package:yb_ride_user_web/homePage/view.dart';
import 'package:yb_ride_user_web/main.dart';
import 'package:yb_ride_user_web/pages/appBarPages/Become_Driver/view.dart';
import 'package:yb_ride_user_web/pages/appBarPages/FaqS/view.dart';
import 'package:yb_ride_user_web/pages/appBarPages/Referrals/view.dart';
import 'package:yb_ride_user_web/pages/appBarPages/Trips/allTripPage.dart';
import '../../helper/api.dart';
import '../../helper/appColors.dart';
import '../../homePage/termsAndServices/view.dart';
import 'contactUsAlertBox.dart';
import 'controller.dart';

Widget Footer(BuildContext context) {
  final con = Get.put(FooterCon());
  return Stack(children: [
    Container(
      height: 100,
      color: Colors.white, // Top color
    ),
    ClipPath(
      clipper: CustomCurveClipper(),
      child: Container(
        height: 270,
        color: AppColors.buttonColor,
        child: Stack(
          children: [
            Column(
              children: [
                Spacer(),
                Padding(
                  padding: const EdgeInsets.only(bottom: 30),
                  child: Align(
                    alignment: Alignment.center,
                    child: HeadingTextWidget(
                      title: "There's a better way to rent",
                      textColor: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize:
                          ResponsiveWidget.isLargeScreen(context) ? 30 : 22,
                    ),
                  ),
                ),
                // ResponsiveWidget.isLargeScreen(context)
                //     ? Container(
                //   height: 50,
                //   width: 100,
                //   decoration: BoxDecoration(
                //       borderRadius: BorderRadius.circular(25),
                //       color: Colors.deepPurple),
                //   child: Center(
                //     child: HeadingTextWidget(
                //       title: 'Download',
                //       textColor: AppColors.whiteColor,
                //       fontSize: 14,
                //     ),
                //   ),
                // )
                //     : Container(
                //         height: 50,
                //         width: 100,
                //         decoration: BoxDecoration(
                //             borderRadius: BorderRadius.circular(25),
                //             color: Colors.deepPurple),
                //         child: Center(
                //           child: HeadingTextWidget(
                //             title: 'Download',
                //             textColor: AppColors.whiteColor,
                //             fontSize: 14,
                //           ),
                //         ),
                //       ),
                Spacer(),
              ],
            ),
          ],
        ),
      ),
    ),
    SizedBox(
      height: 100,
    ),
    Padding(
      padding: EdgeInsets.only(top: 300),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ResponsiveWidget.isLargeScreen(context)
            ? Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 30),
                  Expanded(
                      child: Image(
                    image: AssetImage('assets/images/YBRIDE text.jpg'),
                    height: 60,
                    width: 60,
                  )),
                  SizedBox(
                    width: 50,
                  ),
                  Expanded(
                      child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      HeadingTextWidget(title: 'Get Started'),
                      SizedBox(
                        height: 20,
                      ),
                      InkWell(
                        hoverColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          splashColor: Colors.transparent,
                          onTap: () {
                            showProgressIndicator(context);
                            Future.delayed(Duration(seconds: 2),(){
                              Navigator.pop(context);
                              Get.to(()=>HomePage());
                            });
                            // Get.to(() => HomePage());
                          },
                          child: SubHeadingTextWidget(
                            title: 'Book a car',
                            textColor: Colors.black,
                          )),
                      SizedBox(
                        height: 20,
                      ),
                      InkWell(
                          hoverColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          splashColor: Colors.transparent,
                          onTap: () {
                            showProgressIndicator(context);
                            Future.delayed(Duration(seconds: 2),(){
                              Navigator.pop(context);
                              Get.to(()=>BecomeDriverPage());
                            });
                            // Get.to(() => BecomeDriverPage());
                          },

                          child: SubHeadingTextWidget(
                            title: 'Drivers Partners',
                            textColor: Colors.black,
                          )),
                      SizedBox(
                        height: 20,
                      ),
                      InkWell(
                          hoverColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          splashColor: Colors.transparent,
                          onTap: () {
                            showProgressIndicator(context);
                            Future.delayed(Duration(seconds: 2),(){
                              Navigator.pop(context);
                              Get.to(()=>PrivacyPolicy());
                            });
                            // Get.to(() => BecomeDriverPage());
                          },

                          child: SubHeadingTextWidget(
                            title: 'Privacy Policies',
                            textColor: Colors.black,
                          )),
                      SizedBox(
                        height: 20,
                      ),
                      InkWell(
                          hoverColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          splashColor: Colors.transparent,
                          onTap: () {
                            showProgressIndicator(context);
                            Future.delayed(Duration(seconds: 2),(){
                              Navigator.pop(context);
                              // Get.to(()=>BecomeDriverPage());
                              Get.to(()=>TermsAndServices());
                            });
                            // Get.to(() => BecomeDriverPage());
                          },

                          child: SubHeadingTextWidget(
                            title: 'Terms and Conditions',
                            textColor: Colors.black,
                          ))
                    ],
                  )),
                  SizedBox(
                    width: 50,
                  ),
                  Expanded(
                      child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      HeadingTextWidget(title: 'Resources'),
                      SizedBox(
                        height: 20,
                      ),
                      InkWell(
                          hoverColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          splashColor: Colors.transparent,
                          onTap: userId == null ? (){
                            Snackbar.showSnackBar('YB-Rude',
                                "Login to Your Account", Icons.error_outline);
                          } : (){
                            showProgressIndicator(context);
                            Future.delayed(Duration(seconds: 2),(){
                              Navigator.pop(context);
                              Get.to(()=>TripsPages());
                            });
                          },
                          child: SubHeadingTextWidget(
                              title: 'My Trip', textColor: Colors.black)),
                      SizedBox(
                        height: 20,
                      ),
                      InkWell(
                          hoverColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          splashColor: Colors.transparent,
                          onTap: () {
                            showProgressIndicator(context);
                            Future.delayed(Duration(seconds: 2),(){
                              Navigator.pop(context);
                              Get.to(()=>FaqPage());
                            });
                            // Get.to(() => FaqPage());
                          },
                          child: SubHeadingTextWidget(
                              title: 'Help', textColor: Colors.black)),
                      SizedBox(
                        height: 20,
                      ),
                      InkWell(
                          hoverColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          splashColor: Colors.transparent,
                          onTap: () {
                            ContactUsAlertDialog(context);
                          },
                          child: SubHeadingTextWidget(
                              title: 'Contact us', textColor: Colors.black)),
                      SizedBox(
                        height: 20,
                      ),
                    ],
                  )),
                  SizedBox(
                    width: 50,
                  ),
                  Expanded(
                      child: StreamBuilder<QuerySnapshot>(
                    stream: APis.db.collection('constants').snapshots(),
                    builder: (BuildContext context,
                        AsyncSnapshot<QuerySnapshot> snapshot) {
                      if (snapshot.hasData && snapshot.data!.docs.isNotEmpty) {
                        var data = snapshot.data!.docs.first.data();
                        var ybEmail = (data as Map<String, dynamic>)?['ybEmail']
                                as String? ??
                            '';
                        var ybPhone = (data as Map<String, dynamic>)?['ybPhone']
                                as String? ??
                            '';
                        var ybTwitter = (data as Map<String, dynamic>)?['twitterLink']
                        as String? ??
                            '';
                        var ybFacebook = (data as Map<String, dynamic>)?['fbLink']
                        as String? ??
                            '';
                        var ybInstragram = (data as Map<String, dynamic>)?['instaLink']
                        as String? ??
                            '';

                        return Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            HeadingTextWidget(title: 'Connect'),
                            SizedBox(
                              height: 20,
                            ),
                            Row(
                              children: [
                                Icon(FontAwesomeIcons.message),
                                SizedBox(width: 8,),
                                SubHeadingTextWidget(
                                    title: ybEmail.toString(),
                                    textColor: Colors.black),
                              ],
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Row(
                              children: [
                                Icon(FontAwesomeIcons.phone),
                                SizedBox(width: 8,),
                                SubHeadingTextWidget(
                                    title: ybPhone.toString(),
                                    textColor: Colors.black),
                              ],
                            ),

                            SizedBox(
                              height: 20,
                            ),
                            Row(
                              children: [
                                Icon(FontAwesomeIcons.facebook),
                                SizedBox(width: 8,),
                                SubHeadingTextWidget(
                                    title: ybFacebook.toString(),
                                    textColor: Colors.black),
                              ],
                            ),

                            SizedBox(
                              height: 20,
                            ),
                            Row(

                              children: [
                                Icon(FontAwesomeIcons.twitter),
                                SizedBox(width: 8,),
                                SubHeadingTextWidget(
                                    title: ybTwitter.toString(),
                                    textColor: Colors.black),
                              ],
                            ),

                            SizedBox(
                              height: 20,
                            ),
                            Row(
                              children: [
                                Icon(FontAwesomeIcons.instagram),
                                SizedBox(width: 8,),
                                SubHeadingTextWidget(
                                    title: ybInstragram.toString(),
                                    textColor: Colors.black),
                              ],
                            ),
                          ],
                        );
                      } else if (snapshot.hasError) {
                        return Text('Error: ${snapshot.error}');
                      } else {
                        return Center(child: CircularProgressIndicator());
                      }
                    },
                  )),
                ],
              )
            : Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 30),
                  Image(
                    image: AssetImage('assets/images/YBRIDE text.jpg'),
                    height: 60,
                    width: 60,
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  HeadingTextWidget(title: 'Get Started'),
                  SizedBox(
                    height: 20,
                  ),
                  InkWell(
                    hoverColor: Colors.transparent,
                    focusColor: Colors.transparent,
                    splashColor: Colors.transparent,
                    onTap: (){
                      showProgressIndicator(context);
                      Future.delayed(Duration(seconds: 2),(){
                        Navigator.pop(context);
                        Get.to(()=>HomePage());
                      });
                      // Get.to(()=>HomePage());
                    },
                    child: SubHeadingTextWidget(
                      title: 'Book a car',
                      textColor: Colors.black,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  InkWell(
                    hoverColor: Colors.transparent,
                    focusColor: Colors.transparent,
                    splashColor: Colors.transparent,
                    onTap: (){
                      showProgressIndicator(context);
                      Future.delayed(Duration(seconds: 2),(){
                        Navigator.pop(context);
                        Get.to(()=>BecomeDriverPage());
                      });
                      // Get.to(()=>BecomeDriverPage());
                    },
                    child: SubHeadingTextWidget(
                      title: 'Drivers Partners',
                      textColor: Colors.black,
                    ),
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  HeadingTextWidget(title: 'Resources'),
                  SizedBox(
                    height: 20,
                  ),
                  InkWell(
                    hoverColor: Colors.transparent,
                    focusColor: Colors.transparent,
                    splashColor: Colors.transparent,
                    onTap: userId == null ? (){
                      Snackbar.showSnackBar('YB-Rude',
                          "Login to Your Account", Icons.error_outline);
                    } : (){
                      showProgressIndicator(context);
                      Future.delayed(Duration(seconds: 2),(){
                        Navigator.pop(context);
                        Get.to(()=>TripsPages());
                      });
                    },
                    // onTap: (){
                    //   SessionController().userId == null ? Snackbar.showSnackBar("YB-Ride", "Login to your Account", Icons.error_outline) :
                    //   showProgressIndicator(context);
                    //   Future.delayed(Duration(seconds: 2),(){
                    //     Navigator.pop(context);
                    //     Get.to(()=>TripsPages());
                    //   });
                    //   // Get.to(()=>TripsPages());
                    // },
                    child: SubHeadingTextWidget(
                        title: 'My Trip', textColor: Colors.black),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  InkWell(
                      hoverColor: Colors.transparent,
                      focusColor: Colors.transparent,
                      splashColor: Colors.transparent,
                      onTap: (){
                        showProgressIndicator(context);
                        Future.delayed(Duration(seconds: 2),(){
                          Navigator.pop(context);
                          Get.to(()=>FaqPage());
                        });
                        // Get.to(()=>FaqPage());
                      },
                      child: SubHeadingTextWidget(title: 'Help', textColor: Colors.black)),
                  SizedBox(
                    height: 20,
                  ),
                  // InkWell(
                  //   onTap: (){
                  //     Get.to(()=>ReferralPage());
                  //   },
                  //   child: SubHeadingTextWidget(
                  //       title: 'Referrals', textColor: Colors.black),
                  // ),
                  SizedBox(
                    height: 20,
                  ),
                  InkWell(
                    hoverColor: Colors.transparent,
                    focusColor: Colors.transparent,
                    splashColor: Colors.transparent,
                    onTap: (){
                      ContactUsAlertDialog(context);
                    },
                    child: SubHeadingTextWidget(
                        title: 'Contact us', textColor: Colors.black),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  SubHeadingTextWidget(
                      title: 'Do not sell my personal information',
                      textColor: Colors.black),
                  SizedBox(
                    height: 50,
                  ),
                  HeadingTextWidget(title: 'Blog'),
                  SizedBox(
                    height: 20,
                  ),
                  InkWell(
                    hoverColor: Colors.transparent,
                    focusColor: Colors.transparent,
                    splashColor: Colors.transparent,
                    onTap: (){
                      Snackbar.showSnackBar("YB-Ride", "Coming Soon", Icons.error_outline);
                    },
                    child: SubHeadingTextWidget(
                        title: 'Careers', textColor: Colors.black),
                  ),
                  // SizedBox(
                  //   height: 20,
                  // ),
                  // InkWell(
                  //   onTap: (){
                  //     Get.to(()=>);
                  //   },
                  //   child: SubHeadingTextWidget(
                  //       title: 'Team and conditions', textColor: Colors.black),
                  // ),
                  // SizedBox(
                  //   height: 20,
                  // ),
                  // SubHeadingTextWidget(
                  //     title: 'Privacy Policy', textColor: Colors.black),
                  SizedBox(
                    height: 20,
                  ),
                  InkWell(
                    hoverColor: Colors.transparent,
                    focusColor: Colors.transparent,
                    splashColor: Colors.transparent,
                    onTap: (){
                      Snackbar.showSnackBar("YB-Ride", "Coming Soon", Icons.error_outline);
                    },
                    child: SubHeadingTextWidget(
                        title: 'Accessibility', textColor: Colors.black),
                  ),
                ],
              ),
      ),
    )
  ]);
}

class CustomCurveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.lineTo(
        0, size.height - 100); // Move to the bottom-left, increased the height
    path.quadraticBezierTo(size.width / 2, size.height + 80, size.width,
        size.height - 100); // Adjust the control points
    path.lineTo(size.width, 0); // Move to the top-right
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
