import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yb_ride_user_web/Vehicle/addVehiclePage/widgets/form.dart';
import 'package:yb_ride_user_web/checkOut/Widget/payment/paymentController.dart';
import 'package:yb_ride_user_web/components/headingTextWidget.dart';
import 'package:yb_ride_user_web/homePage/view.dart';

import '../../../components/snackbar_widget.dart';
import '../../../helper/AppConstants.dart';
import '../../../helper/api.dart';
import '../../../helper/session_Controller.dart';
import '../../../helper/show_progress_indicator.dart';
import '../../../model/booking_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


final con = Get.put(PaymentController());
showCustomDialog(BuildContext context, String id,String vehicleId) {
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
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                  title:'Make payments to the mentioned account\n"${AppConstants.ybAccNumber}"\nBooking will remain in pending state until confirmed by the YB-RIDE Administration.\nContact us on : ${AppConstants.ybPhone}\n${AppConstants.ybEmail}'),
              SizedBox(height: 10),
          ],
        ),
          actions: <Widget>[
            TextButton(
              onPressed: () {

                createBooking(context,id).then((value){
                updateVehicleCount(vehicleId);
                showProgressIndicator(context);
                Future.delayed(Duration(seconds: 2),(){
                  // Navigator.pop(context);
                  Get.offAll(()=>HomePage());
                });
                  // Get.off(()=>HomePage());
                });
              },
              child: Text('Ok'),
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
Future<void> updateVehicleCount(String id) async {
  final _db = APis.db.collection('vehicleData');
  try {
    // Retrieve the document snapshot for the specified id
    DocumentSnapshot snapshot = await _db.doc(id).get();

    // Extract the current count of vehicles from the snapshot data
    var stringVal = snapshot.data() as Map<String, dynamic>;
    final stringValue = stringVal['noOfVehicles'];

    // Convert the extracted string value to an integer
    int? integerValue = int.tryParse(stringValue);

    // If conversion to integer is successful
    if (integerValue != null) {
      // Subtract one from the current count
      int updatedValue = integerValue - 1;

      // Update the count in the database
      await _db.doc(id).update({'noOfVehicles': updatedValue.toString()});
    } else {
      // Handle if the conversion fails
      // You may add error handling logic here
    }
  } catch (error) {
    // Handle any errors that occur during the process
    // You may add error handling logic here
  }
}


Future<void> createBooking(BuildContext context,String id) async{
  String docId = DateTime.now().millisecondsSinceEpoch.toString();
  showProgressIndicator(context);
  BookingModel booking = BookingModel(
    state: AppConstants.selectedState,
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
      updateVehicleCount(docId);
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