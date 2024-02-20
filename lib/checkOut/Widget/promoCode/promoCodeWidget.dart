


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yb_ride_user_web/checkOut/Widget/promoCode/promoCodeBottomSheet.dart';
import 'package:yb_ride_user_web/checkOut/controller.dart';

import '../../../components/headingTextWidget.dart';
import '../../../components/subHeadingText.dart';

Widget promoCodeWidget(BuildContext context,CheckOutCon cont){

  return ListTile(
    leading: Icon(Icons.done_all_outlined),
    title: HeadingTextWidget(title: "Promo Code"),
    trailing:
    Obx((){
      return cont.state.promoCodeapplied.value == false ? GestureDetector(
        onTap: (){
          promoCodeBottomSheet(context,cont);
        },
        child: Container(
          height: 80,
          width: 90,
          decoration: BoxDecoration(
              color: Colors.grey.withOpacity(.1),
              borderRadius: BorderRadius.all(Radius.circular(100))
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5,vertical: 5),
            child: Center(
              child: SubHeadingTextWidget(title: 'Add',textColor: Colors.black54,fontWeight: FontWeight.bold,),
            ),
          ),
        ),
      )
          : Container(
        height: 80,
        // width: 90,
        decoration: BoxDecoration(
            color: Colors.grey.withOpacity(.1),
            borderRadius: BorderRadius.all(Radius.circular(100))
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5,vertical: 5),
          child: Center(
            child: SubHeadingTextWidget(title: 'Promo Code Applied -\$${cont.state.promoDiscount.value}',textColor: Colors.green,fontWeight: FontWeight.bold,),
          ),
        ),
      )
      ;
    },),

  );
}