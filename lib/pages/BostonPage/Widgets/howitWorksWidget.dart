
import 'package:flutter/cupertino.dart';

import '../../../components/headingTextWidget.dart';
import '../../../components/subHeadingText.dart';

Widget HowitWorks(){
  return Padding(
    padding: const EdgeInsets.all(64.0),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CardWidget(image: 'assets/images/location.png', heading: '1. Tell Us Where & When',
              subHeading: 'You decide where and when your new and clean rental car will be delivered and picked up — Search an address to get started.',),

          ],)),
        SizedBox(width: 50,),
        Expanded(child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CardWidget(image: 'assets/images/thunder.png', heading: '2. We Deliver and Pick Up Your YBRide',
              subHeading: 'Easy and convenient hand-off. We will text you updates with our ETA. We will also refuel the car for you.',),

          ],)),
        SizedBox(width: 50,),
        Expanded(child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,

          children: [
            CardWidget(image: 'assets/images/purple-calendar-11010.png', heading: '3. Flexibility to Adjust or Cancel',
              subHeading: "We know plans change — you can adjust the delivery and pickup locations or times without hassle.",),
          ],)),
      ],
    ),
  );
}

Widget HowitWorksSmall(){
  return Padding(
    padding: const EdgeInsets.all(50.0),
    child: Column(
      children: [
        CardWidgetSmall(image: 'assets/images/location.png', heading: '1. Tell Us Where & When',
          subHeading: 'You decide where and when your new and clean rental car will be delivered and picked up — Search an address to get started.',),
        SizedBox(height: 60,),
        CardWidgetSmall(image: 'assets/images/thunder.png', heading: '2. We Deliver and Pick Up Your YBRide',
          subHeading: 'Easy and convenient hand-off. We will text you updates with our ETA. We will also refuel the car for you.',),
        SizedBox(height: 60,),
        CardWidgetSmall(image: 'assets/images/purple-calendar-11010.png', heading: '3. Flexibility to Adjust or Cancel',
          subHeading: "We know plans change — you can adjust the delivery and pickup locations or times without hassle.",),
      ],
    ),
  );
}



class CardWidgetSmall extends StatelessWidget {

  final String image;
  final String heading;
  final String subHeading;
  const CardWidgetSmall({super.key, required this.image, required this.heading, required this.subHeading});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            height: 60,
            width: 60,
            decoration: BoxDecoration(
              image: DecorationImage(image: AssetImage(image),fit: BoxFit.fill),
              // color: Colors.blue,
              borderRadius:
              BorderRadius.all(Radius.circular(20)),
            ),
          ),
          SizedBox(height: 20,),
          HeadingTextWidget(title:heading,textAlign: TextAlign.center,),
          SizedBox(height: 20,),
          SubHeadingTextWidget(title:subHeading,textAlign: TextAlign.center)
        ],
      ),
    );
  }
}


class CardWidget extends StatefulWidget {
  final String image;
  final String heading;
  final String subHeading;
  CardWidget({super.key,
    required this.image,
    required this.heading,required this.subHeading});
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
          height: 180,
          width: 230,
          decoration: BoxDecoration(
            image: DecorationImage(image: AssetImage(widget.image),fit: BoxFit.fill),
            // color: Colors.blue,
            borderRadius:
            BorderRadius.all(Radius.circular(20)),
          ),
        ),
        SizedBox(height: 20,),
        HeadingTextWidget(title:widget.heading,),
        SizedBox(height: 20,),
        SubHeadingTextWidget(title:widget.subHeading)
      ],
    );
  }
}
