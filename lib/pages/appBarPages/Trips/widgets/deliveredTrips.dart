
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:yb_ride_user_web/helper/api.dart';
import 'package:yb_ride_user_web/helper/responsive.dart';
import 'package:yb_ride_user_web/homePage/view.dart';
import 'package:yb_ride_user_web/pages/appBarPages/Trips/widgets/tripsCustomAlertBox.dart';
import 'package:card_swiper/card_swiper.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:lottie/lottie.dart';
import '../../../../components/headingTextWidget.dart';
import '../../../../components/subHeadingText.dart';
import '../../../../helper/appColors.dart';
import '../../appBarFooter/appBatFooter.dart';
import '../controller.dart';

class deliveredTripsPage extends StatelessWidget {
   deliveredTripsPage({super.key});
  List<String> economyList = [
    'assets/images/eco-1.webp',
    'assets/images/eco-2.webp',
    'assets/images/eco-3.webp',
  ];
  List<String> premiumList = [
    'assets/images/premium-1.webp',
    'assets/images/premium-2.webp',
    'assets/images/premium-3.webp',
  ];
  List<String> sedanList = [
    'assets/images/sedan-1.webp',
    'assets/images/sedan-2.webp',
    'assets/images/sedan-3.webp',
  ];
  List<String> avdList = [
    'assets/images/awd-1.webp',
    'assets/images/awd-2.webp',
    'assets/images/awd-3.webp',
  ];
  List<String> suvList = [
    'assets/images/7_seater-1.webp',
    'assets/images/7_seater-2.webp',
    'assets/images/7_seater-3.webp',
  ];

