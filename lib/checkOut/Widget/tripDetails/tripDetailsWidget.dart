

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yb_ride_user_web/checkOut/controller.dart';
import 'package:yb_ride_user_web/checkOut/state.dart';
import 'package:yb_ride_user_web/components/headingTextWidget.dart';
import 'package:yb_ride_user_web/components/subHeadingText.dart';
import 'package:yb_ride_user_web/components/textField.dart';
import 'package:yb_ride_user_web/helper/AppConstants.dart';
import 'package:yb_ride_user_web/helper/responsive.dart';

import '../../../components/countryCodeTextField.dart';

Widget TripDetailsWidget(BuildContext context,CheckOutCon controller){
  final state = controller.state;
  return Obx(() =>
  ResponsiveWidget.isLargeScreen(context) || ResponsiveWidget.isMediumScreen(context) ?
  Container(
    decoration: BoxDecoration(
        border: Border.all(color: Colors.black54.withOpacity(.1)),
        borderRadius: BorderRadius.all(Radius.circular(10))
    ),
    child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 15,),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                HeadingTextWidget(title: '2. Trip Details',fontWeight: FontWeight.bold,fontSize: 30,),
                HeadingTextWidget(title: "*",fontSize: 30,textColor: Colors.red,),
              ],
            ),
          ),
          SizedBox(height: 15,),
          ListTile(
            leading: Icon(Icons.car_rental_outlined),
            title: HeadingTextWidget(title: '${AppConstants.vehicleType}',),
            subtitle: SubHeadingTextWidget(title: '${state.carDescription}',),
            // trailing: Container(
            //   height: 100,
            //   width: 90,
            //   decoration: BoxDecoration(
            //     color: Colors.grey.withOpacity(.1),
            //     borderRadius: BorderRadius.all(Radius.circular(100))
            //   ),
            //   child: Padding(
            //     padding: const EdgeInsets.symmetric(horizontal: 5,vertical: 5),
            //     child: Center(
            //       child: SubHeadingTextWidget(title: 'Edit',textColor: Colors.black54,fontWeight: FontWeight.bold,),
            //     ),
            //   ),
            // ),
          ),
          SizedBox(height: 15,),
          Divider(thickness: .5,),
          SizedBox(height: 15,),
          ListTile(
            leading: Icon(Icons.location_on),
            title: controller.state.isSelfPickup.value==true? HeadingTextWidget(title: '${AppConstants.pickUpLoc}',) : HeadingTextWidget(title: '${AppConstants.fromAddress}',),
            subtitle: Row(
              children: [
                SubHeadingTextWidget(title: '${AppConstants.fromDateName}, ${AppConstants.fromMonthName} ${AppConstants.fromDate}'),
                SubHeadingTextWidget(title: ' at '),
                SubHeadingTextWidget(title: '${AppConstants.fromTime}'),
              ],
            ),
            // trailing: Container(
            //   height: 100,
            //   width: 90,
            //   decoration: BoxDecoration(
            //       color: Colors.grey.withOpacity(.1),
            //       borderRadius: BorderRadius.all(Radius.circular(100))
            //   ),
            //   child: Padding(
            //     padding: const EdgeInsets.symmetric(horizontal: 5,vertical: 5),
            //     child: Center(
            //       child: SubHeadingTextWidget(title: 'Edit',textColor: Colors.black54,fontWeight: FontWeight.bold,),
            //     ),
            //   ),
            // ),
          ),
          Padding(
            padding:  EdgeInsets.symmetric(horizontal: 10),
            child: Divider(thickness: .5,),
          ),
          ListTile(
            leading: Icon(Icons.location_on),
            title: controller.state.isDelivery.value ==true ? HeadingTextWidget(title: '${AppConstants.toAddress}',):HeadingTextWidget(title: '${AppConstants.toAddress}'),
            subtitle: Row(
              children: [
                SubHeadingTextWidget(title: '${AppConstants.toDateName}, ${AppConstants.toMonthName} ${AppConstants.toDate}'),
                SubHeadingTextWidget(title: ' at '),
                SubHeadingTextWidget(title: '${AppConstants.toTime}'),
              ],
            ),
            // trailing: Container(
            //   height: 100,
            //   width: 90,
            //   decoration: BoxDecoration(
            //       color: Colors.grey.withOpacity(.1),
            //       borderRadius: BorderRadius.all(Radius.circular(100))
            //   ),
            //   child: Padding(
            //     padding: const EdgeInsets.symmetric(horizontal: 5,vertical: 5),
            //     child: Center(
            //       child: SubHeadingTextWidget(title: 'Edit',textColor: Colors.black54,fontWeight: FontWeight.bold,),
            //     ),
            //   ),
            // ),
          ),

          SizedBox(height: 30,),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 17),
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  color: Colors.blue.withOpacity(.1)
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                   controller.state.isSelfPickup.value==true?  SubHeadingTextWidget(title: "Pick up your Kyte at our Parking lot in Boston"): SubHeadingTextWidget(title: "Your ride will be delivered to the starting address you provided"),
                    // Container(
                    //   height: 50,
                    //   width: 90,
                    //   decoration: BoxDecoration(
                    //       color: Colors.white,
                    //       borderRadius: BorderRadius.all(Radius.circular(100))
                    //   ),
                    //   child: Padding(
                    //     padding: const EdgeInsets.symmetric(horizontal: 5,vertical: 5),
                    //     child: Center(
                    //       child: SubHeadingTextWidget(title: 'Edit',textColor: Colors.black54,fontWeight: FontWeight.bold,),
                    //     ),
                    //   ),
                    // ),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(height: 20,),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 17),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      border: Border.all(color: Colors.black54)
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20,horizontal: 20),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                HeadingTextWidget(title: 'Delivery'),
                                HeadingTextWidget(title: '*',textColor: Colors.red,),
                              ],
                            ),

                            Obx(() =>_checkBox(
                                state.isDelivery.value,
                                    (value) {
                              state.isDelivery.value = value;
                              if(value==true || state.isSelfPickup.value==true){
                                state.isSelfPickup.value=false;
                                controller.addInTotalPrice(AppConstants.deliveryCharges, false);
                              }
                              if(value==false){
                                controller.subtractFromTotalPrince(AppConstants.deliveryCharges, false);
                              }
                            }),),

                          ],),
                        SizedBox(height: 10,),
                        SubHeadingTextWidget(title: 'Home,Hotel, or other'),
                        SubHeadingTextWidget(title: 'address'),

                      ],
                    ),
                  ),
                )),
                SizedBox(width: 7,),
                // Expanded(child: Container(
                //   decoration: BoxDecoration(
                //       borderRadius: BorderRadius.all(Radius.circular(10)),
                //       border: Border.all(color: Colors.black54)
                //   ),
                //   child: Padding(
                //     padding: const EdgeInsets.symmetric(vertical: 20,horizontal: 20),
                //     child: Column(
                //       mainAxisAlignment: MainAxisAlignment.start,
                //       crossAxisAlignment: CrossAxisAlignment.start,
                //       children: [
                //         Row(
                //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //           children: [
                //             HeadingTextWidget(title: 'Self-Pickup'),
                //             Obx(() =>_checkBox(
                //                 state.isSelfPickup.value,
                //                   (value) {
                //
                //                   if(value==true){
                //                     if(state.isDelivery.value==true){
                //                       state.isDelivery.value=false;
                //                       controller.subtractFromTotalPrince(AppConstants.deliveryCharges, false);
                //                     }
                //                     state.isSelfPickup.value=value;
                //                   }
                //                   state.isSelfPickup.value=value;
                //
                //
                //               },
                //               ),  ),
                //
                //           ],),
                //         SizedBox(height: 10,),
                //         SubHeadingTextWidget(title: 'Meet at our lot and save on'),
                //         SubHeadingTextWidget(title: 'delivery fees'),
                //
                //       ],
                //     ),
                //   ),
                // )),

              ],
            ),
          ),
          SizedBox(height: 20,),
          controller.state.isDelivery.value==true ? Padding(
            padding: const EdgeInsets.symmetric(horizontal: 17),
            child: SubHeadingTextWidget(title: 'Be prepared to meet your surfer within 10 minutes of your scheduled delivery.'),
          ): Container(),
          SizedBox(height: 20,),
          // Divider(color: Colors.black54,),
          // SizedBox(height: 20,),
          //
          // SizedBox(height: 20,),








        ],
      ),
    ),
  ) :
  Container(
    decoration: BoxDecoration(
        border: Border.all(color: Colors.black54.withOpacity(.1)),
        borderRadius: BorderRadius.all(Radius.circular(10))
    ),
    child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 15,),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                HeadingTextWidget(title: '2. Trip Details',fontWeight: FontWeight.bold,fontSize: 30,),
                HeadingTextWidget(title: "*",fontSize: 30,textColor: Colors.red,),
              ],
            ),
          ),
          SizedBox(height: 15,),
          ListTile(
            leading: Icon(Icons.car_rental_outlined),
            title: HeadingTextWidget(title: '${AppConstants.vehicleType}',fontSize: 14,),
            subtitle: SubHeadingTextWidget(title: '${state.carDescription}',fontSize: 14,),
            // trailing: Container(
            //   height: 100,
            //   width: 90,
            //   decoration: BoxDecoration(
            //     color: Colors.grey.withOpacity(.1),
            //     borderRadius: BorderRadius.all(Radius.circular(100))
            //   ),
            //   child: Padding(
            //     padding: const EdgeInsets.symmetric(horizontal: 5,vertical: 5),
            //     child: Center(
            //       child: SubHeadingTextWidget(title: 'Edit',textColor: Colors.black54,fontWeight: FontWeight.bold,),
            //     ),
            //   ),
            // ),
          ),
          SizedBox(height: 15,),
          Divider(thickness: .5,),
          SizedBox(height: 15,),
          ListTile(
            leading: Icon(Icons.location_on),
            title: controller.state.isSelfPickup.value==true? HeadingTextWidget(title: '${AppConstants.pickUpLoc}',fontSize: 14,) : HeadingTextWidget(title: '${AppConstants.fromAddress}',fontSize: 14,),
            subtitle: Row(
              children: [
                SubHeadingTextWidget(title: '${AppConstants.fromDateName}, ${AppConstants.fromMonthName} ${AppConstants.fromDate}',fontSize: 13,),
                SubHeadingTextWidget(title: ' at ',fontSize: 13,),
                SubHeadingTextWidget(title: '${AppConstants.fromTime}',fontSize: 13,),
              ],
            ),
            // trailing: Container(
            //   height: 100,
            //   width: 90,
            //   decoration: BoxDecoration(
            //       color: Colors.grey.withOpacity(.1),
            //       borderRadius: BorderRadius.all(Radius.circular(100))
            //   ),
            //   child: Padding(
            //     padding: const EdgeInsets.symmetric(horizontal: 5,vertical: 5),
            //     child: Center(
            //       child: SubHeadingTextWidget(title: 'Edit',textColor: Colors.black54,fontWeight: FontWeight.bold,),
            //     ),
            //   ),
            // ),
          ),
          Padding(
            padding:  EdgeInsets.symmetric(horizontal: 10),
            child: Divider(thickness: .5,),
          ),
          ListTile(
            leading: Icon(Icons.location_on),
            title: controller.state.isDelivery.value ==true ? HeadingTextWidget(title: '${AppConstants.toAddress}',fontSize: 14,):HeadingTextWidget(title: '${AppConstants.pickUpLoc}',fontSize: 14,),
            subtitle: Row(
              children: [
                SubHeadingTextWidget(title: '${AppConstants.toDateName}, ${AppConstants.toMonthName} ${AppConstants.toDate}',fontSize: 13,),
                SubHeadingTextWidget(title: ' at ',fontSize: 13,),
                SubHeadingTextWidget(title: '${AppConstants.toTime}',fontSize: 13,),
              ],
            ),
            // trailing: Container(
            //   height: 100,
            //   width: 90,
            //   decoration: BoxDecoration(
            //       color: Colors.grey.withOpacity(.1),
            //       borderRadius: BorderRadius.all(Radius.circular(100))
            //   ),
            //   child: Padding(
            //     padding: const EdgeInsets.symmetric(horizontal: 5,vertical: 5),
            //     child: Center(
            //       child: SubHeadingTextWidget(title: 'Edit',textColor: Colors.black54,fontWeight: FontWeight.bold,),
            //     ),
            //   ),
            // ),
          ),

          SizedBox(height: 30,),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 0),
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  color: Colors.blue.withOpacity(.1)
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5,vertical: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    controller.state.isSelfPickup.value==true?  SubHeadingTextWidget(title: "Pick up your Kyte at our Parking lot in Boston",fontSize: 12,): SubHeadingTextWidget(title: "Your ride will be delivered to the starting address you provided",fontSize: 12,),
                    // Container(
                    //   height: 50,
                    //   width: 90,
                    //   decoration: BoxDecoration(
                    //       color: Colors.white,
                    //       borderRadius: BorderRadius.all(Radius.circular(100))
                    //   ),
                    //   child: Padding(
                    //     padding: const EdgeInsets.symmetric(horizontal: 5,vertical: 5),
                    //     child: Center(
                    //       child: SubHeadingTextWidget(title: 'Edit',textColor: Colors.black54,fontWeight: FontWeight.bold,),
                    //     ),
                    //   ),
                    // ),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(height: 20,),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      border: Border.all(color: Colors.black54)
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20,horizontal: 20),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                HeadingTextWidget(title: 'Delivery',fontSize: 14,),
                                HeadingTextWidget(title: '*',fontSize: 14,textColor: Colors.red,),
                              ],
                            ),
                            Obx(() =>_checkBox(
                                state.isDelivery.value,
                                    (value) {
                                  state.isDelivery.value = value;
                                  if(value==true || state.isSelfPickup.value==true){
                                    state.isSelfPickup.value=false;
                                    controller.addInTotalPrice(AppConstants.deliveryCharges, false);
                                  }
                                  if(value==false){
                                    controller.subtractFromTotalPrince(AppConstants.deliveryCharges, false);
                                  }
                                }),),

                          ],),
                        SizedBox(height: 10,),
                        SubHeadingTextWidget(title: 'Home,Hotel, or other',fontSize: 13,),
                        SubHeadingTextWidget(title: 'address',fontSize: 13,),

                      ],
                    ),
                  ),
                )),
                SizedBox(width: 7,),
                // Expanded(child: Container(
                //   decoration: BoxDecoration(
                //       borderRadius: BorderRadius.all(Radius.circular(10)),
                //       border: Border.all(color: Colors.black54)
                //   ),
                //   child: Padding(
                //     padding: const EdgeInsets.symmetric(vertical: 20,horizontal: 20),
                //     child: Column(
                //       mainAxisAlignment: MainAxisAlignment.start,
                //       crossAxisAlignment: CrossAxisAlignment.start,
                //       children: [
                //         Row(
                //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //           children: [
                //             HeadingTextWidget(title: 'Self-Pickup'),
                //             Obx(() =>_checkBox(
                //                 state.isSelfPickup.value,
                //                   (value) {
                //
                //                   if(value==true){
                //                     if(state.isDelivery.value==true){
                //                       state.isDelivery.value=false;
                //                       controller.subtractFromTotalPrince(AppConstants.deliveryCharges, false);
                //                     }
                //                     state.isSelfPickup.value=value;
                //                   }
                //                   state.isSelfPickup.value=value;
                //
                //
                //               },
                //               ),  ),
                //
                //           ],),
                //         SizedBox(height: 10,),
                //         SubHeadingTextWidget(title: 'Meet at our lot and save on'),
                //         SubHeadingTextWidget(title: 'delivery fees'),
                //
                //       ],
                //     ),
                //   ),
                // )),

              ],
            ),
          ),
          SizedBox(height: 20,),
          controller.state.isDelivery.value==true ? Padding(
            padding: const EdgeInsets.symmetric(horizontal: 17),
            child: SubHeadingTextWidget(title: 'Be prepared to meet your surfer within 10 minutes of your scheduled delivery.',fontSize: 12,),
          ): Container(),
          SizedBox(height: 20,),
          // Divider(color: Colors.black54,),
          // SizedBox(height: 20,),
          //
          // SizedBox(height: 20,),








        ],
      ),
    ),
  )

  );
}

