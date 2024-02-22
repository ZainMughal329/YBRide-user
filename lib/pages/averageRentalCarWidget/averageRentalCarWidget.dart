import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:yb_ride_user_web/helper/responsive.dart';

import '../../components/headingTextWidget.dart';
import '../../components/subHeadingText.dart';

Widget AverageRentalCar() {
  return Padding(
    padding: const EdgeInsets.all(32.0),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CardLargeWidget(
              image: 'assets/personCar.jpeg',
              heading: 'Brand new cars',
              subHeading:
                  'Drive a clean, professionally maintained car that we’ve purchased brand new from manufacturers.',
            ),
          ],
        )),
        SizedBox(
          width: 50,
        ),
        Expanded(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CardLargeWidget(
              image: 'assets/images/mobile.webp',
              heading: 'Counter-free guarantee',
              subHeading:
                  'Never wait in line, manage your trip in our app and get your car delivered. You can also pick up at one of our lots.',
            ),
          ],
        )),
        SizedBox(
          width: 50,
        ),
        Expanded(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CardLargeWidget(
              image: 'assets/images/Couple.webp',
              heading: 'No hidden fees',
              subHeading:
                  "We don’t make money by surprising you with extra fees. For full transparency, find every fee in our Help Center.",
            ),
          ],
        )),
      ],
    ),
  );
}

Widget AverageRentalCarMediumScreen() {
  return Center(
    child: Padding(
      padding: const EdgeInsets.all(32.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CardWidget(
                image: 'assets/personCar.jpeg',
                heading: 'Brand new cars',
                subHeading:
                    'Drive a clean, professionally maintained car that we’ve purchased brand new from manufacturers.',
              ),
            ],
          ),
          SizedBox(
            height: 50,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CardWidget(
                image: 'assets/images/mobile.webp',
                heading: 'Counter-free guarantee',
                subHeading:
                    'Never wait in line, manage your trip in our app and get your car delivered. You can also pick up at one of our lots.',
              ),
            ],
          ),
          SizedBox(
            height: 50,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CardWidget(
                image: 'assets/images/Couple.webp',
                heading: 'No hidden fees',
                subHeading:
                    "We don’t make money by surprising you with extra fees. For full transparency, find every fee in our Help Center.",
              ),
            ],
          ),
        ],
      ),
    ),
  );
}

Widget AverageRentalCarSmallScreen() {
  return Padding(
    padding: const EdgeInsets.all(2.0),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CardWidget(
              image: 'assets/personCar.jpeg',
              heading: 'Brand new cars',
              subHeading:
                  'Drive a clean, professionally maintained car that we’ve purchased brand new from manufacturers.',
            ),
          ],
        ),
        SizedBox(
          height: 50,
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CardWidget(
              image: 'assets/images/mobile.webp',
              heading: 'Counter-free guarantee',
              subHeading:
                  'Never wait in line, manage your trip in our app and get your car delivered. You can also pick up at one of our lots.',
            ),
          ],
        ),
        SizedBox(
          height: 50,
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CardWidget(
              image: 'assets/images/Couple.webp',
              heading: 'No hidden fees',
              subHeading:
                  "We don’t make money by surprising you with extra fees. For full transparency, find every fee in our Help Center.",
            ),
          ],
        ),
      ],
    ),
  );
}

class CardWidget extends StatefulWidget {
  final String image;
  final String heading;
  final String subHeading;

  CardWidget(
      {super.key,
      required this.image,
      required this.heading,
      required this.subHeading});

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
          height: 332,
          width: ResponsiveWidget.isMediumScreen(context)
              ? 470

              : ResponsiveWidget.isSmallScreen(context) ? MediaQuery.of(context).size.width : null,
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage(widget.image), fit: BoxFit.fill),
            // color: Colors.blue,
            borderRadius: BorderRadius.all(Radius.circular(20)),
          ),
        ),
        SizedBox(
          height: 20,
        ),
        HeadingTextWidget(
          title: widget.heading,
        ),
        SizedBox(
          height: 20,
        ),
        SubHeadingTextWidget(title: widget.subHeading)
      ],
    );
  }
}

class CardLargeWidget extends StatelessWidget {
  final String image;
  final String heading;
  final String subHeading;

  const CardLargeWidget(
      {super.key,
      required this.image,
      required this.heading,
      required this.subHeading});

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
            image: DecorationImage(image: AssetImage(image), fit: BoxFit.fill),
            // color: Colors.blue,
            borderRadius: BorderRadius.all(Radius.circular(20)),
          ),
        ),
        SizedBox(
          height: 20,
        ),
        HeadingTextWidget(
          title: heading,
        ),
        SizedBox(
          height: 20,
        ),
        SubHeadingTextWidget(title: subHeading)
      ],
    );
  }
}