  @override
  Widget build(BuildContext context) {
    final controller = TripCon();
    return Scaffold(
      body: StreamBuilder<QuerySnapshot>(
        stream: APis.db.collection('all_bookings')
            .where('id' , isEqualTo: APis.auth.currentUser!.uid).
        where('isPaid' , isEqualTo: true).
        where('status' , isEqualTo :'delivered')

            .snapshots(),
        builder: (BuildContext context, snapshot) {
          if (!snapshot.hasData) {
            return Center(
              child: Container(
                height: 100,
                width: 100,
                child: Lottie.asset('assets/lottie/loading2.json'),
              ),
            );
          }
          var data = snapshot.data!.docs;

          return data.length != 0
              ? ListView.builder(
            itemCount: data.length,
            itemBuilder: (context, index) {
              var fromDateString = data[index]['fromDateEpoch'] as String;
              log('from:$fromDateString');
              var fromDateMillis = int.parse(fromDateString);
              var fromDate =
              DateTime.fromMillisecondsSinceEpoch(fromDateMillis);

              var fromFormattedDate =
              DateFormat.yMd().format(fromDate.toLocal());
              return Padding(
                padding: const EdgeInsets.only(left: 8.0 , right: 8 , top: 20),
                child: Row(
                  children: [
                    Spacer(),
                    Container(
                      // width: 500,
                      width: ResponsiveWidget.isLargeScreen(context)
                          ? 550
                          : ResponsiveWidget.isSmallScreen(context)
                          ? MediaQuery.of(context).size.width * .9
                          : 450,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(
                          color: AppColors.buttonColor,
                          width: 0.2,
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(.1),
                            blurRadius: 5,
                            spreadRadius: 1,
                            offset: Offset(1, 1),
                          ),
                        ],
                      ),
                      child: Padding(
                        padding: EdgeInsets.symmetric(vertical: 30),
                        child: Center(
                          child: Container(
                            width: 400,
                            child: Column(
                              // mainAxisAlignment: MainAxisAlignment.start,
                              // crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  height: 150,
                                  width: double.infinity,
                                  child: Swiper(
                                    itemBuilder:
                                        (BuildContext context, int ind) {
                                      return Image.asset(
                                        data[index]['vehicleType'] ==
                                            "Premium"
                                            ? premiumList[ind]
                                            : data[index]['vehicleType'] ==
                                            "Economy"
                                            ? economyList[ind]
                                            : data[index]
                                        ['vehicleType'] ==
                                            "AllWheelDriveSUV"
                                            ? avdList[ind]
                                            : data[index][
                                        'vehicleType'] ==
                                            "SUV"
                                            ? suvList[ind]
                                            : sedanList[ind],
                                        fit: BoxFit.cover,
                                        width: 288,
                                      );
                                    },
                                    autoplay: false,
                                    itemCount: sedanList.length,
                                    viewportFraction: 0.8,
                                    scale: 0.9,
                                    physics: BouncingScrollPhysics(),
                                    pagination: SwiperPagination(
                                      alignment: Alignment
                                          .bottomCenter,
                                      builder:
                                      DotSwiperPaginationBuilder(

                                          color: Colors.white,

                                          activeColor: AppColors.buttonColor,

                                          activeSize: 13),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                Padding(
                                  padding: EdgeInsets.only(top: 20),
                                  child: Container(
                                    width: 320,
                                    child: Column(
                                      crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                      children: [
                                        Column(
                                          mainAxisAlignment:
                                          MainAxisAlignment.start,
                                          crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                          children: [
                                            HeadingTextWidget(
                                                title: data[index]
                                                ['vehicleType'],
                                                textColor: Colors.black),
                                            SizedBox(
                                              height: 10,
                                            ),
                                            SubHeadingTextWidget(
                                              title:
                                              'Start Date:$fromFormattedDate',
                                              textColor: Colors.black,
                                              fontSize: 15,
                                              fontWeight: FontWeight.w600,
                                            ),
                                            SizedBox(
                                              height: 10,
                                            ),
                                            SubHeadingTextWidget(
                                                title: 'Name:' +
                                                    data[index]['fullName']
                                                        .toString(),
                                                textColor: Colors.black),
                                            SizedBox(
                                              height: 10,
                                            ),
                                            InkWell(
                                              onTap: () {
                                                var rowData = data[index];
                                                var fromDateString =
                                                rowData['bookingDate']
                                                as String;
                                                log('from:$fromDateString');
                                                var fromDateMillis =
                                                int.parse(fromDateString);
                                                var fromDate = DateTime
                                                    .fromMillisecondsSinceEpoch(
                                                    fromDateMillis);
                                                var fromFormattedDate =
                                                DateFormat.yMd().format(
                                                    fromDate.toLocal());
                                                var toDateString =
                                                rowData['toDateEpoch']
                                                as String;
                                                log('startDateString:$toDateString');
                                                var toDateMillis =
                                                int.parse(toDateString);
                                                var toDate = DateTime
                                                    .fromMillisecondsSinceEpoch(
                                                    toDateMillis);
                                                var toFormattedDate =
                                                DateFormat.yMd().format(
                                                    toDate.toLocal());

                                                var fromTimeString =
                                                rowData['fromTimeEpoch']
                                                as String;
                                                log('startDateString:$fromTimeString');
                                                var fromTimeMillis =
                                                int.parse(fromTimeString);
                                                var fromTime = DateTime
                                                    .fromMillisecondsSinceEpoch(
                                                    fromTimeMillis);

                                                var formattedTime =
                                                DateFormat('h:mm a')
                                                    .format(fromTime
                                                    .toLocal());

                                                var toTimeString =
                                                rowData['toTimeEpoch']
                                                as String;
                                                log('startDateString:$toTimeString');
                                                var toTimeMillis =
                                                int.parse(toTimeString);
                                                var toTime = DateTime
                                                    .fromMillisecondsSinceEpoch(
                                                    toTimeMillis);

                                                var toFormattedTime =
                                                DateFormat('h:mm a')
                                                    .format(
                                                    toTime.toLocal());
                                                showCustomAlertDialogTrips(
                                                  rowData['id'],
                                                  rowData['bookingDate'],
                                                  rowData['fromTimeEpoch'],
                                                  rowData['toTimeEpoch'],
                                                  rowData['fromDateEpoch'],
                                                  rowData['toDateEpoch'],
                                                  context,
                                                  rowData['fullName'],
                                                  rowData['email'],
                                                  rowData['phone'],
                                                  rowData[
                                                  'completeFromAddress'],
                                                  rowData[
                                                  'completeToAddress'],
                                                  fromFormattedDate,
                                                  toFormattedDate,
                                                  rowData['fromTimeEpoch'],
                                                  rowData['toTimeEpoch'],

                                                  // controller
                                                  //     .convertMillisecondsToTimeString(
                                                  //         rowData['fromTimeEpoch']
                                                  //             .toString()),
                                                  // controller
                                                  //     .convertMillisecondsToTimeString(
                                                  //         rowData['toTimeEpoch']
                                                  //             .toString()),
                                                  rowData['vehicleType'],
                                                  rowData['totalPrice'],
                                                  rowData['isPickUp'],
                                                  rowData['isDelivery'],
                                                  rowData[
                                                  'isStandardProtection'],
                                                  rowData[
                                                  'isLiabilityProtection'],
                                                  rowData[
                                                  'isIHaveOwnProtection'],
                                                  rowData['isCustomCoverage'],
                                                  rowData[
                                                  'totalCustomCoverage'],
                                                  rowData['isUnlimitedMiles'],
                                                  rowData['isUnder25years'],
                                                  rowData[
                                                  'isPromoCodeApplied'],
                                                  rowData[
                                                  'promoDiscountAmount'],
                                                );
                                              },
                                              child: Container(
                                                height: 30,
                                                width: 70,
                                                decoration: BoxDecoration(
                                                  color:
                                                  AppColors.buttonColor,
                                                  borderRadius:
                                                  BorderRadius.circular(
                                                      10),
                                                ),
                                                child: Center(
                                                  child: HeadingTextWidget(
                                                    title: 'Details',
                                                    fontSize: 13,
                                                    textColor:
                                                    AppColors.whiteColor,
                                                  ),
                                                ),
                                              ),
                                            ),
                                            SizedBox(
                                              height: 20,
                                            ),
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    Spacer(),

                  ],
                ),
              );
            },
          )
              : SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration: BoxDecoration(
                  color: Color.fromRGBO(255, 255, 255, 1),
                ),
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: 25),
                      child: Image(
                          image: AssetImage('assets/images/howWorks.webp'),
                          height: 300,
                          width: 500),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Center(
                      child: SizedBox(
                        width: 900,
                        child: HeadingTextWidget(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          textAlign: TextAlign.center,
                          textColor: Colors.black54,
                          title: 'No trips (yet)',
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Center(
                      child: SizedBox(
                          width: 800,
                          child: SubHeadingTextWidget(
                            textAlign: TextAlign.center,
                            title:
                            "You haven't booked YBCars yet. How about doing so for your next adventure?",
                            fontWeight: FontWeight.w600,
                            textColor: Colors.black54,
                            fontSize: 14,
                            maxLines: 5,
                            overflow: TextOverflow.ellipsis,
                          )),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Padding(
                        padding: EdgeInsets.only(left: 20, right: 20),
                        child: InkWell(
                          onTap: (){
                            Get.to(()=>HomePage());
                          },
                          child: Container(
                            width: ResponsiveWidget.isLargeScreen(context)
                                ? 400
                                : 200,
                            height: 50,
                            decoration: BoxDecoration(
                                color: AppColors.buttonColor,
                                boxShadow: [
                                  BoxShadow(
                                      color: Colors.grey.withOpacity(.1))
                                ]),
                            child: Center(
                              child: HeadingTextWidget(
                                title: 'Book your YBCar now',
                                textColor: AppColors.whiteColor,
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        )),
                    SizedBox(
                      height: 50,
                    ),
                    Divider(),
                    SizedBox(
                      height: 20,
                    ),
                    ResponsiveWidget.isLargeScreen(context)
                        ? appBarFooter()
                        : appBarFooterSmall(context),
                    SizedBox(
                      height: 30,
                    )
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
