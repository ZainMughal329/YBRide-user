import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:yb_ride_user_web/components/snackbar_widget.dart';
import 'package:yb_ride_user_web/components/subHeadingText.dart';
import 'package:yb_ride_user_web/pages/appBarPages/Become_Driver/view.dart';
import 'package:yb_ride_user_web/pages/appBarPages/FaqS/view.dart';
import 'package:yb_ride_user_web/pages/appBarPages/Trips/allTripPage.dart';
import 'package:yb_ride_user_web/sessions/signUp/view.dart';

import '../helper/session_Controller.dart';
import '../helper/show_progress_indicator.dart';
import '../pages/appBarPages/Accounts/view.dart';
import '../pages/appBarPages/Referrals/view.dart';

class BuildDrawer {
  static Drawer buildDrawer(BuildContext context) {
    // var con = Get.put(HomeController());
    return Drawer(
      width: 500,
      backgroundColor: Color.fromRGBO(255, 255, 255, 1),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.0),
        child: ListView(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Image(
                    image: AssetImage('assets/images/circleLogo.png'),
                    height: 100,
                    width: 100,
                  ),
                ),
                InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Icon(Icons.cancel_outlined),
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            InkWell(
              onTap: () {

                Navigator.pop(context);
                showProgressIndicator(context);
                Future.delayed(Duration(seconds: 2),(){
                  Navigator.pop(context);
                  Get.offAll(()=>BecomeDriverPage());
                });
                // Get.to(()=>BecomeDriverPage());

              },
              child: Text(
                'Become a Driver Partner',
                style: GoogleFonts.montserrat(
                  color: Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            InkWell(
              onTap: () {
                Navigator.pop(context);
                showProgressIndicator(context);
                Future.delayed(Duration(seconds: 2),(){
                  Navigator.pop(context);
                  Get.offAll(()=>FaqPage());
                });
                // Get.to(()=>FaqPage());
              },
              child: Text(
                'FAQ',
                style: GoogleFonts.montserrat(
                  color: Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            // InkWell(
            //   onTap: () {
            //     Navigator.pop(context);
            //     Get.to(()=>AccountPage());
            //
            //   },
            //   child: Text(
            //     'Settings',
            //     style: GoogleFonts.montserrat(
            //       color: Colors.black,
            //       fontSize: 16,
            //       fontWeight: FontWeight.w600,
            //     ),
            //   ),
            // ),
            // SizedBox(
            //   height: 10,
            // ),
            // InkWell(
            //   onTap: () {
            //     Navigator.pop(context);
            //     Get.to(()=>ReferralPage());
            //   },
            //   child: Text(
            //     'Referrals',
            //     style: GoogleFonts.montserrat(
            //       color: Colors.black,
            //       fontSize: 16,
            //       fontWeight: FontWeight.w600,
            //     ),
            //   ),
            // ),
            // SizedBox(
            //   height: 10,
            // ),
            InkWell(
              onTap: () {
                Navigator.pop(context);
               SessionController().userId == null ? Snackbar.showSnackBar("YB-Ride", "Login to continue", Icons.error_outline) :
               showProgressIndicator(context);
                Future.delayed(Duration(seconds: 2),(){
                  Navigator.pop(context);
                  Get.offAll(()=>TripsPages());
                });
               // Get.to(TripsPages());
              },
              child: Text(
                'My Trips',
                style: GoogleFonts.montserrat(
                  color: Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            InkWell(
              onTap: () {
                Navigator.pop(context);
                SessionController().userId == null ? Snackbar.showSnackBar("YB-Ride", "Login to continue", Icons.error_outline) :
                showProgressIndicator(context);
                Future.delayed(Duration(seconds: 2),(){
                  Navigator.pop(context);
                  Get.offAll(()=>AccountPage());
                });
                // Get.to(()=>AccountPage());
              },
              child: Text(
                'My Account',
                style: GoogleFonts.montserrat(
                  color: Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            InkWell(
              onTap: () {
                Navigator.pop(context);
                showProgressIndicator(context);
                Future.delayed(Duration(seconds: 2),(){
                  Navigator.pop(context);
                  Get.offAll(()=>FaqPage());
                });
                // Get.to(()=>FaqPage());
              },
              child: Text(
                'Get Help',
                style: GoogleFonts.montserrat(
                  color: Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            InkWell(
              onTap: () async {
                showProgressIndicator(context);
                Future.delayed(Duration(seconds: 3) , () async {
                  await FirebaseAuth.instance.signOut().then((value) {

                    SessionController().userId = '';
                    Navigator.pop(context);
                    Get.offAll(SignUpPages());
                  });
                });

              },
              child: Text(
                'SignOut',
                style: GoogleFonts.montserrat(
                  color: Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
