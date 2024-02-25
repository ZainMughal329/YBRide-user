import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yb_ride_user_web/checkOut/Widget/payment/paymentController.dart';
import 'package:yb_ride_user_web/components/headingTextWidget.dart';

import '../../../components/snackbar_widget.dart';
import '../../../helper/AppConstants.dart';
import '../../../helper/api.dart';
import '../../../helper/session_Controller.dart';
import '../../../helper/show_progress_indicator.dart';
import '../../../model/booking_model.dart';



final con = Get.put(PaymentController());
showCustomDialog(BuildContext context) {
  con.fetchContactDetails();
    return showDialog(
      barrierColor: Colors.white,
      barrierDismissible: false,
      context: context, builder: (BuildContext context) {
        return AlertDialog(

          backgroundColor: Colors.white,
          title: Text('Payment'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              HeadingTextWidget(
                  height: 1.25,
                  textAlign: TextAlign.center,
                  fontWeight: FontWeight.w500,
                  fontSize: 14,
                  title:'Make payments to the mentioned account "${1783}"Booking will remain in pending state until confirmed by the YB-RIDE Administration.\nContact us on : ${AppConstants.ybPhone}\n${AppConstants.ybEmail}'),
              SizedBox(height: 10),
          ],
        ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                createBooking(context);
                Navigator.pop(context);
              },
              child: Text('Oka'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialogue box
              },
              child: Text('Cancel'),
            ),
          ],
        );
    },


    );
  }


Future<void> createBooking(BuildContext context) async{
  String docId = DateTime.now().millisecondsSinceEpoch.toString();
  showProgressIndicator(context);
  BookingModel booking = BookingModel(
    id: APis.auth.currentUser!.uid,
    paymentId: '',
    bookingDate: docId,
    fullName: '${AppConstants.custFirstName} ${AppConstants.custLastName}',
    email: AppConstants.custEmail,
    phone: AppConstants.custPhoneNo,
    completeFromAddress: AppConstants.fromAddress.toString(),
    completeToAddress: AppConstants.toAddress.toString(),
    fromDateEpoch: AppConstants.epochFromDate.toString(),
    toDateEpoch: AppConstants.epochToDate.toString(),
    fromTimeEpoch: AppConstants.fromTimeinMiliSeconds.toString(),
    toTimeEpoch: AppConstants.toTimeinMiliSeconds.toString(),
    noOfDays: AppConstants.rentDays,
    vehicleType: AppConstants.vehicleType.toString(),
    totalPrice: AppConstants.totalAmountToPay,
    isPickUp: AppConstants.isPickup,
    isDelivery: AppConstants.isDeliver,
    isStandardProtection: AppConstants.standardProtection,
    isLiabilityProtection: AppConstants.liabilityProtection,
    isIHaveOwnProtection: AppConstants.i_have_own,
    isCustomCoverage: AppConstants.customCoverage,
    totalCustomCoverage: AppConstants.totalCustomCoverage,
    isUnlimitedMiles: AppConstants.unlimitedMiles,
    isUnder25years: AppConstants.under25Years,
    isPromoCodeApplied: AppConstants.isPromoApplied,
    promoDiscountAmount: AppConstants.promoDiscountAmount,
    status: 'pending', isReturnedDeposit: false, isPaid: false,
  );

  try{
    await APis.db.collection('all_bookings').doc(docId).set(booking.toJson()).then((value){
      Navigator.pop(context);
      // Code to redirect to Trips Screen
      resetReferralCredit();
      Navigator.pop(context);
      Snackbar.showSnackBar("YB-Ride", 'Payed and Booked Successfully', Icons.done_all);
      AppConstants.resetToInitialState();



    }).onError((error, stackTrace){
      // setPaymentLoadin(false);
      Navigator.pop(context);
      Snackbar.showSnackBar("YB-Ride", error.toString(), Icons.error_outline);
    });
  }catch(e){
    Navigator.pop(context);
    Snackbar.showSnackBar("YB-Ride", e.toString(), Icons.error_outline);
  }

}
Future<void> resetReferralCredit() async{
  await APis.db.collection('users').doc(SessionController().userId.toString()).update({
    'referralDiscount':0
  });
}