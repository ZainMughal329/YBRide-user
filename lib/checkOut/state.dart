import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class CheckOutState{

  double carPricePerDay = 0.0;
  double carRent = 0.0;
  RxDouble totalPrice = 0.0.obs;


  final TextEditingController firstNameCon = TextEditingController();
  final TextEditingController lastNameCon = TextEditingController();
  final TextEditingController emailCon = TextEditingController();
  final TextEditingController phoneNumCon = TextEditingController();
  RxString countryCode = "+1".obs;
  final isDriverAge = false.obs;
  final isDelivery = false.obs;
  final isSelfPickup = false.obs;
  final UnlimitedMiles = false.obs;
  final standardCoverage = false.obs;
  final liabilityInsurance = false.obs;
  final iHaveMyOwn = false.obs;
  final paymentCheck = false.obs;


  final promoCodeCon = TextEditingController();
  final buttonVisible = false.obs;

  final cdwSwitchVal = false.obs;
  final rcliSwitchVal = false.obs;
  final assistantSwitchVal = false.obs;
  final sliSwitchVal = false.obs;

  var isLoading = true.obs;


  // Variables for checkout

  RxBool customCoverageValue = false.obs;

  RxBool dataLoaded = false.obs;
  double delivery =0.0;
  double? essential=0.0 ;
  double? standard =0.0;
  double? CDW=0.0 ;
  double? RCLI =0.0;
  double? SLI =0.0;
  double? assistance=0.0;
  double? licenseFee =0.0;
  double? unlimitedMiles=0.0 ;
  String? pickupLoc;


  //Dynamic Payments
 double tempDeposit = 0.0;
String paymentId = '';
 String bookingDate = '';
 // double deliveryCharges = 0.0;
  double bostonPoliceFees = 0.0;
   double bostonParking = 0.0;
   double bostonConventionCenter = 0.0;
   double totalAmountToPay = 0.0;
   double salesTaxPercentage = 0.0;
   String pickUpLoc = "";


  //
String carDescription = '';

  RxBool promoCodeapplied = false.obs;
  RxDouble promoDiscount = 0.0.obs;





}