import 'dart:convert';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:intl/intl.dart';
import 'package:lottie/lottie.dart';
import 'package:yb_ride_user_web/homePage/view.dart';
import 'package:yb_ride_user_web/pages/appBarPages/Accounts/view.dart';
import 'package:yb_ride_user_web/pages/appBarPages/Become_Driver/view.dart';
import 'package:yb_ride_user_web/pages/appBarPages/FaqS/view.dart';
import 'package:yb_ride_user_web/pages/appBarPages/Trips/allTripPage.dart';
import 'package:yb_ride_user_web/sessions/signUp/view.dart';

import '../../components/drwer.dart';
import '../../components/headingTextWidget.dart';
import '../../components/subHeadingText.dart';
import '../../helper/api.dart';
import '../../helper/appColors.dart';
import '../../helper/responsive.dart';
import '../../helper/session_Controller.dart';
import '../../helper/show_progress_indicator.dart';
import 'package:flutter_quill/flutter_quill.dart';


class PrivacyPolicy extends StatelessWidget {
  PrivacyPolicy({super.key});

  QuillController controller = QuillController.basic(

  );
  @override
  Widget build(BuildContext context) {

    final GlobalKey<ScaffoldState> _scaffoldKey =
    new GlobalKey<ScaffoldState>();
    return Scaffold(
      key: _scaffoldKey,
      drawer: BuildDrawer.buildDrawer(context),
      drawerScrimColor: Colors.white,
      drawerEnableOpenDragGesture: false,
      backgroundColor: Color.fromRGBO(255, 255, 255, 1),
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(255, 255, 255, 1),
        // scrolledUnderElevation: 1,
        leading: Container(),
        title: Padding(
          padding: EdgeInsets.only(left: 20),
          child: HeadingTextWidget(
            title: 'YBRide',
            fontWeight: FontWeight.bold,
            fontSize: 30,
          ),
        ),
        actions: ResponsiveWidget.isLargeScreen(context)
            ? [
          InkWell(
            onTap: () {
              Get.to(() => BecomeDriverPage());
              // final contt = Get.put(PaymentController());
              // contt.sendPaymentRequest();
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
              child: HeadingTextWidget(
                  title: 'Sign out',
                  textColor: AppColors.appBarTextColor,
                  fontSize: 14,
                  fontWeight: FontWeight.normal)),
          SizedBox(
            width: 30,
          ),
        ]
            : [
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
      body: StreamBuilder<QuerySnapshot>(
        stream: APis.db.collection('privacyPolicy').snapshots(),
        builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (!snapshot.hasData) {
            return Center(
              child: Container(
                height: 100,
                width: 100,
                child: Lottie.asset('assets/lottie/loading2.json'),
              ),
            );
          }
          var data = snapshot.data!.docs.first;
          var fromDateString =
          data['dateTime']
          as String;
          // log('terms and services:$fromDateString');
          var fromDateMillis =
          int.parse(fromDateString);
          var fromDate = DateTime
              .fromMillisecondsSinceEpoch(
              fromDateMillis);
          var fromFormattedDate =
          DateFormat.yMd().format(
              fromDate.toLocal());
          controller.document = Document.fromJson(jsonDecode(data['privacyPolicy']));
          // controller.document = Document.fromJson(jsonDecode(data['termsAndConditions']));
          return Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Align(
                  alignment: Alignment.topLeft,
                  child: InkWell(
                      onTap: (){
                        showProgressIndicator(context);
                        Future.delayed(Duration(seconds: 3),(){
                          Navigator.pop(context);
                          Get.to(()=>HomePage());
                        });

                      },
                      child: Icon(Icons.cancel_outlined,color: Colors.black,size: 30,)),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 10.0 , left: 10),
                  child: SubHeadingTextWidget(title: 'Updated on : ' + fromFormattedDate , textColor: Colors.black,fontWeight: FontWeight.normal,fontSize: 13,),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10.0,vertical: 10),
                  child: QuillEditor.basic(

                    configurations: QuillEditorConfigurations(

                      controller: controller,

                      readOnly: true,
                      sharedConfigurations: const QuillSharedConfigurations(
                        locale: Locale('en'),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
