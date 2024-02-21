import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_google_places_sdk/flutter_google_places_sdk.dart';
import 'package:get/get.dart';
import 'package:yb_ride_user_web/Vehicle/view.dart';
import 'package:yb_ride_user_web/helper/AppConstants.dart';
import 'package:yb_ride_user_web/helper/api.dart';
import 'package:yb_ride_user_web/homePage/view.dart';
import 'package:yb_ride_user_web/sessions/signUp/view.dart';
import 'package:yb_ride_user_web/pages/appBarPages/Accounts/view.dart';
import 'package:yb_ride_user_web/pages/appBarPages/Become_Driver/SignUpForm.dart';
import 'package:yb_ride_user_web/pages/appBarPages/Become_Driver/view.dart';
import 'package:yb_ride_user_web/pages/appBarPages/FaqS/view.dart';
import 'package:yb_ride_user_web/pages/appBarPages/Trips/view.dart';
import 'package:yb_ride_user_web/sessions/login/view.dart';
import 'package:yb_ride_user_web/sessions/signUp/view.dart';

import 'checkOut/view.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  // Stripe.publishableKey = AppConstants.stripe_publish_key;
  //
  // Stripe.merchantIdentifier = 'YB-Web';
  // await Stripe.instance.applySettings();
  await FlutterGooglePlacesSdkPlatform.instance.initialize('AIzaSyA8mT_fcQoFRNpBokvTjVXsuc-TB9k-leI');
  await Firebase.initializeApp(
      options: FirebaseOptions(
          apiKey: "AIzaSyDw220zwlHJ1LnBdx0udN_NM2i4nucLLwA",
          authDomain: "yb-ride-88e8b.firebaseapp.com",
          projectId: "yb-ride-88e8b",
          storageBucket: "yb-ride-88e8b.appspot.com",
          messagingSenderId: "1046745632203",
          databaseURL: 'https://yb-ride-88e8b-default-rtdb.firebaseio.com/',
          appId: "1:1046745632203:web:275c410a75d45b72ae7a4e",
          measurementId: "G-MKWZLB0PF7"
      )
  );


  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    AppConstants.rentDays = 3;
    // AppConstants.totalPrice = 120;
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'YbRide Users',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: APis.auth.currentUser != null ? HomePage() : HomePage(),
      // home: PracticePAge(),
      // home: CheckOutPage(carType: 'SUV',carRent: 130,carPrice: 43,carDescription: 'Nessan Versa - 5 seats',),
    );
  }
}
