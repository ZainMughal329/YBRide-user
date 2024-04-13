import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:yb_ride_user_web/helper/AppConstants.dart';
import 'package:yb_ride_user_web/pages/appBarPages/Become_Driver/view.dart';

import '../../../components/headingTextWidget.dart';
import '../../../components/subHeadingText.dart';
import '../../../helper/api.dart';

Widget appBarFooter(){

  return
    Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(width:30),
          Expanded(child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image(image: AssetImage('assets/images/YBRIDE text.jpg'),height: 60,width: 60,),
              SizedBox(height: 10,),
              text('© Copyright 2024 YBRide Systems Inc.'),
              SizedBox(height: 10,),
              text('All rights reserved.'),
            ],
          )),
          SizedBox(width: 50,),
          Expanded(child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              text('Resources'),
              SizedBox(height: 20,),
              InkWell(
                  onTap: (){
                    Get.to(()=>BecomeDriverPage());
                  },
                  child: text('Become a driver partner')),
              SizedBox(height: 20,),
              InkWell(
                onTap: (){
                  Get.snackbar('YB-Ride', 'Coming Soon');
                },
                  child: text('Partner with Us')),
              SizedBox(height: 20,),
            ],)),
          SizedBox(width: 50,),
          Expanded(child: StreamBuilder<QuerySnapshot>(
            stream: APis.db.collection('constants').snapshots(),
            builder: (BuildContext context,
                AsyncSnapshot<QuerySnapshot> snapshot) {
              if (snapshot.hasData && snapshot.data!.docs.isNotEmpty) {
                var data = snapshot.data!.docs.first.data();
                var ybPlayStoreLink = (data as Map<String, dynamic>)?['playStoreLink']
                as String? ??
                    '';
                var ybAppStoreLink = (data as Map<String, dynamic>)?['appStoreLink']
                as String? ??
                    '';

                return Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    text('Download'),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        Icon(FontAwesomeIcons.googlePlay),
                        SizedBox(width: 8,),
                        text(
                          ybPlayStoreLink.toString(),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        Icon(FontAwesomeIcons.appStore),
                        SizedBox(width: 8,),
                        text(
                          ybAppStoreLink.toString(),
                        ),
                      ],
                    ),

                    SizedBox(
                      height: 20,
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
          SizedBox(width: 50,),
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
                        text('Connect'),
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          children: [
                            Icon(FontAwesomeIcons.message),
                            SizedBox(width: 8,),
                            text(
                                 ybEmail.toString(),
                                ),
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          children: [
                            Icon(FontAwesomeIcons.phone),
                            SizedBox(width: 8,),
                            text(
                                ybPhone.toString(),
                                ),
                          ],
                        ),

                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          children: [
                            Icon(FontAwesomeIcons.facebook),
                            SizedBox(width: 8,),
                            text(
                                 ybFacebook.toString(),
                                ),
                          ],
                        ),

                        SizedBox(
                          height: 20,
                        ),
                        Row(

                          children: [
                            Icon(FontAwesomeIcons.twitter),
                            SizedBox(width: 8,),
                            text(
                                 ybTwitter.toString(),
                                ),
                          ],
                        ),

                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          children: [
                            Icon(FontAwesomeIcons.instagram),
                            SizedBox(width: 8,),
                            text(
                                ybInstragram.toString(),
                                ),
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
      ),
    );

}


Widget appBarFooterSmall(BuildContext context){

  return
    Padding(
      padding: const EdgeInsets.all(20),
      child: Align(
        alignment: Alignment.topLeft,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 50,),
            Theme(
              data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
              child: ExpansionTile(
                title: HeadingTextWidget(title: 'Company',fontSize: 15,),
              children: [
                Align(
                  alignment: Alignment.topLeft,
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 20,),
                        text('Blog'),
                        SizedBox(height: 20,),
                        text('Careers'),
                        SizedBox(height: 20,),
                        text('Team & Culture'),
                        SizedBox(height: 20,),
                        text('Privacy Policy'),
                        SizedBox(height: 20,),
                        text('Team of services'),
                        SizedBox(height: 20,),
                        Row(mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            text('Email :'),
                            text('${AppConstants.ybEmail}'),
                          ],
                        ),
                        SizedBox(height: 20,),
                        Row(mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            text('Phone :'),
                            text('${AppConstants.ybPhone}'),
                          ],
                        ),
                      ],
                    ),
                  ),
                )
              ],

              ),
            ),

            SizedBox(height: 20,),
            Theme(
              data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
              child: ExpansionTile(
                title: HeadingTextWidget(title: 'Resources',fontSize: 15,),
                children: [
                  Align(
                    alignment: Alignment.topLeft,
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: 20,),

                          text('Accessibility'),
                          SizedBox(height: 20,),
                          text('Become a driver partner'),
                          SizedBox(height: 20,),
                          text('Referrals'),
                          SizedBox(height: 20,),
                          text('Partner with Us'),
                          SizedBox(height: 20,),
                          text('Do not Sell My Personal Information'),

                          SizedBox(height: 20,),
                        ],
                      ),
                    ),
                  )
                ],

              ),
            ),
            SizedBox(height: 20,),
            Theme(
              data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
              child: ExpansionTile(
                title: HeadingTextWidget(title: 'Download',fontSize: 15,),
                children: [
                  Align(
                    alignment: Alignment.topLeft,
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: 20,),
                          text('For iOS'),
                          SizedBox(height: 20,),
                          text('For Android'),
                        ],
                      ),
                    ),
                  )
                ],

              ),
            ),
            SizedBox(height: 20,),
            Theme(
              data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
              child: ExpansionTile(
                title: HeadingTextWidget(title: 'Connect',fontSize: 15,),
                children: [
                  Align(
                    alignment: Alignment.topLeft,
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: 20,),

                          text('Facebook'),
                          SizedBox(height: 20,),
                          text('Twitter'),
                          SizedBox(height: 20,),
                          text('LinkedIn'),
                          SizedBox(height: 20,),
                          text('Instagram'),
                        ],
                      ),
                    ),
                  )
                ],

              ),
            ),

            SizedBox(height:30),
            Image(image: AssetImage('assets/images/YBRIDE text.jpg'),height: 60,width: 60,),
            SizedBox(height: 10,),
            text('© Copyright 2024 YBRide Systems Inc.'),
            SizedBox(height: 10,),
            text('All rights reserved.'),

            SizedBox(height: 50,),

          ],
        ),
      ),
    );

}


Widget text(String title){
  return SubHeadingTextWidget(title: title,textColor: Colors.black,fontSize: 12,fontWeight: FontWeight.w600,);
}