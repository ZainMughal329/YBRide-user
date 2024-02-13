import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yb_ride_user_web/checkOut/controller.dart';
import 'package:yb_ride_user_web/components/reuseableButton.dart';
import 'package:yb_ride_user_web/components/subHeadingText.dart';
import 'package:yb_ride_user_web/helper/responsive.dart';
import 'package:yb_ride_user_web/helper/AppConstants.dart';
import 'Widget/coverage/CoverageWidget.dart';
import 'Widget/driver/driversWidgte.dart';
import 'Widget/payment/paymentWidget.dart';
import 'Widget/priceContainer/priceContainerWidget.dart';
import 'Widget/promoCode/promoCodeWidget.dart';
import 'Widget/tripDetails/tripDetailsWidget.dart';
import 'Widget/welcomeToYBride/welcometoYBRide.dart';

class CheckOutPage extends StatelessWidget {
  final double carRent;
  final String carType;
   CheckOutPage({super.key,required this.carType,required this.carRent});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(CheckOutCon());
    AppConstants.vehicleType = carType;
    // controller.getCheckoutPayments();
    controller.state.carRent = carRent;
    controller.state.totalPrice.value = carRent;
    print('=======================>>>>');
    print(AppConstants.vehicleType);
    print(controller.state.totalPrice.value);
    // return Container();
    return Scaffold(
      body: Center(
        child: ResponsiveWidget.isLargeScreen(context)
            ? Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      SizedBox(height: 20,),
                      // Image(image: AssetImage('assets/images/YBRIDE text.jpg',),height: 80,width: 80,),
                      SizedBox(height: 10,),
                      Divider(thickness: .6,),
                      SizedBox(height: 30,),
                      welcomeYBRide(context),
                      SizedBox(
                        height: 20,
                      ),
                      driverWidget(),
                      SizedBox(
                        height: 20,
                      ),
                      TripDetailsWidget(),
                      SizedBox(
                        height: 20,
                      ),
                      CoverageWidget(context),
                      SizedBox(
                        height: 20,
                      ),
                      paymentWidget(),
                      SizedBox(
                        height: 20,
                      ),
                      promoCodeWidget(context),
                      SizedBox(
                        height: 20,
                      ),
                      RoundButton(title: 'Book now', onPress: () {}),
                      SizedBox(
                        height: 30,
                      ),
                      SubHeadingTextWidget(
                          title:
                          'By continuing, you confirm that you have read and accepted the trip information'),
                      SizedBox(
                        height: 5,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 50),
                        child: SubHeadingTextWidget(
                          title: 'Terms and Conditions',
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 50),
                        child: SubHeadingTextWidget(
                          title:
                          'You can also view a sample rental contact',
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                width: 10,
              ),
              Expanded(child: priceContainerWidget())
            ],
          ),
        )
            : ResponsiveWidget.isMediumScreen(context)
            ? Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: 20,),
                // Image(image: AssetImage('assets/images/YBRIDE text.jpg',),height: 80,width: 80,),
                SizedBox(height: 10,),
                Divider(thickness: .6,),
                SizedBox(height: 30,),

                SizedBox(
                  height: 20,
                ),
                priceContainerWidgetSmall(),
                welcomeYBRide(context),
                SizedBox(
                  height: 20,
                ),
                driverWidget(),
                SizedBox(
                  height: 20,
                ),
                TripDetailsWidget(),
                SizedBox(
                  height: 20,
                ),
                CoverageWidget(context),
                SizedBox(
                  height: 20,
                ),
                paymentWidget(),
                SizedBox(
                  height: 20,
                ),
                promoCodeWidget(context),
                SizedBox(
                  height: 20,
                ),
                RoundButton(title: 'Book now', onPress: () {}),
                SizedBox(
                  height: 30,
                ),
                SubHeadingTextWidget(
                    title:
                    'By continuing, you confirm that you have read and accepted the trip information'),
                SizedBox(
                  height: 5,
                ),
                Padding(
                  padding:
                  const EdgeInsets.symmetric(horizontal: 50),
                  child: SubHeadingTextWidget(
                    title: 'Terms and Conditions',
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Padding(
                  padding:
                  const EdgeInsets.symmetric(horizontal: 50),
                  child: SubHeadingTextWidget(
                    title:
                    'You can also view a sample rental contact',
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
              ],
            ),
          ),
        )
            : Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: 20,),
                // Image(image: AssetImage('assets/images/YBRIDE text.jpg',),height: 80,width: 80,),
                SizedBox(height: 10,),
                Divider(thickness: .6,),
                SizedBox(height: 30,),
                welcomeYBRide(context),
                SizedBox(
                  height: 20,
                ),
                priceContainerWidgetSmall(),
                SizedBox(
                  height: 20,
                ),
                driverWidgetSmall(),
                SizedBox(
                  height: 20,
                ),
                TripDetailsWidgetSmall(),
                SizedBox(
                  height: 20,
                ),
                CoverageWidgetSmall(context),
                SizedBox(
                  height: 20,
                ),
                paymentWidgetSmall(),
                SizedBox(
                  height: 20,
                ),
                promoCodeWidget(context),
                SizedBox(
                  height: 20,
                ),
                RoundButton(title: 'Book now', onPress: () {}),
                SizedBox(
                  height: 30,
                ),
                SubHeadingTextWidget(
                  title:
                  'By continuing, you confirm that you have read and accepted the trip information',
                  fontSize: 13,
                  textColor: Colors.black,
                ),
                SizedBox(
                  height: 5,
                ),
                Padding(
                  padding:
                  const EdgeInsets.symmetric(horizontal: 50),
                  child: SubHeadingTextWidget(
                    title: 'Terms and Conditions',
                    fontSize: 13,
                    textColor: Colors.black,
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Padding(
                  padding:
                  const EdgeInsets.symmetric(horizontal: 50),
                  child: SubHeadingTextWidget(
                    title:
                    'You can also view a sample rental contact',
                    fontSize: 13,
                    textColor: Colors.black,
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
