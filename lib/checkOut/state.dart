import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class CheckOutState{

  double carPricePerDay = 0.0;
  double carRent = 0.0;
  RxDouble totalPrice = 0.0.obs;


  final firstNameCon = TextEditingController();
  final lastNameCon = TextEditingController();
  final emailCon = TextEditingController();
  final phoneNumCon = TextEditingController();
  RxString countryCode = "+1".obs;
  final isDriverAge = false.obs;
  final isDelivery = false.obs;
  final isSelfPickup = false.obs;
  final UnlimitedMiles = false.obs;
  final standardCoverage = false.obs;
  final liabilityInsurance = false.obs;
  final iHaveMyOwn = false.obs;

  final promoCodeCon = TextEditingController();
  final buttonVisible = false.obs;

  final cdwSwitchVal = false.obs;
  final rcliSwitchVal = false.obs;
  final sliSwitchVal = false.obs;

  var isLoading = true.obs;


  // Variables for checkout

  RxBool dataLoaded = false.obs;
  double? delivery;
  double? essential ;
  double? standard ;
  double? CDW ;
  double? RCLI ;
  double? SLI ;
  double? assistance;
  double? licenseFee ;
  double? unlimitedMiles ;
  String? pickupLoc;


  //Dynamic Payments
  static double tempDeposit = 0.0;
  static String paymentId = '';
  static String bookingDate = '';
  static double deliveryCharges = 0.0;
  static double bostonPoliceFees = 0.0;
  static double bostonParking = 0.0;
  static double bostonConventionCenter = 0.0;
  static double totalAmountToPay = 0.0;
  static double salesTaxPercentage = 0.0;
  static String pickUpLoc = "";




}