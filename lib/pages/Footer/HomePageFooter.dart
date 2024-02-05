import 'package:flutter/material.dart';
import 'package:yb_ride_user_web/components/headingTextWidget.dart';
import 'package:yb_ride_user_web/components/subHeadingText.dart';
import 'package:yb_ride_user_web/helper/responsive.dart';
import '../../helper/appColors.dart';
Widget Footer(BuildContext context){
  return Stack(
    children:[
      Container(
        height: 100,
        color: Colors.white, // Top color
      ),
      ClipPath(
        clipper: CustomCurveClipper(),
        child: Container(
          height: 270,
          color: AppColors.buttonColor,
          child: Stack(
            children: [
              Column(
                children: [
                  Spacer(),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 30),
                    child: Align(
                      alignment: Alignment.center,
                      child: HeadingTextWidget(title: "There's a better way to rent",textColor: Colors.white,fontWeight: FontWeight.bold,fontSize: ResponsiveWidget.isLargeScreen(context) ? 30 : 22,),
                    ),
                  ),


                  ResponsiveWidget.isLargeScreen(context) ? Container() :Container(
                    height: 50,
                    width: 100,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        color: Colors.deepPurple
                    ),
                    child: Center(
                      child: HeadingTextWidget(
                        title: 'Download',
                        textColor: AppColors.whiteColor,
                        fontSize: 14,
                      ),
                    ),
                  ),
                  Spacer(),

                ],
              ),


            ],
          ),
        ),
      ),
      SizedBox(height: 100,),
      Padding(
        padding: EdgeInsets.only(top:300),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: ResponsiveWidget.isLargeScreen(context) ? Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height:30),
              Expanded(child: Image(image: AssetImage('assets/images/YBRIDE text.jpg'),height: 60,width: 60,)),
              SizedBox(width: 50,),
              Expanded(child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                HeadingTextWidget(title: 'Get Started'),
                SizedBox(height: 20,),
                SubHeadingTextWidget(title: 'Book a car',textColor: Colors.black,),
                SizedBox(height: 20,),
                SubHeadingTextWidget(title: 'Drivers Partners',textColor: Colors.black,)
              ],)),
              SizedBox(width: 50,),
              Expanded(child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                HeadingTextWidget(title: 'Resources'),
                SizedBox(height: 20,),
                SubHeadingTextWidget(title: 'My Trip',textColor: Colors.black),
                SizedBox(height: 20,),
                SubHeadingTextWidget(title: 'Help',textColor: Colors.black),
                SizedBox(height: 20,),
                SubHeadingTextWidget(title: 'Referrals',textColor: Colors.black),
                SizedBox(height: 20,),
                SubHeadingTextWidget(title: 'Contact us',textColor: Colors.black),
                SizedBox(height: 20,),
                SubHeadingTextWidget(title: 'Do not sell my personal information',textColor: Colors.black),
              ],)),
              SizedBox(width: 50,),
              Expanded(child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                   crossAxisAlignment: CrossAxisAlignment.start,

                   children: [
                HeadingTextWidget(title: 'Blog'),
                SizedBox(height: 20,),
                SubHeadingTextWidget(title: 'Careers',textColor: Colors.black),
                SizedBox(height: 20,),
                SubHeadingTextWidget(title: 'Team and culture',textColor: Colors.black),
                SizedBox(height: 20,),
                SubHeadingTextWidget(title: 'Terms',textColor: Colors.black),
                SizedBox(height: 20,),
                SubHeadingTextWidget(title: 'Privacy us',textColor: Colors.black),
                SizedBox(height: 20,),
                SubHeadingTextWidget(title: 'Accessibility',textColor: Colors.black),
              ],)),
            ],
          ) : Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height:30),
              Image(image: AssetImage('assets/images/YBRIDE text.jpg'),height: 60,width: 60,),
              SizedBox(height: 50,),
              HeadingTextWidget(title: 'Get Started'),
              SizedBox(height: 20,),
              SubHeadingTextWidget(title: 'Book a car',textColor: Colors.black,),
              SizedBox(height: 20,),
              SubHeadingTextWidget(title: 'Drivers Partners',textColor: Colors.black,),
              SizedBox(height: 50,),
              HeadingTextWidget(title: 'Resources'),
              SizedBox(height: 20,),
              SubHeadingTextWidget(title: 'My Trip',textColor: Colors.black),
              SizedBox(height: 20,),
              SubHeadingTextWidget(title: 'Help',textColor: Colors.black),
              SizedBox(height: 20,),
              SubHeadingTextWidget(title: 'Referrals',textColor: Colors.black),
              SizedBox(height: 20,),
              SubHeadingTextWidget(title: 'Contact us',textColor: Colors.black),
              SizedBox(height: 20,),
              SubHeadingTextWidget(title: 'Do not sell my personal information',textColor: Colors.black),
              SizedBox(height: 50,),
              HeadingTextWidget(title: 'Blog'),
              SizedBox(height: 20,),
              SubHeadingTextWidget(title: 'Careers',textColor: Colors.black),
              SizedBox(height: 20,),
              SubHeadingTextWidget(title: 'Team and culture',textColor: Colors.black),
              SizedBox(height: 20,),
              SubHeadingTextWidget(title: 'Terms',textColor: Colors.black),
              SizedBox(height: 20,),
              SubHeadingTextWidget(title: 'Privacy us',textColor: Colors.black),
              SizedBox(height: 20,),
              SubHeadingTextWidget(title: 'Accessibility',textColor: Colors.black),
            ],
          ),
        ),
      )
    ]
  );
}
class CustomCurveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.lineTo(0, size.height - 100); // Move to the bottom-left, increased the height
    path.quadraticBezierTo(
        size.width / 2, size.height + 80, size.width, size.height - 100); // Adjust the control points
    path.lineTo(size.width, 0); // Move to the top-right
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
