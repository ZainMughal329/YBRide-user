import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_google_places_sdk/flutter_google_places_sdk.dart';
import 'package:get/get.dart';
import 'package:yb_ride_user_web/components/headingTextWidget.dart';
import 'package:yb_ride_user_web/components/subHeadingText.dart';
import 'package:yb_ride_user_web/helper/appColors.dart';
import 'package:yb_ride_user_web/homePage/HomePageWidget/serach_text_field.dart';
import 'package:yb_ride_user_web/homePage/controller.dart';

Future<void> toBottomSheet(BuildContext context, HomePageCon cont) async{

  List<String> resultList = [];
  // List<String> secondarytList = [];

  cont.state.locationSearchController.addListener(() async{
    final places = FlutterGooglePlacesSdk('AIzaSyA8mT_fcQoFRNpBokvTjVXsuc-TB9k-leI');
    final predictions = await places.findAutocompletePredictions(cont.state.locationSearchController.text.trim().toString(),
    );
    cont.state.placeList.length=0;
    cont.state.placeList.value.clear();
    for(var pred in predictions.predictions){
      resultList.add(pred.fullText.toString());
      // secondarytList.add(pred.primaryText.toString());
    }
    cont.state.placeList.value = resultList;
    // cont.state.primaryText.value = secondarytList;


  });

  clearLists(){
    resultList.clear();
    // secondarytList.clear();
    cont.state.placeList.length=0;
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
      builder: (_){
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
                              child: IconButton(icon: Icon(Icons.cancel_outlined),onPressed: (){
                                Navigator.pop(context);
                              },),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(width: 10,),
                    HeadingTextWidget(
                        title: 'Delivery & return location',
                        fontWeight: FontWeight.w600,
                        fontSize: 19,
                        textColor: Colors.black54
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 5),
                child: Divider(),
              ),
              SearchTextField(context, cont),
              Obx(() {
                return cont.state.placeList.value.length == 0
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
                      itemCount: cont.state.placeList.value.length,
                      itemBuilder: (context, index) {
                        return cont.state.placeList.value.length == 0
                            ? Container()
                            : ListTile(
                          title: Text(cont.state
                              .placeList.value[index].toString()),

                          onTap: () {
                            cont.state.returnPlace.value = cont
                                .state
                                .placeList.value[index].toString();
                            cont.state.toAddressSelected.value=true;
                            clearLists();
                            print("Return Place"+cont.state.returnPlace.value.toString());
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