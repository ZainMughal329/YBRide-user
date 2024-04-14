import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';

import '../../../../helper/responsive.dart';
import '../../components/headingTextWidget.dart';
import '../../components/subHeadingText.dart';
import '../../helper/appColors.dart';
import 'alert_box.dart';

class CarCardLargeScreen extends StatelessWidget {
  final String type;
  final String vehicle;
  final String seats;
  final String suitcase;
  final String description;
  final double price;
  final String gas;
  final String transmission;
  final String bluetooth;
  final String ac;
  final String vehiclesLeft;
  final VoidCallback onPress;

  CarCardLargeScreen({
    Key? key,
    required this.type,
    required this.vehicle,
    required this.seats,
    required this.suitcase,
    required this.description,
    required this.price,
    required this.gas,
    required this.transmission,
    required this.bluetooth,
    required this.ac,
    required this.vehiclesLeft,
    required this.onPress,
  }) : super(key: key);

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
    return vehiclesLeft == '0'
        ? Stack(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(vertical: 5, horizontal: 70),
                child: Center(
                  child: Container(
                    width: ResponsiveWidget.isLargeScreen(context)
                        ? 1300
                        : ResponsiveWidget.isMediumScreen(context)
                            ? 700
                            : 250,
                    height: 280,
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Container(
                                  height: 220,
                                  width: 360,
                                  // width: double.infinity,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    // color: Colors.red,
                                    border: Border.all(color: Colors.black12),
                                  ),
                                  child: Swiper(
                                    itemBuilder:
                                        (BuildContext context, int index) {
                                      return Image.asset(
                                        type == "Economy"
                                            ? economyList[index]
                                            : type == "Premium"
                                                ? premiumList[index]
                                                : type == "AllWheelDriveSUV"
                                                    ? avdList[index]
                                                    : type == "SUV"
                                                        ? suvList[index]
                                                        : sedanList[index],
                                        fit: BoxFit.cover,
                                        // height: 188.h,
                                        width: 288,
                                      );
                                    },
                                    autoplay: false,
                                    itemCount: economyList.length,
                                    viewportFraction: 0.8,
                                    scale: 0.9,
                                    pagination: SwiperPagination(
                                      alignment: Alignment.bottomCenter,
                                      builder: DotSwiperPaginationBuilder(
                                          color: Colors.black12,
                                          activeColor: Colors.white,
                                          activeSize: 13),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Padding(
                                  padding: EdgeInsets.only(top: 20),
                                  child: Container(
                                    height: 220,
                                    width: 390,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        HeadingTextWidget(title: type),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        SubHeadingTextWidget(title: vehicle),
                                        SubHeadingTextWidget(
                                            title: seats +
                                                ' seats . ' +
                                                suitcase +
                                                ' suitcases'),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        InkWell(
                                          onTap: () {
                                            showCustomAlertDialog(
                                                context,
                                                seats,
                                                suitcase,
                                                gas,
                                                transmission,
                                                ac,
                                                bluetooth);
                                          },
                                          child: HeadingTextWidget(
                                            title: 'See details',
                                            fontSize: 15,
                                            textColor: AppColors.buttonColor,
                                          ),
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Container(
                                          height: 2,
                                          width: 20,
                                          color: Colors.grey,
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        SubHeadingTextWidget(
                                          title: description,
                                          fontSize: 14,
                                          textColor: AppColors.blackColor,
                                          fontWeight: FontWeight.normal,
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: 20),
                              child: Container(
                                height: 220,
                                width: 200,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        HeadingTextWidget(
                                          title:
                                              '\$' + price.toString() + '| day',
                                        ),
                                        SubHeadingTextWidget(
                                          title: 'excl. coverage, taxes',
                                          textColor: AppColors.blackColor,
                                          fontSize: 12,
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Container(
                                          child: Padding(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 1),
                                            child: Row(
                                              children: [
                                                Icon(
                                                  Icons.timer,
                                                  color: Colors.blue,
                                                  size: 18,
                                                ),
                                                SizedBox(
                                                  width: 5,
                                                ),
                                                HeadingTextWidget(
                                                  title: vehiclesLeft +
                                                      ' vehicles left',
                                                  textColor: Colors.blue,
                                                  fontSize: 10,
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Spacer(),
                                    InkWell(
                                      // onTap: onPress,
                                      child: Container(
                                        height: 50,
                                        width: 110,
                                        decoration: BoxDecoration(
                                          color: AppColors.buttonColor,
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                        child: Center(
                                          child: HeadingTextWidget(
                                            title: 'Select',
                                            fontSize: 17,
                                            textColor: AppColors.whiteColor,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Spacer(),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                        Divider(),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 5, horizontal: 70),
                child: Center(
                  child: Container(
                    width: ResponsiveWidget.isLargeScreen(context)
                        ? 1300
                        : ResponsiveWidget.isMediumScreen(context)
                            ? 700
                            : 250,
                    height: 280,
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              height: 230,
                              width: 360,
                              // width: double.infinity,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.black.withOpacity(.6),
                                // color: Colors.red,
                                border: Border.all(color: Colors.black12),
                              ),
                              child: Center(
                                child: HeadingTextWidget(
                                  title: 'Sold Out',
                                  textColor: Colors.white,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              )
            ],
          )
        : Padding(
            padding: EdgeInsets.symmetric(vertical: 5, horizontal: 70),
            child: Center(
              child: Container(
                width: ResponsiveWidget.isLargeScreen(context)
                    ? 1300
                    : ResponsiveWidget.isMediumScreen(context)
                        ? 700
                        : 250,
                height: 280,
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Container(
                              height: 220,
                              width: 360,
                              // width: double.infinity,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                // color: Colors.red,
                                border: Border.all(color: Colors.black12),
                              ),
                              child: Swiper(
                                itemBuilder: (BuildContext context, int index) {
                                  return Image.asset(
                                    type == "Economy"
                                        ? economyList[index]
                                        : type == "Premium"
                                            ? premiumList[index]
                                            : type == "AllWheelDriveSUV"
                                                ? avdList[index]
                                                : type == "SUV"
                                                    ? suvList[index]
                                                    : sedanList[index],
                                    fit: BoxFit.cover,
                                    // height: 188.h,
                                    width: 288,
                                  );
                                },
                                autoplay: false,
                                itemCount: economyList.length,
                                viewportFraction: 0.8,
                                scale: 0.9,
                                pagination: SwiperPagination(
                                  alignment: Alignment.bottomCenter,
                                  builder: DotSwiperPaginationBuilder(
                                      color: Colors.black12,
                                      activeColor: Colors.white,
                                      activeSize: 13),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: 20),
                              child: Container(
                                height: 220,
                                width: 390,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    HeadingTextWidget(title: type),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    SubHeadingTextWidget(title: vehicle),
                                    SubHeadingTextWidget(
                                        title: seats +
                                            ' seats . ' +
                                            suitcase +
                                            ' suitcases'),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    InkWell(
                                      onTap: () {
                                        showCustomAlertDialog(
                                            context,
                                            seats,
                                            suitcase,
                                            gas,
                                            transmission,
                                            ac,
                                            bluetooth);
                                      },
                                      child: HeadingTextWidget(
                                        title: 'See details',
                                        fontSize: 15,
                                        textColor: AppColors.buttonColor,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Container(
                                      height: 2,
                                      width: 20,
                                      color: Colors.grey,
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    SubHeadingTextWidget(
                                      title: description,
                                      fontSize: 14,
                                      textColor: AppColors.blackColor,
                                      fontWeight: FontWeight.normal,
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 20),
                          child: Container(
                            height: 220,
                            width: 200,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    HeadingTextWidget(
                                      title: '\$' + price.toString() + '| day',
                                    ),
                                    SubHeadingTextWidget(
                                      title: 'excl. coverage, taxes',
                                      textColor: AppColors.blackColor,
                                      fontSize: 12,
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Container(
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 1),
                                        child: Row(
                                          children: [
                                            Icon(
                                              Icons.timer,
                                              color: Colors.blue,
                                              size: 18,
                                            ),
                                            SizedBox(
                                              width: 5,
                                            ),
                                            HeadingTextWidget(
                                              title: vehiclesLeft +
                                                  ' vehicles left',
                                              textColor: Colors.blue,
                                              fontSize: 10,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                Spacer(),
                                InkWell(
                                  onTap: onPress,
                                  child: Container(
                                    height: 50,
                                    width: 110,
                                    decoration: BoxDecoration(
                                      color: AppColors.buttonColor,
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: Center(
                                      child: HeadingTextWidget(
                                        title: 'Select',
                                        fontSize: 17,
                                        textColor: AppColors.whiteColor,
                                      ),
                                    ),
                                  ),
                                ),
                                Spacer(),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    Divider(),
                  ],
                ),
              ),
            ),
          );
  }
}

class CarCardMediumScreen extends StatelessWidget {
  final String type;
  final String vehicle;
  final String seats;
  final String suitcase;
  final double price;
  final String gas;
  final String transmission;
  final String bluetooth;
  final String ac;
  final String vehiclesLeft;
  final VoidCallback onPress;

  CarCardMediumScreen({
    Key? key,
    required this.type,
    required this.vehicle,
    required this.seats,
    required this.suitcase,
    required this.price,
    required this.gas,
    required this.transmission,
    required this.bluetooth,
    required this.ac,
    required this.vehiclesLeft,
    required this.onPress,
  }) : super(key: key);

  List<String> imagesList = [
    'images/dashboard.webp',
    'images/dashboard.webp',
    'images/dashboard.webp',
  ];

  List<String> economyList = [
    'images/eco-1.webp',
    'images/eco-2.webp',
    'images/eco-3.webp',
  ];

  List<String> premiumList = [
    'images/premium-1.webp',
    'images/premium-2.webp',
    'images/premium-3.webp',
  ];

  List<String> sedanList = [
    'images/sedan-1.webp',
    'images/sedan-2.webp',
    'images/sedan-3.webp',
  ];

  List<String> avdList = [
    'images/awd-1.webp',
    'images/awd-2.webp',
    'images/awd-3.webp',
  ];
  List<String> suvList = [
    'images/7_seater-1.webp',
    'images/7_seater-2.webp',
    'images/7_seater-3.webp',
  ];

  @override
  Widget build(BuildContext context) {
    return
      vehiclesLeft == '0' ?
          Stack(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(vertical: 5),
                child: Center(
                  child: Container(
                    width: 350,
                    // height: 380,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          height: 220,
                          // width: 200,
                          // width: double.infinity,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            // color: Colors.red,
                            border: Border.all(color: Colors.black12),
                          ),
                          child: Swiper(
                            itemBuilder: (BuildContext context, int index) {
                              return Image.asset(
                                type == "Economy"
                                    ? economyList[index]
                                    : type == "Premium"
                                    ? premiumList[index]
                                    : type == "AllWheelDriveSUV"
                                    ? avdList[index]
                                    : type == "SUV"
                                    ? suvList[index]
                                    : sedanList[index],
                                fit: BoxFit.cover,
                                // height: 188.h,
                                // width: 288,
                              );
                            },
                            autoplay: false,
                            itemCount: imagesList.length,
                            viewportFraction: 0.8,
                            scale: 0.9,
                            pagination: SwiperPagination(
                              alignment: Alignment.bottomCenter,
                              builder: DotSwiperPaginationBuilder(
                                  color: Colors.black12,
                                  activeColor: Colors.white,
                                  activeSize: 13),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 20),
                          child: Container(
                            height: 220,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    HeadingTextWidget(title: type),
                                    InkWell(
                                      // onTap: onPress,
                                      child: Container(
                                        height: 30,
                                        width: 70,
                                        decoration: BoxDecoration(
                                          color: AppColors.buttonColor,
                                          borderRadius: BorderRadius.circular(10),
                                        ),
                                        child: Center(
                                          child: HeadingTextWidget(
                                            title: 'Select',
                                            fontSize: 13,
                                            textColor: AppColors.whiteColor,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                SubHeadingTextWidget(title: vehicle),
                                SubHeadingTextWidget(
                                    title: seats + ' seats . ' + suitcase + ' suitcases'),
                                SizedBox(
                                  height: 10,
                                ),
                                InkWell(
                                  onTap: () {
                                    showCustomAlertDialog(context, seats, suitcase, gas,
                                        transmission, ac, bluetooth);
                                  },
                                  child: HeadingTextWidget(
                                    title: 'See details',
                                    fontSize: 15,
                                    textColor: AppColors.buttonColor,
                                  ),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    HeadingTextWidget(
                                      title: '\$' + price.toString() + '| day',
                                      fontSize: 15,
                                    ),
                                    Container(
                                      child: Padding(
                                        padding:
                                        const EdgeInsets.symmetric(horizontal: 1),
                                        child: Row(
                                          children: [
                                            Icon(
                                              Icons.timer,
                                              color: Colors.blue,
                                              size: 18,
                                            ),
                                            SizedBox(
                                              width: 5,
                                            ),
                                            HeadingTextWidget(
                                              title: vehiclesLeft + ' vehicles left',
                                              textColor: Colors.blue,
                                              fontSize: 10,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 5),
                child: Center(
                  child: Container(
                    width: 350,
                    // height: 380,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          height: 220,
                          // width: 200,
                          // width: double.infinity,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.black.withOpacity(.6),
                            // color: Colors.red,
                            border: Border.all(color: Colors.black12),
                          ),
                          child: Center(
                            child: HeadingTextWidget(
                              title: 'Sold Out',
                              textColor: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              )
            ],
          )
          :
      Padding(
      padding: EdgeInsets.symmetric(vertical: 5),
      child: Center(
        child: Container(
          width: 350,
          // height: 380,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 220,
                // width: 200,
                // width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  // color: Colors.red,
                  border: Border.all(color: Colors.black12),
                ),
                child: Swiper(
                  itemBuilder: (BuildContext context, int index) {
                    return Image.asset(
                      type == "Economy"
                          ? economyList[index]
                          : type == "Premium"
                              ? premiumList[index]
                              : type == "AllWheelDriveSUV"
                                  ? avdList[index]
                                  : type == "SUV"
                                      ? suvList[index]
                                      : sedanList[index],
                      fit: BoxFit.cover,
                      // height: 188.h,
                      // width: 288,
                    );
                  },
                  autoplay: false,
                  itemCount: imagesList.length,
                  viewportFraction: 0.8,
                  scale: 0.9,
                  pagination: SwiperPagination(
                    alignment: Alignment.bottomCenter,
                    builder: DotSwiperPaginationBuilder(
                        color: Colors.black12,
                        activeColor: Colors.white,
                        activeSize: 13),
                  ),
                ),
              ),
              SizedBox(
                width: 10,
              ),
              Padding(
                padding: EdgeInsets.only(top: 20),
                child: Container(
                  height: 220,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          HeadingTextWidget(title: type),
                          InkWell(
                            onTap: onPress,
                            child: Container(
                              height: 30,
                              width: 70,
                              decoration: BoxDecoration(
                                color: AppColors.buttonColor,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Center(
                                child: HeadingTextWidget(
                                  title: 'Select',
                                  fontSize: 13,
                                  textColor: AppColors.whiteColor,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      SubHeadingTextWidget(title: vehicle),
                      SubHeadingTextWidget(
                          title: seats + ' seats . ' + suitcase + ' suitcases'),
                      SizedBox(
                        height: 10,
                      ),
                      InkWell(
                        onTap: () {
                          showCustomAlertDialog(context, seats, suitcase, gas,
                              transmission, ac, bluetooth);
                        },
                        child: HeadingTextWidget(
                          title: 'See details',
                          fontSize: 15,
                          textColor: AppColors.buttonColor,
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          HeadingTextWidget(
                            title: '\$' + price.toString() + '| day',
                            fontSize: 15,
                          ),
                          Container(
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 1),
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.timer,
                                    color: Colors.blue,
                                    size: 18,
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  HeadingTextWidget(
                                    title: vehiclesLeft + ' vehicles left',
                                    textColor: Colors.blue,
                                    fontSize: 10,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CarCardSmallScreen extends StatelessWidget {
  final String type;
  final String vehicle;
  final String seats;
  final String suitcase;
  final double price;
  final String gas;
  final String transmission;
  final String bluetooth;
  final String ac;
  final String vehiclesLeft;
  final VoidCallback onPress;

  CarCardSmallScreen({
    Key? key,
    required this.type,
    required this.vehicle,
    required this.seats,
    required this.suitcase,
    required this.price,
    required this.gas,
    required this.transmission,
    required this.bluetooth,
    required this.ac,
    required this.vehiclesLeft,
    required this.onPress,
  }) : super(key: key);

  List<String> imagesList = [
    'images/dashboard.webp',
    'images/dashboard.webp',
    'images/dashboard.webp',
  ];

  List<String> economyList = [
    'images/eco-1.webp',
    'images/eco-2.webp',
    'images/eco-3.webp',
  ];

  List<String> premiumList = [
    'images/premium-1.webp',
    'images/premium-2.webp',
    'images/premium-3.webp',
  ];

  List<String> sedanList = [
    'images/sedan-1.webp',
    'images/sedan-2.webp',
    'images/sedan-3.webp',
  ];

  List<String> avdList = [
    'images/awd-1.webp',
    'images/awd-2.webp',
    'images/awd-3.webp',
  ];
  List<String> suvList = [
    'images/7_seater-1.webp',
    'images/7_seater-2.webp',
    'images/7_seater-3.webp',
  ];

  @override
  Widget build(BuildContext context) {
    return
      vehiclesLeft == '0' ?
          Stack(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(vertical: 5),
                child: Center(
                  child: Container(
                    width: 350,
                    height: 350,
                    child: Column(
                      children: [
                        Column(
                          // mainAxisAlignment: MainAxisAlignment.spaceBetween,

                          children: [
                            Column(
                              children: [
                                Container(
                                  height: 150,
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    // color: Colors.red,
                                    border: Border.all(color: Colors.black12),
                                  ),
                                  child: Swiper(
                                    itemBuilder: (BuildContext context, int index) {
                                      return Image.asset(
                                        type == "Economy"
                                            ? economyList[index]
                                            : type == "Premium"
                                            ? premiumList[index]
                                            : type == "AllWheelDriveSUV"
                                            ? avdList[index]
                                            : type == "SUV"
                                            ? suvList[index]
                                            : sedanList[index],
                                        fit: BoxFit.cover,
                                        // height: 188.h,
                                        width: 288,
                                      );
                                    },
                                    autoplay: false,
                                    itemCount: imagesList.length,
                                    viewportFraction: 0.8,
                                    scale: 0.9,
                                    pagination: SwiperPagination(
                                      alignment: Alignment.bottomCenter,
                                      builder: DotSwiperPaginationBuilder(
                                          color: Colors.black12,
                                          activeColor: Colors.white,
                                          activeSize: 13),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Padding(
                                  padding: EdgeInsets.only(top: 20),
                                  child: Container(
                                    // height:220,
                                    width: 320,
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                          children: [
                                            HeadingTextWidget(title: type),
                                            InkWell(
                                              // onTap: onPress,
                                              child: Container(
                                                height: 30,
                                                width: 70,
                                                decoration: BoxDecoration(
                                                  color: AppColors.buttonColor,
                                                  borderRadius: BorderRadius.circular(10),
                                                ),
                                                child: Center(
                                                  child: HeadingTextWidget(
                                                    title: 'Select',
                                                    fontSize: 13,
                                                    textColor: AppColors.whiteColor,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        SubHeadingTextWidget(
                                          title: vehicle,
                                          textColor: AppColors.blackColor,
                                          fontSize: 15,
                                          fontWeight: FontWeight.w600,
                                        ),
                                        SubHeadingTextWidget(
                                            title: seats +
                                                ' seats . ' +
                                                suitcase +
                                                ' suitcases'),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        InkWell(
                                          onTap: () {
                                            showCustomAlertDialog(
                                                context,
                                                seats,
                                                suitcase,
                                                gas,
                                                transmission,
                                                ac,
                                                bluetooth);
                                          },
                                          child: HeadingTextWidget(
                                            title: 'See details',
                                            fontSize: 15,
                                            textColor: AppColors.buttonColor,
                                          ),
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                          children: [
                                            SubHeadingTextWidget(
                                              title: '\$' + price.toString() + '| day',
                                              textColor: AppColors.blackColor,
                                              fontWeight: FontWeight.w600,
                                            ),
                                            Column(
                                              children: [
                                                Container(
                                                  child: Padding(
                                                    padding: const EdgeInsets.symmetric(
                                                        horizontal: 1),
                                                    child: Row(
                                                      children: [
                                                        Icon(
                                                          Icons.timer,
                                                          color: Colors.blue,
                                                          size: 18,
                                                        ),
                                                        SizedBox(
                                                          width: 5,
                                                        ),
                                                        HeadingTextWidget(
                                                          title: vehiclesLeft +
                                                              ' vehicles left',
                                                          textColor: Colors.blue,
                                                          fontSize: 10,
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            )
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 5),
                child: Center(
                  child: Container(
                    width: 350,
                    height: 350,
                    child: Column(
                      children: [
                        Column(
                          // mainAxisAlignment: MainAxisAlignment.spaceBetween,

                          children: [
                            Column(
                              children: [
                                Container(
                                  height: 150,
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: Colors.black.withOpacity(.6),
                                    // color: Colors.red,
                                    border: Border.all(color: Colors.black12),
                                  ),
                                  child: Center(
                                    child: HeadingTextWidget(
                                      title: 'Sold Out',
                                      textColor: Colors.white,
                                    ),
                                  ),
                                ),

                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              )
            ],
          )
          :
      Padding(
      padding: EdgeInsets.symmetric(vertical: 5),
      child: Center(
        child: Container(
          width: 350,
          height: 350,
          child: Column(
            children: [
              Column(
                // mainAxisAlignment: MainAxisAlignment.spaceBetween,

                children: [
                  Column(
                    children: [
                      Container(
                        height: 150,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          // color: Colors.red,
                          border: Border.all(color: Colors.black12),
                        ),
                        child: Swiper(
                          itemBuilder: (BuildContext context, int index) {
                            return Image.asset(
                              type == "Economy"
                                  ? economyList[index]
                                  : type == "Premium"
                                      ? premiumList[index]
                                      : type == "AllWheelDriveSUV"
                                          ? avdList[index]
                                          : type == "SUV"
                                              ? suvList[index]
                                              : sedanList[index],
                              fit: BoxFit.cover,
                              // height: 188.h,
                              width: 288,
                            );
                          },
                          autoplay: false,
                          itemCount: imagesList.length,
                          viewportFraction: 0.8,
                          scale: 0.9,
                          pagination: SwiperPagination(
                            alignment: Alignment.bottomCenter,
                            builder: DotSwiperPaginationBuilder(
                                color: Colors.black12,
                                activeColor: Colors.white,
                                activeSize: 13),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 20),
                        child: Container(
                          // height:220,
                          width: 320,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  HeadingTextWidget(title: type),
                                  InkWell(
                                    onTap: onPress,
                                    child: Container(
                                      height: 30,
                                      width: 70,
                                      decoration: BoxDecoration(
                                        color: AppColors.buttonColor,
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      child: Center(
                                        child: HeadingTextWidget(
                                          title: 'Select',
                                          fontSize: 13,
                                          textColor: AppColors.whiteColor,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              SubHeadingTextWidget(
                                title: vehicle,
                                textColor: AppColors.blackColor,
                                fontSize: 15,
                                fontWeight: FontWeight.w600,
                              ),
                              SubHeadingTextWidget(
                                  title: seats +
                                      ' seats . ' +
                                      suitcase +
                                      ' suitcases'),
                              SizedBox(
                                height: 10,
                              ),
                              InkWell(
                                onTap: () {
                                  showCustomAlertDialog(
                                      context,
                                      seats,
                                      suitcase,
                                      gas,
                                      transmission,
                                      ac,
                                      bluetooth);
                                },
                                child: HeadingTextWidget(
                                  title: 'See details',
                                  fontSize: 15,
                                  textColor: AppColors.buttonColor,
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  SubHeadingTextWidget(
                                    title: '\$' + price.toString() + '| day',
                                    textColor: AppColors.blackColor,
                                    fontWeight: FontWeight.w600,
                                  ),
                                  Column(
                                    children: [
                                      Container(
                                        child: Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 1),
                                          child: Row(
                                            children: [
                                              Icon(
                                                Icons.timer,
                                                color: Colors.blue,
                                                size: 18,
                                              ),
                                              SizedBox(
                                                width: 5,
                                              ),
                                              HeadingTextWidget(
                                                title: vehiclesLeft +
                                                    ' vehicles left',
                                                textColor: Colors.blue,
                                                fontSize: 10,
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
