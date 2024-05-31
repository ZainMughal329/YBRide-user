

import 'package:flutter/cupertino.dart';

import '../../components/headingTextWidget.dart';
import '../../components/subHeadingText.dart';

Widget CarTypes(){
  return Padding(
    padding: const EdgeInsets.all(32.0),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CardWidget(image: 'assets/images/cars.webp', heading: 'Economy',
              subHeading: 'Toyota Corolla or similar',),

          ],)),
        SizedBox(width: 50,),
        Expanded(child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CardWidget(image: 'assets/personCar1.jpeg', heading: 'Sedan',
              subHeading: 'Chevrolet Malibu or similar',),

          ],)),
        SizedBox(width: 50,),
        Expanded(child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,

          children: [
            CardWidget(image: 'assets/images/Couple.webp', heading: 'SUV',
              subHeading: "Volkswagen Tiguan or similar",),
          ],)),
        SizedBox(width: 50,),
        Expanded(child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CardWidget(image: 'assets/personCar2.jpg', heading: 'Premium',
              subHeading: 'Audi Q3 or similar',),

          ],)),
      ],
    ),
  );
}

Widget CarTypesMediumScreen(){
  return SingleChildScrollView(

    scrollDirection: Axis.horizontal,
    physics: BouncingScrollPhysics(),
    child: Padding(
      padding: const EdgeInsets.all(40.0),
      child: Row(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CardWidget(image: 'assets/images/cars.webp', heading: 'Economy',
                subHeading: 'Toyota Corolla or similar',),

            ],),
          SizedBox(width: 50,),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CardWidget(image: 'assets/personCar1.jpeg', heading: 'Sedan',
                subHeading: 'Chevrolet Malibu or similar',),

            ],),
          SizedBox(width: 50,),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,

            children: [
              CardWidget(image: 'assets/images/Couple.webp', heading: 'SUV',
                subHeading: "Volkswagen Tiguan or similar",),
            ],),
          SizedBox(width: 50,),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CardWidget(image: 'assets/personCar2.jpg', heading: 'Premium',
                subHeading: 'Audi Q3 or similar',),

            ],),
        ],
      ),
    ),
  );
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
          height: 150,
          width: 250,
          decoration: BoxDecoration(
            // image: DecorationImage(image: AssetImage(widget.image),fit: BoxFit.contain),
            // color: Colors.blue,
            borderRadius:
            BorderRadius.all(Radius.circular(20)),
          ),
          child: ClipRRect(
              borderRadius:
              BorderRadius.all(Radius.circular(20)),
              child: Image(image: AssetImage(widget.image),fit: BoxFit.contain)),
        ),
        SizedBox(height: 20,),
        HeadingTextWidget(title:widget.heading,),
        SizedBox(height: 10,),
        SubHeadingTextWidget(title:widget.subHeading)
      ],
    );
  }
}
