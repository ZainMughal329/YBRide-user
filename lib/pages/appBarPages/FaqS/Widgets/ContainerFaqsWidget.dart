


import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yb_ride_user_web/components/headingTextWidget.dart';
import 'package:yb_ride_user_web/components/subHeadingText.dart';
import 'package:yb_ride_user_web/helper/appColors.dart';

import 'Faqs/Booking Chnages & Cancellation/view.dart';
import 'Faqs/Delivery  & Return/view.dart';
import 'Faqs/Deposit,Charges & Referrals/view.dart';
import 'Faqs/Electric Vehicles (EV)/view.dart';
import 'Faqs/GettingStarted/view.dart';
import 'Faqs/Insurance & Accidents/view.dart';
import 'Faqs/Self & PickUp and Retuern/view.dart';
import 'Faqs/Vehicles & Equipments/view.dart';
import 'Faqs/Verification & Drivers Requirements/view.dart';

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
              'Getting Started','9 articles',Icons.star,(){
                Get.to(()=>GettingStartedPage());

              }
              )),
              SizedBox(width: 20,),
              Expanded(child: ReusebaleContainer(
                'Booking Charges & Cancellation','4 articles',Icons.edit_note,
                      (){
                  Get.to(()=>BookingandCancellationPage());

                  }
              ))
            ],
          ),
          SizedBox(height: 20,),
          Row(
            children: [
              Expanded(child: ReusebaleContainer(
                'Delivery & Return','29 articles',Icons.location_on,
                      (){
                        Get.to(()=>deliveryandReturnPage());


                  }
              )),
              SizedBox(width: 20,),
              Expanded(child: ReusebaleContainer(
                'Deposits, Charges,Payment & Referrals','11 articles',Icons.money_rounded,
                      (){
                        Get.to(()=>DepositandReferralsPage());

                  }
              ))
            ],
          ),
          SizedBox(height: 20,),
          Row(
            children: [
              Expanded(child: ReusebaleContainer('Electric Vehicles (EV)','13 articles',Icons.flash_on,(){
                Get.to(()=>EVPage());

              })),
              SizedBox(width: 20,),
              Expanded(child: ReusebaleContainer('Insurance , Accidents & Incidents','20 articles',Icons.article_outlined,
                      (){
                        Get.to(()=>insuranceandAccidentspPage());


                  }
              ))
            ],
          ),
          SizedBox(height: 20,),
          Row(
            children: [
              Expanded(child: ReusebaleContainer('Self PickUp and Return','12 articles',Icons.location_on,(){

                Get.to(()=>SelfandPickUpPage());

              })),
              SizedBox(width: 20,),
              Expanded(child: ReusebaleContainer('Vehicles & Equipment','6 articles',Icons.car_crash,(){
                Get.to(()=>VehicleandEquipmentPage());

              }))
            ],
          ),
          SizedBox(height: 20,),
          Padding(
            padding: const EdgeInsets.only(right: 540),
            child: ReusebaleContainer('Verification & Driver Requirements', '8 articles', Icons.person,(){
              Get.to(()=>VerificationandDriverPage());

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
              'Getting Started','9 articles',Icons.star,(){
            Get.to(()=>GettingStartedPage());

          }
          ),
          SizedBox(height: 20,),
          ReusebaleContainer(
              'Booking Charges & Cancellation','4 articles',Icons.edit_note,
                  (){
                Get.to(()=>BookingandCancellationPage());

              }
          ),
          SizedBox(height: 20,),
          ReusebaleContainer(
              'Delivery & Return','29 articles',Icons.location_on,
                  (){
                Get.to(()=>deliveryandReturnPage());


              }
          ),
          SizedBox(height: 20,),
          ReusebaleContainer(
              'Deposits, Charges,Payment & Referrals','11 articles',Icons.money_rounded,
                  (){
                Get.to(()=>DepositandReferralsPage());

              }
          ),
          SizedBox(height: 20,),
          ReusebaleContainer('Electric Vehicles (EV)','13 articles',Icons.flash_on,(){
            Get.to(()=>EVPage());

          }),
          SizedBox(height: 20,),
          ReusebaleContainer('Insurance , Accidents & Incidents','20 articles',Icons.article_outlined,
                  (){
                Get.to(()=>insuranceandAccidentspPage());


              }
          ),
          SizedBox(height: 20,),
          ReusebaleContainer('Self PickUp and Return','12 articles',Icons.location_on,(){

            Get.to(()=>SelfandPickUpPage());

          }),
          SizedBox(height: 20,),
          ReusebaleContainer('Vehicles & Equipment','6 articles',Icons.car_crash,(){
            Get.to(()=>VehicleandEquipmentPage());

          }),
          SizedBox(height: 20,),
          ReusebaleContainer('Verification & Driver Requirements', '8 articles', Icons.person,(){
            Get.to(()=>VerificationandDriverPage());

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