Widget TripDetailsWidgetSmall(CheckOutCon controller){
  final state = CheckOutState();
  return Container(
    decoration: BoxDecoration(
        border: Border.all(color: Colors.black54.withOpacity(.1)),
        borderRadius: BorderRadius.all(Radius.circular(10))
    ),
    child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 15,),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              children: [
                HeadingTextWidget(title: '2. Trip Details',fontWeight: FontWeight.bold,fontSize: 23,),
                HeadingTextWidget(title: "*",fontSize: 30,textColor: Colors.red,),
              ],
            ),
          ),
          SizedBox(height: 15,),
          ListTile(
            leading: Icon(Icons.car_rental_outlined),
            title: HeadingTextWidget(title: '${AppConstants.vehicleType}',),
            subtitle: SubHeadingTextWidget(title: '${state.carDescription}',),
            // trailing: Container(
            //   height: 100,
            //   width: 90,
            //   decoration: BoxDecoration(
            //       color: Colors.grey.withOpacity(.1),
            //       borderRadius: BorderRadius.all(Radius.circular(100))
            //   ),
            //   child: Padding(
            //     padding: const EdgeInsets.symmetric(horizontal: 5,vertical: 5),
            //     // child: Center(
            //     //   child: SubHeadingTextWidget(title: 'Edit',textColor: Colors.black,fontWeight: FontWeight.bold,fontSize: 13,),
            //     // ),
            //     child: Container(),
            //   ),
            // ),
          ),
          SizedBox(height: 15,),
          Divider(thickness: .5,),
          SizedBox(height: 15,),
          ListTile(
            leading: Icon(Icons.location_on),
            title: controller.state.isSelfPickup.value==true? HeadingTextWidget(title: '${AppConstants.fromAddress}',) : HeadingTextWidget(title: '${AppConstants.fromAddress}',),
            subtitle: Row(
              children: [
                SubHeadingTextWidget(title: '${AppConstants.fromDateName}, ${AppConstants.fromMonthName} ${AppConstants.fromDate}'),
                SubHeadingTextWidget(title: ' at '),
                SubHeadingTextWidget(title: '${AppConstants.fromTime}'),
              ],
            ),
            // trailing: Container(
            //   height: 100,
            //   width: 90,
            //   decoration: BoxDecoration(
            //       color: Colors.grey.withOpacity(.1),
            //       borderRadius: BorderRadius.all(Radius.circular(100))
            //   ),
            //   child: Padding(
            //     padding: const EdgeInsets.symmetric(horizontal: 5,vertical: 5),
            //     child: Center(
            //       child: SubHeadingTextWidget(title: 'Edit',textColor: Colors.black54,fontWeight: FontWeight.bold,),
            //     ),
            //   ),
            // ),
          ),
          Padding(
            padding:  EdgeInsets.symmetric(horizontal: 10),
            child: Divider(thickness: .5,),
          ),
          ListTile(
            leading: Icon(Icons.location_on),
            title: controller.state.isDelivery.value ==true ? HeadingTextWidget(title: '${AppConstants.toAddress}',):HeadingTextWidget(title: '${AppConstants.toAddress}'),
            subtitle: Row(
              children: [
                SubHeadingTextWidget(title: '${AppConstants.toDateName}, ${AppConstants.toMonthName} ${AppConstants.toDate}'),
                SubHeadingTextWidget(title: ' at '),
                SubHeadingTextWidget(title: '${AppConstants.toTime}'),
              ],
            ),
            // trailing: Container(
            //   height: 100,
            //   width: 90,
            //   decoration: BoxDecoration(
            //       color: Colors.grey.withOpacity(.1),
            //       borderRadius: BorderRadius.all(Radius.circular(100))
            //   ),
            //   child: Padding(
            //     padding: const EdgeInsets.symmetric(horizontal: 5,vertical: 5),
            //     child: Center(
            //       child: SubHeadingTextWidget(title: 'Edit',textColor: Colors.black54,fontWeight: FontWeight.bold,),
            //     ),
            //   ),
            // ),
          ),
          // SizedBox(height: 20,),


          SizedBox(height: 30,),
          // Padding(
          //   padding: const EdgeInsets.symmetric(horizontal: 17),
          //   child: Container(
          //     decoration: BoxDecoration(
          //         borderRadius: BorderRadius.all(Radius.circular(10)),
          //         color: Colors.blue.withOpacity(.1)
          //     ),
          //     child: Padding(
          //       padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 20),
          //       child: Column(
          //         // mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //         crossAxisAlignment: CrossAxisAlignment.start,
          //         children: [
          //           SubHeadingTextWidget(title: "Provide the address you'd like the car to be delivered to",fontSize: 13,textColor: Colors.black,),
          //           SizedBox(
          //             height: 10,
          //           ),
          //           Container(
          //             height: 50,
          //             width: 70,
          //             decoration: BoxDecoration(
          //                 color: Colors.white,
          //                 borderRadius: BorderRadius.all(Radius.circular(10))
          //             ),
          //             child: Padding(
          //               padding: const EdgeInsets.symmetric(horizontal: 5,vertical: 5),
          //               child: Center(
          //                 child: SubHeadingTextWidget(title: 'Edit',fontSize: 13,textColor: Colors.black,fontWeight: FontWeight.bold,),
          //               ),
          //             ),
          //           ),
          //         ],
          //       ),
          //     ),
          //   ),
          // ),
          SizedBox(height: 20,),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 17),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [

                Container(
                  height: 100,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      border: Border.all(color: Colors.black54)
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 0,horizontal: 20),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Spacer(),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            HeadingTextWidget(title: 'Delivery',fontSize: 15,),
                            Obx(() =>_checkBox(
                                state.isDelivery.value,
                                    (value) {
                                  state.isDelivery.value = value;
                                  if(value==true || state.isSelfPickup.value==true){
                                    state.isSelfPickup.value=false;
                                    controller.addInTotalPrice(AppConstants.deliveryCharges, false);
                                  }
                                  if(value==false){
                                    controller.subtractFromTotalPrince(AppConstants.deliveryCharges, false);
                                  }
                                }),),
                          ],),

                        SizedBox(height: 10,),
                        SubHeadingTextWidget(title: 'Home,Hotel, or other address',fontSize: 13,textColor: Colors.black,),
                        Spacer(),

                      ],
                    ),
                  ),
                ),
                SizedBox(height: 20,),

                // Container(
                //   height: 100,
                //   decoration: BoxDecoration(
                //       borderRadius: BorderRadius.all(Radius.circular(10)),
                //       border: Border.all(color: Colors.black54)
                //   ),
                //   child: Padding(
                //     padding: const EdgeInsets.symmetric(vertical: 0,horizontal: 20),
                //     child: Column(
                //       mainAxisAlignment: MainAxisAlignment.start,
                //       crossAxisAlignment: CrossAxisAlignment.start,
                //       children: [
                //         Spacer(),
                //         Row(
                //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //           children: [
                //             HeadingTextWidget(title: 'Self-Pickup',fontSize: 15,),
                //             Obx(() =>_checkBox(state.isSelfPickup.value, (value) {
                //               state.isSelfPickup.value = value;
                //             }),),
                //
                //           ],),
                //         SizedBox(height: 10,),
                //         SubHeadingTextWidget(title: 'Meet at our lot and save on delivery fees',fontSize: 13,textColor: Colors.black,),
                //         Spacer(),
                //
                //       ],
                //     ),
                //   ),
                // ),

              ],
            ),
          ),
          SizedBox(height: 20,),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 17),
            child: SubHeadingTextWidget(title: 'Be prepared to meet your surfer within 10 minutes of your scheduled delivery.',fontSize: 13,textColor: Colors.black,),
          ),
          SizedBox(height: 20,),
          // Divider(color: Colors.black54,),
          // SizedBox(height: 20,),









        ],
      ),
    ),
  );
}

Widget _checkBox(bool val, ValueChanged<bool>? onChanged){
  return Checkbox(
      shape: ContinuousRectangleBorder(
          borderRadius: BorderRadius.circular(8),
          side: BorderSide(
              color: Colors.grey.withOpacity(.2),width: .8
          )
      ),
      visualDensity: VisualDensity.compact,
      value: val, onChanged: (bool? value) {
    onChanged?.call(value!);


  });}

