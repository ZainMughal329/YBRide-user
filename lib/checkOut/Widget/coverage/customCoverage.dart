import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:yb_ride_user_web/checkOut/controller.dart';

import '../../../components/headingTextWidget.dart';
import '../../../components/subHeadingText.dart';
import '../../../helper/appColors.dart';

Future coverageBottomSheet(BuildContext context) {
  final con = CheckOutCon();
  final scrollController = ScrollController();

  return showModalBottomSheet(
    // backgroundColor: Theme.of(context).scaffoldBgClr,

    isScrollControlled: true,
    useSafeArea: true,
    context: context,
    // isScrollControlled: true,
    builder: (BuildContext context) {
      return Builder(builder: (BuildContext innerContext) {
        return SingleChildScrollView(
          controller: scrollController,
          child: Container(
            width: double.infinity,
            decoration: BoxDecoration(
              color: AppColors.whiteColor,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(15),
                topRight: Radius.circular(15),
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.5), // Shadow color
                  spreadRadius: 1, // Spread radius
                  blurRadius: 5, // Blur radius
                  offset: Offset(0,
                      -3), // Offset in the negative y-axis to create a top shadow
                ),
              ],
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.horizontal_rule,
                      size: 40,
                      color: Colors.grey.shade400,
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 5),
                  child: HeadingTextWidget(
                    title: "Custom Coverage",
                    fontWeight: FontWeight.bold,
                    // textColor: Theme.of(context).headingColor,
                  ),
                ),
                Divider(),
                SizedBox(
                  height: 25,
                ),
                Stack(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(bottom:120),
                      child: Column(
                        children: [
                          Obx(
                                () => _buildDetailItem(
                                'Damage Protection (CDW) & Roadside\nAssistance',
                                '\$24.99 | day',
                                'Avoid paying for any damages done to the car that\nexceeds a \$500 deductible and benefit from 24/7\nroadside assistance.',
                                context,
                                con.state.cdwSwitchVal.value, (value) {
                              con.state.cdwSwitchVal.value = value;
                              if(!value){
                                // con.subtractCustomCoverageValue('CDW');
                              }
                              // con.updateTotalPrice_Custom_CDW();
                            }),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Obx(
                                () => _buildDetailItem(
                                'Liability Protection (RCLI)',
                                '\$29.99 | day',
                                'Provides liability insurance which a mandatory legal\nrequirement in all 50 states',
                                context,
                                con.state.rcliSwitchVal.value, (value) {
                              con.state.rcliSwitchVal.value = value;
                              if(!value){
                                // con.subtractCustomCoverageValue('RCLI');
                              }
                              // con.updateTotalPrice_Custom_RCLI();
                            }),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Obx(
                                () => _buildDetailItem(
                                'Supplemental Liability (SLI)',
                                '\$19.99 | day',
                                'Covers supplemental liability beyond State Maximums.\nDoes not replace RCLI',
                                context,
                                con.state.sliSwitchVal.value, (value) {
                              con.state.sliSwitchVal.value = value;
                              if(!value){
                                // con.subtractCustomCoverageValue('SLI');
                              }

                              // con.updateTotalPrice_Custom_SLI();
                            }),
                          ),
                          SizedBox(
                            height: 10,
                          ),

                        ],
                      ),
                    ),
                    Positioned(
                        bottom:  0,
                        left: 0,
                        right: 0,
                        child: Obx(
                              () => Container(
                            height: 140,
                            // Adjust the height based on your design
                            decoration: BoxDecoration(
                                // color: Theme.of(context).scaffoldBgClr,
                                border:
                                Border.all(color: Colors.grey.shade100)),
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                  vertical: 10,
                                  horizontal: 50),
                              child: Row(
                                mainAxisAlignment:
                                MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                        children: [
                                          Column(
                                            crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                            children: [
                                              Row(
                                                children: [
                                                  HeadingTextWidget(
                                                    title: 'Total price',
                                                    // textColor: Theme.of(context)
                                                    //     .headingColor,
                                                    fontSize: 15,
                                                  ),
                                                  SizedBox(
                                                      width: 20),
                                                  CircleAvatar(
                                                    radius: 8,
                                                    // backgroundColor:
                                                    // Theme.of(context)
                                                    //     .headingColor,
                                                    child: Icon(
                                                      Icons.question_mark,
                                                      // color: Theme.of(context)
                                                      //     .scaffoldBgClr,
                                                      size: 8,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              Container(
                                                child: con.state.isLoading.value
                                                    ? Center(
                                                  child: Container(
                                                    height: 45,
                                                    width: 60,
                                                    child: Lottie.asset(
                                                        'assets/lottie/loading2.json'),
                                                  ),
                                                )
                                                    : con.state.sliSwitchVal
                                                    .value ==
                                                    true ||
                                                    con
                                                        .state
                                                        .rcliSwitchVal
                                                        .value ==
                                                        true ||
                                                    con
                                                        .state
                                                        .cdwSwitchVal
                                                        .value ==
                                                        true
                                                    ? Row(
                                                  children: [
                                                    SubHeadingTextWidget(
                                                      title:
                                                      '\$${con.state.totalPrice.value.toStringAsFixed(2)}',
                                                      fontSize: 13,
                                                      decoration:
                                                      TextDecoration
                                                          .lineThrough,
                                                      decorationColor:
                                                      AppColors.buttonColor,
                                                      // textColor: Theme.of(
                                                      //     context)
                                                      //     .lightTextColor,
                                                    ),
                                                    SizedBox(
                                                      width: 5,
                                                    ),
                                                    SubHeadingTextWidget(
                                                      title:
                                                      '\$${con.state.totalPrice.value.toStringAsFixed(2)}',
                                                      fontSize: 13,
                                                      // textColor: Theme.of(
                                                      //     context)
                                                      //     .headingColor,
                                                    ),
                                                  ],
                                                )
                                                    : SubHeadingTextWidget(
                                                  title: '\$${con.state.totalPrice.value.toStringAsFixed(2)}',
                                                  fontSize: 13,
                                                  // textColor: Theme.of(
                                                  //     context)
                                                  //     .lightTextColor,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                      SizedBox(height: 20),
                                    ],
                                  ),
                                  SizedBox(width: 6),
                                  con.state.sliSwitchVal.value == true ||
                                      con.state.rcliSwitchVal.value ==
                                          true ||
                                      con.state.cdwSwitchVal.value == true
                                      ? InkWell(
                                    onTap: () {},
                                    child: Padding(
                                      padding: EdgeInsets.only(
                                          bottom:17),
                                      child: Container(
                                        height: 50,
                                        width: 170,
                                        decoration: BoxDecoration(
                                          color: AppColors.buttonColor
                                              .withOpacity(0.8),
                                          borderRadius: BorderRadius.all(
                                            Radius.circular(10),
                                            // topRight: Radius.circular(10),
                                          ),
                                        ),
                                        child: Center(
                                            child: HeadingTextWidget(
                                              title: 'Add personal data',
                                              textColor: Colors.white,
                                              fontSize: 14,
                                            )),
                                      ),
                                    ),
                                  )
                                      : Padding(
                                    padding: EdgeInsets.only(
                                        bottom:17),
                                    child: Container(
                                      height: 50,
                                      width: 170,
                                      decoration: BoxDecoration(
                                        color: Color(0xff9e7fde),
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(10),
                                          // topRight: Radius.circular(10),
                                        ),
                                      ),
                                      child: Center(
                                          child: HeadingTextWidget(
                                            title: 'Add personal data',
                                            textColor: Colors.white,
                                            fontSize: 14,
                                          )),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        )),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
              ],
            ),
          ),
        );
      });
    },
  );
}

Widget _buildDetailItem(String text, String suText, String subHeadingText,
    BuildContext context, bool val, ValueChanged<bool>? onChanged) {
  return Padding(
    padding: EdgeInsets.symmetric(
        horizontal: 40, vertical: 10),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                HeadingTextWidget(
                  title: text,
                  // textColor: Theme.of(context).headingColor,
                  fontSize: 15,
                  height: 1.25,
                ),
                SizedBox(
                  height: 10,
                ),
                SubHeadingTextWidget(
                  title: suText,
                  // textColor: Theme.of(context).lightTextColor,
                  fontWeight: FontWeight.w600,
                  fontSize: 14,
                ),
              ],
            ),
            _switchButtonWithOutAppSettings(val, onChanged),
          ],
        ),
        SizedBox(
          height: 30,
        ),
        SubHeadingTextWidget(
          title: subHeadingText,
          // textColor: Theme.of(context).headingColor,
          fontWeight: FontWeight.w600,
          fontSize: 14,
        )
      ],
    ),
  );
}

Widget _switchButtonWithOutAppSettings(
    bool val, ValueChanged<bool>? onChanged) {
  return Switch(
    activeColor: AppColors.whiteColor,
    activeTrackColor: AppColors.buttonColor,
    value: val,
    onChanged: onChanged,
  );
}
