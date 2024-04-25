
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../components/headingTextWidget.dart';
import '../../../../components/subHeadingText.dart';
import '../SignUpForm.dart';
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
                    CardWidget(image: 'assets/goldenCar.jpg',
                      subHeading: 'Earn when you choose. Easily select trips based on time, location and earnings amount.',),

                  ],)),
                SizedBox(width: 50,),
                Expanded(child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CardWidget(image: 'assets/purpleCar1.webp',
                      subHeading: "Start by delivering a car from our lot or by picking up a car at a customer's address.",),

                  ],)),
                SizedBox(width: 50,),
                Expanded(child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,

                  children: [
                    CardWidget(image: 'assets/blueCar.jpg',
                      subHeading: "End by delivering the car to the customer or returning a car to our lot. It's easy!",),
                  ],)),
              ],
            ),
          ),
          SizedBox(height: 50,),
          reuseableButton('SignUp Now', () {
            Get.to(()=>SurferSignUpForm(),transition: Transition.rightToLeft,duration: Duration(milliseconds: 600));

          }),
          SizedBox(height: 50,),


        ],
      ),
    );

}

Widget HoeItWorksSmall(){
  return
    Container(
      width: double.infinity,
      decoration: BoxDecoration(
          color: Colors.purple.withOpacity(.2)
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 100),
        child: Column(
          children: [
            SizedBox(height: 50,),
            HeadingTextWidget(title: 'How it Works',fontWeight: FontWeight.bold,fontSize: 20,),
            SizedBox(height: 70,),
            CardWidgetSmall(image: 'assets/goldenCar.jpg',
              subHeading: 'Earn when you choose. Easily select trips based on time, location and earnings amount.',),
            SizedBox(height: 30,),
            CardWidgetSmall(image: 'assets/purpleCar1.webp',
              subHeading: "Start by delivering a car from our lot or by picking up a car at a customer's address.",),
            SizedBox(height: 30,),
            CardWidgetSmall(image: 'assets/blueCar.jpg',
              subHeading: "End by delivering the car to the customer or returning a car to our lot. It's easy!",),
            SizedBox(height: 50,),
            reuseableButton('SignUp Now', () {
              Get.to(()=>SurferSignUpForm(),transition: Transition.rightToLeft,duration: Duration(milliseconds: 600));
            }),
            SizedBox(height: 50,),


          ],
        ),
      ),
    );

}

class CardWidgetSmall extends StatelessWidget {

  final String image;
  String? heading;
  final String subHeading;
  CardWidgetSmall({super.key, required this.image, required this.subHeading});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          height: 200,
          width: 200,
          decoration: BoxDecoration(
              image: DecorationImage(image: AssetImage(image),fit: BoxFit.fill),
              // color: Colors.blue,
              shape: BoxShape.circle
          ),
        ),
        SizedBox(height: 20,),
        HeadingTextWidget(title:heading ?? '',),
        SizedBox(height: 20,),
        SubHeadingTextWidget(title:subHeading,textAlign: TextAlign.center,)
      ],
    );
  }
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
