import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_google_places_sdk/flutter_google_places_sdk.dart';
import 'package:get/get.dart';
import 'package:yb_ride_user_web/Vehicle/view.dart';
import 'package:yb_ride_user_web/helper/AppConstants.dart';
import 'package:yb_ride_user_web/helper/api.dart';
import 'package:yb_ride_user_web/homePage/view.dart';
import 'package:yb_ride_user_web/pages/appBarPages/Trips/tabBarView.dart';
import 'package:yb_ride_user_web/sessions/signUp/view.dart';
import 'package:yb_ride_user_web/pages/appBarPages/Accounts/view.dart';
import 'package:yb_ride_user_web/pages/appBarPages/Become_Driver/SignUpForm.dart';
import 'package:yb_ride_user_web/pages/appBarPages/Become_Driver/view.dart';
import 'package:yb_ride_user_web/pages/appBarPages/FaqS/view.dart';
import 'package:yb_ride_user_web/pages/appBarPages/Trips/allTripPage.dart';
import 'package:yb_ride_user_web/sessions/login/view.dart';
import 'package:yb_ride_user_web/sessions/signUp/view.dart';

import 'checkOut/view.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await FlutterGooglePlacesSdkPlatform.instance.initialize('AIzaSyA8mT_fcQoFRNpBokvTjVXsuc-TB9k-leI');
  await Firebase.initializeApp(
      options: FirebaseOptions(
          apiKey: "AIzaSyCQ3Z12FVYyB22zTt5fsYjADiNkhS_lbu4",
          authDomain: "yb-ride-83505.firebaseapp.com",
          projectId: "yb-ride-83505",
          storageBucket: "yb-ride-83505.appspot.com",
          messagingSenderId: "782774219638",
          databaseURL: "https://yb-ride-83505-default-rtdb.firebaseio.com",
          appId: "1:782774219638:web:33778b1d7f080d4f0e4057",
          measurementId: "G-X0BDLMSM45"
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
      title: 'Yb-Ride',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),

      // home: APis.auth.currentUser != null ? HomePage() : SignUpPages(),
      initialRoute: '/',
      home:  HomePage() ,

      // home: CheckOutPage(carType: 'SUV',carRent: 130,carPrice: 43,carDescription: 'Nessan Versa - 5 seats',),
    );
  }
}
