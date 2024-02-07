import 'package:flutter/cupertino.dart';

import '../../../../components/headingTextWidget.dart';
import '../../../../components/subHeadingText.dart';

Widget WhyEarnWithYBRide(){
  return
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
                heading: 'Earn More, Quickly',
                subHeading: 'With YBRide, you can complete up to 12 trips per day! Earn more per trip, our rates are above industry average.',),

            ],)),
          SizedBox(width: 50,),
          Expanded(child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CardWidget(image: 'assets/images/mobile.webp',
                heading: 'No Car Needed',
                subHeading: "Forget about maintenance costs with a personal vehicle. With YBRide, you don't need a car to start earning!",),

            ],)),
          SizedBox(width: 50,),
          Expanded(child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,

            children: [
              CardWidget(image: 'assets/images/Couple.webp',
                heading: 'Plan Your Trips Ahead',
                subHeading: "Select trips and plan your schedule a week in advance to secure your earnings! ",),
            ],)),
        ],
      ),
    );

}
Widget WhyEarnWithYBRideSmall(){
  return
    Padding(
      padding: const EdgeInsets.symmetric(horizontal:100),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CardWidgetSmall(image: 'assets/images/cars.webp',
            heading: 'Earn More, Quickly',
            subHeading: 'With YBRide, you can complete up to 12 trips per day! Earn more per trip, our rates are above industry average.',),
          SizedBox(height: 30,),
          CardWidgetSmall(image: 'assets/images/mobile.webp',
            heading: 'No Car Needed',
            subHeading: "Forget about maintenance costs with a personal vehicle. With YBRide, you don't need a car to start earning!",),
          SizedBox(height: 30,),
          CardWidgetSmall(image: 'assets/images/Couple.webp',
            heading: 'Plan Your Trips Ahead',
            subHeading: "Select trips and plan your schedule a week in advance to secure your earnings! ",),
        ],
      ),
    );

}

class CardWidgetSmall extends StatelessWidget {

  final String image;
  final String heading;
  final String subHeading;
  CardWidgetSmall({super.key, required this.image, required this.subHeading, required this.heading});

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
        HeadingTextWidget(title:heading ?? '',fontSize: 16,),
        SizedBox(height: 20,),
        SubHeadingTextWidget(title:subHeading,textAlign: TextAlign.center,fontSize: 14,)
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
            // shape: BoxShape.circle,
            image: DecorationImage(image: AssetImage(widget.image),fit: BoxFit.fill),
            // color: Colors.blue,
            borderRadius:
            BorderRadius.all(Radius.circular(10)),
          ),
        ),
        SizedBox(height: 40,),
        HeadingTextWidget(title:widget.heading ?? '',),
        SizedBox(height: 20,),
        SubHeadingTextWidget(title:widget.subHeading)
      ],
    );
  }
}
