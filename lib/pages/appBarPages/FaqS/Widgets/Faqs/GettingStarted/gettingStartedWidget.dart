import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:yb_ride_user_web/components/subHeadingText.dart';
import 'package:yb_ride_user_web/helper/api.dart';
import 'package:yb_ride_user_web/helper/show_progress_indicator.dart';

import '../../../../../../components/headingTextWidget.dart';
import '../../../../../../helper/appColors.dart';

Widget GettingStartedWidgte(String colName, appBarName) {
  return Material(
    child: Container(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 150, vertical: 20),
          child: StreamBuilder<QuerySnapshot>(
              stream: APis.db.collection(colName).snapshots(),
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
                var data = snapshot.data!.docs;
                return Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    InkWell(
                      onTap: (){
                        showProgressIndicator(context);
                        Future.delayed(Duration(seconds: 2),(){
                          Navigator.pop(context);
                          // Get.to(()=>HomePage());
                          Get.back();
                        });
                        // Get.back();
                      },
                      child: SubHeadingTextWidget(
                          title: 'All Collections > ${appBarName}'),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Icon(
                      Icons.star,
                      color: AppColors.buttonColor,
                      size: 50,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    HeadingTextWidget(title: appBarName),
                    SizedBox(
                      height: 20,
                    ),
                    SubHeadingTextWidget(
                        title: '${data.length.toString()} articles'),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.black54),
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 20),
                        child:  data.length != 0
                            ? ListView.builder(
                            shrinkWrap: true,
                            itemCount: data.length,
                            itemBuilder: (context, index) {
                              return onTapAnswer(
                                data[index]['question'],
                                data[index]['answer'],
                              );
                            })
                            : Center(
                          child: HeadingTextWidget(
                            title: 'No articles here',
                          ),
                        ),
                      ),
                    )
                  ],
                );
              }),
        ),
      ),
    ),
  );
}

Widget GettingStartedWidgteSmall(String colName, String appBarName) {
  return Material(
    child: Container(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: StreamBuilder<QuerySnapshot>(
              stream: APis.db.collection(colName).snapshots(),
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
                var data = snapshot.data!.docs;
                return Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    InkWell(
                      onTap: () {
                        showProgressIndicator(context);
                        Future.delayed(Duration(seconds: 2),(){
                          Navigator.pop(context);
                          Get.back();
                        });
                        // Get.back();
                      },
                      child: SubHeadingTextWidget(
                          title: 'All Collections > ${appBarName}'),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Icon(
                      Icons.star,
                      color: AppColors.buttonColor,
                      size: 50,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    HeadingTextWidget(title: appBarName),
                    SizedBox(
                      height: 20,
                    ),
                    SubHeadingTextWidget(
                        title: '${data.length.toString()} articles'),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.black54),
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 20),
                        child: data.length != 0
                            ? ListView.builder(
                                shrinkWrap: true,
                                itemCount: data.length,
                                itemBuilder: (context, index) {
                                  return onTapAnswer(
                                    data[index]['question'],
                                    data[index]['answer'],
                                  );
                                })
                            : Center(
                                child: HeadingTextWidget(
                                  title: 'No articles here',
                                ),
                              ),
                      ),
                    )
                  ],
                );
              }),
        ),
      ),
    ),
  );
}

Widget onTapAnswer(String title, String subTitle) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.start,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      ExpansionTile(
        title: HeadingTextWidget(
          title: title,
          fontSize: 20,
          fontWeight: FontWeight.w600,
          // textColor: AppColors.buttonColor,
        ),
        children: [
          Padding(
            padding: EdgeInsets.all(16.0),
            child: SubHeadingTextWidget(title: "  " + subTitle),
          ),
        ],
      ),
      // Divider(),
    ],
  );
}
