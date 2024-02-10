

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yb_ride_user_web/Vehicle/Controller.dart';
import 'package:yb_ride_user_web/pages/appBarPages/appBarFooter/appBatFooter.dart';
import '../checkOut/view.dart';
import '../components/drwer.dart';
import '../components/headingTextWidget.dart';
import '../helper/api.dart';
import '../helper/appColors.dart';
import '../helper/responsive.dart';
import '../pages/appBarPages/Accounts/view.dart';
import '../pages/appBarPages/FaqS/view.dart';
import '../pages/appBarPages/Referrals/view.dart';
import '../pages/appBarPages/Trips/view.dart';
import 'Widgets/car_card.dart';
import 'package:lottie/lottie.dart';
import 'Widgets/weekdayContainer.dart';

class VehiclePage extends StatelessWidget {
  const VehiclePage({super.key});

  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> _scaffoldKey =
    new GlobalKey<ScaffoldState>();
    final con = Get.put(VehicleCon());

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
          padding: EdgeInsets.only(left: 5),
          child: HeadingTextWidget(
            title: 'YBRide',
            fontWeight: FontWeight.bold,
            fontSize: 30,
          ),
        ),
        actions: ResponsiveWidget.isLargeScreen(context)
            ? [
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
          InkWell(
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
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 30,),
            weekDayContainer(),
            SizedBox(height: 30,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 100),
              child: Divider(),
            ),
            SizedBox(
              height: 18,
            ),
            StreamBuilder<QuerySnapshot>(
                stream: APis.db.collection('vehicleData').snapshots(),
                builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                  if (snapshot.hasError) {
                    return Center(
                      child: Container(
                        height: 150,
                        width: 150,
                        child: Lottie.asset('assets/lottie/loading2.json'),
                      ),
                    );
                  } else if (snapshot.hasData) {
                    return ListView.builder(
                      shrinkWrap: true,
                      itemCount: snapshot.data!.docs.length,
                      itemBuilder: (context, index) {
                        if (snapshot.data!.docs.length != 0) {
                          if (ResponsiveWidget.isSmallScreen(context)) {
                            return Center(
                              child: Column(
                                children: [
                                  CarCardSmallScreen(
                                    type: snapshot.data!.docs[index]['type']
                                        .toString(),
                                    vehicle: snapshot
                                        .data!.docs[index]['vehicle']
                                        .toString(),
                                    seats: snapshot
                                        .data!.docs[index]['seats']
                                        .toString(),
                                    suitcase: snapshot
                                        .data!.docs[index]['suitcase']
                                        .toString(),
                                    price: double.parse(snapshot
                                        .data!.docs[index]['pricePerDay']
                                        .toString()),
                                    gas: snapshot
                                        .data!.docs[index]['fuelType']
                                        .toString(),
                                    transmission: snapshot
                                        .data!.docs[index]['transmission']
                                        .toString(),
                                    bluetooth: snapshot
                                        .data!.docs[index]['bluetooth']
                                        .toString(),
                                    ac: snapshot.data!.docs[index]['ac']
                                        .toString(),
                                    vehiclesLeft: snapshot
                                        .data!.docs[index]['noOfVehicles']
                                        .toString(),
                                    onPress: () {
                                      Get.to(
                                          ()=>CheckOutPage()
                                      );
                                    },
                                  ),
                                ],
                              ),
                            );
                          } else if (ResponsiveWidget.isMediumScreen(
                              context)) {
                            return Column(
                              children: [
                                CarCardMediumScreen(
                                  type: snapshot.data!.docs[index]['type']
                                      .toString(),
                                  vehicle: snapshot
                                      .data!.docs[index]['vehicle']
                                      .toString(),
                                  seats: snapshot.data!.docs[index]['seats']
                                      .toString(),
                                  suitcase: snapshot
                                      .data!.docs[index]['suitcase']
                                      .toString(),
                                  price: double.parse(snapshot
                                      .data!.docs[index]['pricePerDay']
                                      .toString()),
                                  gas: snapshot
                                      .data!.docs[index]['fuelType']
                                      .toString(),
                                  transmission: snapshot
                                      .data!.docs[index]['transmission']
                                      .toString(),
                                  bluetooth: snapshot
                                      .data!.docs[index]['bluetooth']
                                      .toString(),
                                  ac: snapshot.data!.docs[index]['ac']
                                      .toString(),
                                  vehiclesLeft: snapshot
                                      .data!.docs[index]['noOfVehicles']
                                      .toString(),
                                  onPress: () {
                                    Get.to(
                                        ()=>CheckOutPage());
                                  },
                                ),
                              ],
                            );
                          } else if(ResponsiveWidget.isLargeScreen(context)) {

                            return Column(
                              children: [
                                CarCardLargeScreen(
                                  type: snapshot.data!.docs[index]['type']
                                      .toString(),
                                  vehicle: snapshot
                                      .data!.docs[index]['vehicle']
                                      .toString(),
                                  seats: snapshot.data!.docs[index]['seats']
                                      .toString(),
                                  suitcase: snapshot
                                      .data!.docs[index]['suitcase']
                                      .toString(),
                                  price: double.parse(snapshot
                                      .data!.docs[index]['pricePerDay']
                                      .toString()),
                                  gas: snapshot
                                      .data!.docs[index]['fuelType']
                                      .toString(),
                                  transmission: snapshot
                                      .data!.docs[index]['transmission']
                                      .toString(),
                                  bluetooth: snapshot
                                      .data!.docs[index]['bluetooth']
                                      .toString(),
                                  ac: snapshot.data!.docs[index]['ac']
                                      .toString(),
                                  vehiclesLeft: snapshot
                                      .data!.docs[index]['noOfVehicles']
                                      .toString(),
                                  description: snapshot
                                      .data!.docs[index]['description']
                                      .toString(),
                                  onPress: () {
                                    Get.to(
                                        ()=>CheckOutPage()
                                    );
                                  },
                                ),
                              ],
                            );
                          }
                        } else {
                          return Center(
                            child: HeadingTextWidget(
                              title: 'No data is stored yet.',
                            ),
                          );
                        }
                      },
                    );
                  } else {
                    return Container();
                  }
                }),
            SizedBox(height: 30,),
            appBarFooter()
          ],
        ),
      ),
    );
  }
}
