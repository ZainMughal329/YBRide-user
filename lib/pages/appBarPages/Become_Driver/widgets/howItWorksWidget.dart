
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../components/headingTextWidget.dart';
import '../../../../components/subHeadingText.dart';
import '../view.dart';

Widget HoeItWorks(){
  return
    Container(
      width: double.infinity,
      decoration: BoxDecoration(
          color: Colors.purple.withOpacity(.2)
      ),
      child: Column(
        children: [
          SizedBox(height: 50,),
          HeadingTextWidget(title: 'How it Works',fontWeight: FontWeight.bold,fontSize: 40,),
          SizedBox(height: 70,),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal:170),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CardWidget(image: 'assets/images/cars.webp',
                      subHeading: 'Earn when you choose. Easily select trips based on time, location and earnings amount.',),

                  ],)),
                SizedBox(width: 50,),
                Expanded(child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CardWidget(image: 'assets/images/mobile.webp',
                      subHeading: "Start by delivering a car from our lot or by picking up a car at a customer's address.",),

                  ],)),
                SizedBox(width: 50,),
                Expanded(child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,

                  children: [
                    CardWidget(image: 'assets/images/Couple.webp',
                      subHeading: "End by delivering the car to the customer or returning a car to our lot. It's easy!",),
                  ],)),
              ],
            ),
          ),
          SizedBox(height: 50,),
          reuseableButton('SignUp Now', () {
          }),
          SizedBox(height: 50,),


        ],
      ),
    );

}

class CardWidget extends StatefulWidget {
  final String image;
  String? heading;
  final String subHeading;
  CardWidget({super.key,
    required this.image,
    this.heading='',required this.subHeading});
  @override
  State<CardWidget> createState() => _CardWidgetState();
}
class _CardWidgetState extends State<CardWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: 250,
          width: 450,
          decoration: BoxDecoration(
            image: DecorationImage(image: AssetImage(widget.image),fit: BoxFit.fill),
            // color: Colors.blue,
            shape: BoxShape.circle
          ),
        ),
        SizedBox(height: 20,),
        HeadingTextWidget(title:widget.heading ?? '',),
        SizedBox(height: 20,),
        SubHeadingTextWidget(title:widget.subHeading)
      ],
    );
  }
}
