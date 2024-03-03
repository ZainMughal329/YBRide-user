


import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yb_ride_user_web/checkOut/controller.dart';
import 'package:yb_ride_user_web/components/headingTextWidget.dart';
import 'package:yb_ride_user_web/components/subHeadingText.dart';
import 'package:yb_ride_user_web/helper/AppConstants.dart';

Widget priceContainerWidget(CheckOutCon controller){
  return  Container(
    decoration: BoxDecoration(
      borderRadius: BorderRadius.all(Radius.circular(10)),
      // color: Colors.grey
      border: Border.all(color: Colors.black54.withOpacity(.1)),
      // boxShadow: [
      //   BoxShadow(color: Colors.black54)
      // ]
    ),
    child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Image(image: AssetImage('assets/images/7_seater-3.webp'),height: 180,width: 270,),
              SizedBox(width: 30,),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  HeadingTextWidget(title: AppConstants.vehicleType),
                  Row(
                    children: [
                      SubHeadingTextWidget(title: '${AppConstants.rentDays} days'),
                      SizedBox(width: 7,),
                      SubHeadingTextWidget(title: '.'),
                      SizedBox(width: 7,),
                      SubHeadingTextWidget(title: '${AppConstants.fromMonthName} ${AppConstants.fromDate}'),
                      SizedBox(width: 7,),
                      SubHeadingTextWidget(title: '-'),
                      SizedBox(width: 7,),
                      SubHeadingTextWidget(title: '${AppConstants.toMonthName} ${AppConstants.toDate}'),

                    ],
                  )
                  

                ],
              ),
            ],
          ),
          SizedBox(height: 30,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SubHeadingTextWidget(title: 'Your YBRide'),
              SubHeadingTextWidget(title: '\$'+'${controller.state.carPricePerDay} * ${AppConstants.rentDays} days'),


            ],
          ),
          SizedBox(height: 30,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SubHeadingTextWidget(title: 'Sales tax'),
              SubHeadingTextWidget(title: 'will be calculated during payment',textColor: Colors.red,),
            ],
          ),
          SizedBox(height: 10,),
          Obx(() => controller.state.isDriverAge.value==true ? Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SubHeadingTextWidget(title: 'Under 25 years fee'),
              SubHeadingTextWidget(title: '\$'+'${controller.state.licenseFee} * ${AppConstants.rentDays} days'),
            ],
          ) : Container(),),
          SizedBox(height: 30,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              HeadingTextWidget(title: 'Total'),
              Obx(() =>SubHeadingTextWidget(title: '\$'+'${controller.state.totalPrice.value}'),),
            ],
          ),
          SizedBox(height: 30,),
          Row(
            children: [
              Icon(Icons.emoji_emotions_outlined),
              SizedBox(width: 20,),
              SubHeadingTextWidget(title: "Weekday savings included, you're getting a great deal.")
            ],
          ),
          SizedBox(height: 30,),

          Row(
            children: [
              Icon(Icons.done),
              SizedBox(width: 20,),
              Column(
                children: [
                  Row(
                    children: [
                      HeadingTextWidget(title: 'Free Cancellation ',fontSize: 16,),
                      SubHeadingTextWidget(title: 'with-in '),
                      HeadingTextWidget(title: '2-days',fontSize: 16,),
                      SubHeadingTextWidget(title: '. Cancel at least 24 hours'),




                    ],
                  ),
                  SubHeadingTextWidget(title: "in advance for a full refund in the form of YBRide Credits")
                ],
              )

            ],
          ),
        ],
      ),
    ),
  );
}

Widget priceContainerWidgetSmall(CheckOutCon controller){
  return  Container(
    decoration: BoxDecoration(
      borderRadius: BorderRadius.all(Radius.circular(10)),
      // color: Colors.grey
      border: Border.all(color: Colors.black54.withOpacity(.1)),
      // boxShadow: [
      //   BoxShadow(color: Colors.black54)
      // ]
    ),
    child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Image(image: AssetImage('assets/images/7_seater-3.webp'),height: 90,width: 130,),
              SizedBox(width: 30,),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  HeadingTextWidget(title: AppConstants.vehicleType,fontSize: 15,),
                  Row(
                    children: [
                      SubHeadingTextWidget(title: '${AppConstants.rentDays} days',fontSize: 13,),
                      SizedBox(width: 7,),
                      SubHeadingTextWidget(title: '.'),
                      SizedBox(width: 7,),
                      SubHeadingTextWidget(title: '${AppConstants.fromMonthName} ${AppConstants.fromDate}',fontSize: 13),
                      SizedBox(width: 7,),
                      SubHeadingTextWidget(title: '-',fontSize: 13),
                      SizedBox(width: 7,),
                      SubHeadingTextWidget(title: '${AppConstants.toMonthName} ${AppConstants.toDate}',fontSize: 13),

                    ],
                  )


                ],
              ),
            ],
          ),
          SizedBox(height: 30,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SubHeadingTextWidget(title: 'Your YBRide'),
              SubHeadingTextWidget(title: '\$'+'${controller.state.carPricePerDay} * ${AppConstants.rentDays} days'),


            ],
          ),
          SizedBox(height: 30,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SubHeadingTextWidget(title: 'Sales tax',fontSize: 13,textColor: Colors.black,),
              SubHeadingTextWidget(title: 'Will be calculated during payment',fontSize: 13,textColor: Colors.red,),
            ],
          ),
          SizedBox(height: 30,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              HeadingTextWidget(title: 'Total'),
              Obx(() =>SubHeadingTextWidget(title: '\$'+'${controller.state.totalPrice.value}',fontSize: 13,),),
            ],
          ),
          SizedBox(height: 30,),
          Row(
            children: [
              Icon(Icons.emoji_emotions_outlined),
              SizedBox(width: 20,),
              Flexible(child: SubHeadingTextWidget(title: "Weekday savings included, you're getting a great deal.",fontSize: 13,textColor: Colors.black,))
            ],
          ),
          SizedBox(height: 30,),

          Row(
            children: [
              Icon(Icons.done),
              SizedBox(width: 20,),
              Column(
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      HeadingTextWidget(title: 'Free Cancellation ',fontSize: 13,),
                      SubHeadingTextWidget(title: 'with-in ',fontSize: 13,textColor: Colors.black,),
                      HeadingTextWidget(title: '2-days.',fontSize: 13,),
                      SubHeadingTextWidget(title: '.\nCancel at least 24 hours',fontSize: 13,textColor: Colors.black,),




                    ],
                  ),
                  SubHeadingTextWidget(title: "in advance for a full refund in the form of YBRide Credits",fontSize: 13,textColor: Colors.black,)
                ],
              )

            ],
          ),
        ],
      ),
    ),
  );
}