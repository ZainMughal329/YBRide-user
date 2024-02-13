


import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yb_ride_user_web/components/headingTextWidget.dart';
import 'package:yb_ride_user_web/components/subHeadingText.dart';
import 'package:yb_ride_user_web/helper/appColors.dart';
import 'Faqs/GettingStarted/view.dart';

Widget ContainerFaqs(){

  return Material(
    child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 150),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // SizedBox(height: 10,),
          Row(
            children: [
              Expanded(child: ReusebaleContainer(
              'Getting Started','Articles',Icons.star,(){
                Get.to(()=>GettingStartedPage(colName: 'gettingStarted', appBarName: 'Getting Started',));

              }
              )),
              SizedBox(width: 20,),
              Expanded(child: ReusebaleContainer(
                'Booking Charges & Cancellation','Articles',Icons.edit_note,
                      (){
                        Get.to(()=>GettingStartedPage(colName: 'bookingChanges', appBarName: 'Booking Charges & Cancellation',));

                  }
              ))
            ],
          ),
          SizedBox(height: 20,),
          Row(
            children: [
              Expanded(child: ReusebaleContainer(
                'Delivery & Return','Articles',Icons.location_on,
                      (){
                        Get.to(()=>GettingStartedPage(colName: 'deliveryReturn', appBarName: 'Delivery & Return',));


                  }
              )),
              SizedBox(width: 20,),
              Expanded(child: ReusebaleContainer(
                'Deposits, Charges,Payment & Referrals','Articles',Icons.money_rounded,
                      (){
                        Get.to(()=>GettingStartedPage(colName: 'deposits', appBarName: 'Charges,Payment & Referrals',));

                  }
              ))
            ],
          ),
          SizedBox(height: 20,),
          Row(
            children: [
              Expanded(child: ReusebaleContainer('Electric Vehicles (EV)','Articles',Icons.flash_on,(){
                Get.to(()=>GettingStartedPage(colName: 'electricVehicles', appBarName: 'Electric Vehicles (EV)',));

              })),
              SizedBox(width: 20,),
              Expanded(child: ReusebaleContainer('Insurance , Accidents & Incidents','Articles',Icons.article_outlined,
                      (){
                        Get.to(()=>GettingStartedPage(colName: 'insurance', appBarName: 'Insurance , Accidents & Incidents',));


                  }
              ))
            ],
          ),
          SizedBox(height: 20,),
          Row(
            children: [
              Expanded(child: ReusebaleContainer('Self PickUp and Return','Articles',Icons.location_on,(){

                Get.to(()=>GettingStartedPage(colName: 'selfPickup', appBarName: 'Self PickUp and Return',));

              })),
              SizedBox(width: 20,),
              Expanded(child: ReusebaleContainer('Vehicles & Equipment','Articles',Icons.car_crash,(){
                Get.to(()=>GettingStartedPage(colName: 'vehiclesEquipments', appBarName: 'Vehicles & Equipment',));

              }))
            ],
          ),
          SizedBox(height: 20,),
          Padding(
            padding: const EdgeInsets.only(right: 540),
            child: ReusebaleContainer('Verification & Driver Requirements', 'Articles', Icons.person,(){
              Get.to(()=>GettingStartedPage(colName: 'verification', appBarName: 'Verification & Driver Requirements',));

            }),
          )

        ],
      ),
    ),
  );
}

Widget ContainerFaqsSmall(){

  return Material(
    child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // SizedBox(height: 10,),
          ReusebaleContainer(
              'Getting Started','Articles',Icons.star,(){
            Get.to(()=>GettingStartedPage(colName: 'gettingStarted', appBarName: 'Getting Started',));

          }
          ),
          SizedBox(height: 20,),
          ReusebaleContainer(
              'Booking Charges & Cancellation','Articles',Icons.edit_note,
                  (){
                    Get.to(()=>GettingStartedPage(colName: 'bookingChanges', appBarName: 'Booking Charges & Cancellation',));

              }
          ),
          SizedBox(height: 20,),
          ReusebaleContainer(
              'Delivery & Return','Articles',Icons.location_on,
                  (){
                    Get.to(()=>GettingStartedPage(colName: 'deliveryReturn', appBarName: 'Delivery & Return',));


              }
          ),
          SizedBox(height: 20,),
          ReusebaleContainer(
              'Deposits, Charges,Payment & Referrals','Articles',Icons.money_rounded,
                  (){
                    Get.to(()=>GettingStartedPage(colName: 'deposits', appBarName: 'Charges,Payment & Referrals',));

              }
          ),
          SizedBox(height: 20,),
          ReusebaleContainer('Electric Vehicles (EV)','Articles',Icons.flash_on,(){
            Get.to(()=>GettingStartedPage(colName: 'electricVehicles', appBarName: 'Electric Vehicles (EV)',));

          }),
          SizedBox(height: 20,),
          ReusebaleContainer('Insurance , Accidents & Incidents','Articles',Icons.article_outlined,
                  (){
                    Get.to(()=>GettingStartedPage(colName: 'insurance', appBarName: 'Insurance , Accidents & Incidents',));


              }
          ),
          SizedBox(height: 20,),
          ReusebaleContainer('Self PickUp and Return','Articles',Icons.location_on,(){

            Get.to(()=>GettingStartedPage(colName: 'selfPickup', appBarName: 'Self PickUp and Return',));

          }),
          SizedBox(height: 20,),
          ReusebaleContainer('Vehicles & Equipment','Articles',Icons.car_crash,(){
            Get.to(()=>GettingStartedPage(colName: 'vehiclesEquipments', appBarName: 'Vehicles & Equipment',));

          }),
          SizedBox(height: 20,),
          ReusebaleContainer('Verification & Driver Requirements', 'Articles', Icons.person,(){
            Get.to(()=>GettingStartedPage(colName: 'verification', appBarName: 'Verification & Driver Requirements',));

          })

        ],
      ),
    ),
  );
}




Widget ReusebaleContainer(String title,String subTitle,IconData icon,VoidCallback ontap){

  return InkWell(
    onTap:ontap,
    child: Container(
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(10)),
        border: Border.all(color: Colors.black54)
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25,vertical: 25),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(icon, color: AppColors.buttonColor,size: 35,),
            SizedBox(height: 20,),
            HeadingTextWidget(title: title),
            SizedBox(height: 20,),
            SubHeadingTextWidget(title: subTitle),
            SizedBox(height: 10,)

          ],
        ),
      ),
    ),
  );
}