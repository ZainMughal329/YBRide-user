import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_google_places_sdk/flutter_google_places_sdk.dart';
import 'package:get/get.dart';
import 'package:yb_ride_user_web/components/headingTextWidget.dart';
import 'package:yb_ride_user_web/components/subHeadingText.dart';
import 'package:yb_ride_user_web/helper/appColors.dart';
import 'package:yb_ride_user_web/homePage/HomePageWidget/serach_text_field.dart';
import 'package:yb_ride_user_web/homePage/controller.dart';

Future<void> toBottomSheet(BuildContext context, HomePageCon cont) async {
  List<AutocompletePrediction> resultList = [];
  // List<String> secondarytList = [];

  cont.state.locationSearchController.addListener(() async {
    final places =
        // FlutterGooglePlacesSdk('AIzaSyA8mT_fcQoFRNpBokvTjVXsuc-TB9k-leI');
        FlutterGooglePlacesSdk('AIzaSyA8mT_fcQoFRNpBokvTjVXsuc-TB9k-leI');
    final predictions = await places.findAutocompletePredictions(
      cont.state.locationSearchController.text.trim().toString(),
    );
    cont.state.placeList.length = 0;
    cont.state.placeList.value.clear();
    for (var pred in predictions.predictions) {
      print('predictions:' + pred.toString());
      print('fullText:' + pred.fullText.toString());
      print('primaryText:' + pred.primaryText.toString());
      print('secondaryText:' + pred.secondaryText.toString());
      var predData =
          pred.secondaryText.toString().toLowerCase().contains('va, usa') ||
              pred.secondaryText.toString().toLowerCase().contains('ma, usa') ||
              pred.secondaryText.toString().toLowerCase().contains('dc, usa') ||
              pred.secondaryText.toString().toLowerCase().contains('md, usa');
      print('data:' + predData.toString());
      if (predData == true) {
        print('inside');
        resultList.add(pred);
        cont.state.placeList.value = resultList;
      } else {
        log('nothing');
      }
      // secondarytList.add(pred.primaryText.toString());
    }

    // cont.state.primaryText.value = secondarytList;
  });

  clearLists() {
    resultList.clear();
    // secondarytList.clear();
    cont.state.placeList.length = 0;
    cont.state.placeList.clear();
    cont.state.placeList.value.clear();
    cont.state.primaryText.value.clear();
    cont.state.primaryText.clear();
    cont.state.locationSearchController.clear();
  }

  return showModalBottomSheet(
      backgroundColor: Colors.white,
      isScrollControlled: true,
      showDragHandle: true,
      useSafeArea: true,
      context: context,
      builder: (_) {
        return Container(
          // height: ,
          color: Colors.white,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                // height: mq.height * 0.07,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                        // width: mq.width * 0.05,
                        ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        InkWell(
                          onTap: () {
                            clearLists();
                            Navigator.pop(context);
                          },
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 5),
                            child: Container(
                              // width: mq.width * 0.2,
                              // child: IconContainer(iconName: 'XMark.png',height: 15,width: 15,),
                              child: IconButton(
                                icon: Icon(Icons.cancel_outlined),
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    HeadingTextWidget(
                        title: 'Delivery and return location',
                        fontWeight: FontWeight.w600,
                        fontSize: 19,
                        textColor: Colors.black54),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 5),
                child: Divider(),
              ),
              SearchTextField(context, cont),
              Obx(() {
                return cont.state.placeList.length == 0
                    ? Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            SizedBox(height: 10),
                            HeadingTextWidget(
                              title: 'No result found (yet)',
                              fontWeight: FontWeight.w600,
                              textColor: Colors.black54,
                            ),
                            SubHeadingTextWidget(
                              title:
                                  "Try to adding more details, like 123 Main Street Black Bay Boston",
                              textColor: Colors.black54,
                              textAlign: TextAlign.center,
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(
                                  vertical: 10, horizontal: 20),
                              child: Divider(),
                            ),
                            SubHeadingTextWidget(
                              title: 'Add a city for better results',
                              textColor: Colors.black54,
                            ),
                          ],
                        ),
                      )
                    : Expanded(
                        child: cont.state.searchLoading.value
                            ? Container()
                            : ListView.builder(
                                physics: BouncingScrollPhysics(),
                                itemCount: cont.state.placeList.length,
                                itemBuilder: (context, index) {
                                  return cont.state.placeList.length == 0
                                      ? Container()
                                      : ListTile(
                                          title: HeadingTextWidget(
                                            title: cont.state.placeList[index]
                                                .fullText,
                                            textColor: Colors.black,
                                            fontWeight: FontWeight.w600,
                                            fontSize: 14,
                                          ),
                                          subtitle: SubHeadingTextWidget(
                                            title: cont.state.placeList[index]
                                                .secondaryText,
                                            textColor: Colors.black,
                                            fontWeight: FontWeight.normal,
                                            fontSize: 12,
                                          ),
                                          onTap: () {
                                            cont.state.returnPlace.value =
                                                cont.state.placeList[index]
                                                    .fullText;
                                            cont.state.toAddressSelected.value =
                                                true;
                                            clearLists();
                                            print("Return Place" +
                                                cont.state.returnPlace.value
                                                    .toString());
                                            Navigator.pop(context);
                                          },
                                        );
                                }),
                      );
              }),
            ],
          ),
        );
      });
}
