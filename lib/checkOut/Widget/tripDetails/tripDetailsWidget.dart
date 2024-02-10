

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yb_ride_user_web/checkOut/state.dart';
import 'package:yb_ride_user_web/components/headingTextWidget.dart';
import 'package:yb_ride_user_web/components/subHeadingText.dart';
import 'package:yb_ride_user_web/components/textField.dart';

import '../../../components/countryCodeTextField.dart';

Widget TripDetailsWidget(){
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
            child: HeadingTextWidget(title: '2. Trip Details',fontWeight: FontWeight.bold,fontSize: 30,),
          ),
          SizedBox(height: 15,),
          ListTile(
            leading: Icon(Icons.car_rental_outlined),
            title: HeadingTextWidget(title: 'SUV',),
            subtitle: SubHeadingTextWidget(title: 'Hyundai Tucson . 5 seats',),
            trailing: Container(
              height: 100,
              width: 90,
              decoration: BoxDecoration(
                color: Colors.grey.withOpacity(.1),
                borderRadius: BorderRadius.all(Radius.circular(100))
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5,vertical: 5),
                child: Center(
                  child: SubHeadingTextWidget(title: 'Edit',textColor: Colors.black54,fontWeight: FontWeight.bold,),
                ),
              ),
            ),
          ),
          SizedBox(height: 15,),
          Divider(thickness: .5,),
          SizedBox(height: 15,),
          ListTile(
            leading: Icon(Icons.location_on),
            title: HeadingTextWidget(title: 'Tokyo,DC',),
            subtitle: Row(
              children: [
                SubHeadingTextWidget(title: 'Fri'),
                SubHeadingTextWidget(title: ', '),
                SubHeadingTextWidget(title: 'Feb'+' '),
                SubHeadingTextWidget(title: '23'),
                SubHeadingTextWidget(title: ' at '),
                SubHeadingTextWidget(title: '10.00 AM'),
              ],
            ),
            trailing: Container(
              height: 100,
              width: 90,
              decoration: BoxDecoration(
                  color: Colors.grey.withOpacity(.1),
                  borderRadius: BorderRadius.all(Radius.circular(100))
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5,vertical: 5),
                child: Center(
                  child: SubHeadingTextWidget(title: 'Edit',textColor: Colors.black54,fontWeight: FontWeight.bold,),
                ),
              ),
            ),
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
                    SubHeadingTextWidget(title: "Provide the address you'd like the car to be delivered to"),
                    Container(
                      height: 50,
                      width: 90,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(100))
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 5,vertical: 5),
                        child: Center(
                          child: SubHeadingTextWidget(title: 'Edit',textColor: Colors.black54,fontWeight: FontWeight.bold,),
                        ),
                      ),
                    ),
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
                            HeadingTextWidget(title: 'Delivery'),
                            Obx(() =>_checkBox(state.isDelivery.value, (value) {
                              state.isDelivery.value = value;
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
                          HeadingTextWidget(title: 'Self-Pickup'),
                          Obx(() =>_checkBox(state.isSelfPickup.value, (value) {
                            state.isSelfPickup.value = value;
                          }),),

                        ],),
                        SizedBox(height: 10,),
                        SubHeadingTextWidget(title: 'Meet at our lot and save on'),
                        SubHeadingTextWidget(title: 'delivery fees'),

                      ],
                    ),
                  ),
                )),

              ],
            ),
          ),
          SizedBox(height: 20,),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 17),
            child: SubHeadingTextWidget(title: 'Be prepared to meet your surfer within 10 minutes of your scheduled delivery.'),
          ),
          SizedBox(height: 20,),
          Divider(color: Colors.black54,),
          SizedBox(height: 20,),
          ListTile(
            leading: Icon(Icons.location_on),
            title: HeadingTextWidget(title: 'Tokyo,DC',),
            subtitle: Row(
              children: [
                SubHeadingTextWidget(title: 'Fri'),
                SubHeadingTextWidget(title: ', '),
                SubHeadingTextWidget(title: 'Feb'+' '),
                SubHeadingTextWidget(title: '23'),
                SubHeadingTextWidget(title: ' at '),
                SubHeadingTextWidget(title: '10.00 AM'),
              ],
            ),
            trailing: Container(
              height: 100,
              width: 90,
              decoration: BoxDecoration(
                  color: Colors.grey.withOpacity(.1),
                  borderRadius: BorderRadius.all(Radius.circular(100))
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5,vertical: 5),
                child: Center(
                  child: SubHeadingTextWidget(title: 'Edit',textColor: Colors.black54,fontWeight: FontWeight.bold,),
                ),
              ),
            ),
          ),
          SizedBox(height: 20,),








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

