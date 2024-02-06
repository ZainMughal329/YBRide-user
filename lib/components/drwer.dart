import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:yb_ride_user_web/components/subHeadingText.dart';
import 'package:yb_ride_user_web/pages/appBarPages/Trips/view.dart';

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
                Image(
                  image: AssetImage('assets/images/YBRIDE text.jpg'),
                  height: 60,
                  width: 60,
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
                Get.to(()=>AccountPage());
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
            InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: Text(
                'Settings',
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
                Get.to(()=>ReferralPage());
              },
              child: Text(
                'Referrals',
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
                Get.to(TripsPages());
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
              onTap: () {
                Navigator.pop(context);
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
