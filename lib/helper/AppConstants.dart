class AppConstants {



  static  String playStoreLink="";
  static  String appStoreLink="";
  static String instagramLink="";
  static String twitterLink="";
  static String fbLink="";
  static String ybEmail="";
  static String ybPhone="";



  static final String google_api_key = 'AIzaSyAL3BrJ_7Q2cCjaPYMjEbfrmRSM2TBtPk0';

  static final String stripe_publish_key = 'pk_test_51Ogo46EwduwUAGBRz8KlKG0uKlP2DL1KfBVj3Iqum4fSQVtOfD4WPCisOOmVfIoEAKsBJNTI0WzOmpOLmntqPTTJ00F599LcQW';

  static final String stripe_secret_key = 'sk_test_51Ogo46EwduwUAGBR6619v0dguE6DlSE4n461X2P3SPjB36K9zAqbU8lQyp7WuqIMQatRCsf7LQx7w5nKAfRKluYy00k7p6obF5';

  // static final String kPlacesApiKey = 'AIzaSyDw220zwlHJ1LnBdx0udN_NM2i4nucLLwA';
  static final String kPlacesApiKey =   'AIzaSyA8mT_fcQoFRNpBokvTjVXsuc-TB9k-leI';
  static final String placesBaseUrl = 'https://maps.googleapis.com/maps/api/place/autocomplete/json';

  //calculation constants
  //Calculation Constants
  static double rentDays = 0.0;
  static double totalPrice =0.0;
  static String vehicleType='';

// time and date variables
  static String fromAddress = 'Tap to Search';
  static String toAddress = 'Return Place';

  static   String epochFromDate = "";
  static   String fromMonth = "";
  static   String fromMonthName = "";
  static   String fromDate = "";
  static   String fromDateName = "";
  static   String fromYear = "";
  static   String fromTime = "11:00 AM";
  static String fromTimeinMiliSeconds = "";
  static   String epochToDate="";
  static   String toMonth = "";
  static   String toMonthName = "";
  static   String toDate = "";
  static   String toDateName = "";
  static   String toYear = "";
  static   String toTime = "11:00 AM";
  static String toTimeinMiliSeconds = "";


  //Checkout Payments
  //Payments
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



  //PromoCode details
  static bool isPromoApplied = false;
  static double promoDiscountAmount = 0.0;


  static bool isPickup = false;
  static bool isDeliver =false;

  static bool standardProtection=false;
  static bool liabilityProtection=false;
  static bool i_have_own=false;
  static bool customCoverage=false;
  static double totalCustomCoverage=0.0;

  static bool unlimitedMiles = false;
  static bool under25Years = false;


  static String custFirstName ="";
  static String custLastName ="";
  static String custEmail ="";
  static String custPhoneNo ="";



  static void resetToInitialState() {
    fromAddress = 'Tap to Search';
    toAddress = 'Return Place';
    epochFromDate = "";
    fromMonth = "";
    fromMonthName = "";
    fromDate = "";
    fromDateName = "";
    fromYear = "";
    fromTime = "11:00 AM";
    fromTimeinMiliSeconds = "";
    epochToDate="";
    toMonth = "";
    toMonthName = "";
    toDate = "";
    toDateName = "";
    toYear = "";
    toTime = "11:00 AM";
    toTimeinMiliSeconds = "";
    rentDays = 0.0;
    totalPrice =0.0;
    vehicleType = "";
    isPickup = false;
    isDeliver =false;
    standardProtection=false;
    liabilityProtection=false;
    i_have_own=false;
    customCoverage=false;
    totalCustomCoverage=0.0;
    unlimitedMiles = false;
    under25Years = false;
    isPromoApplied = false;
    promoDiscountAmount = 0.0;
    custFirstName="";
    custLastName="";
    custEmail="";
    custPhoneNo="";
    paymentId = '';
    bookingDate = '';
    // Get.delete<BookNowView>();
    // Get.delete<CarDetailsScreen>();
    // Get.delete<CheckOutScreen>();
  }

}