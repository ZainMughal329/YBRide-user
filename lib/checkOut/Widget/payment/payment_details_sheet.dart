import 'dart:typed_data';
import 'dart:html' as html;

import 'package:flutter/material.dart';
import 'package:screenshot/screenshot.dart';
import 'package:yb_ride_user_web/checkOut/Widget/payment/payment_dialouge.dart';
import 'package:yb_ride_user_web/components/headingTextWidget.dart';
import 'package:yb_ride_user_web/components/reuseableButton.dart';
import 'package:yb_ride_user_web/components/snackbar_widget.dart';
import 'package:yb_ride_user_web/components/subHeadingText.dart';
import 'package:yb_ride_user_web/helper/AppConstants.dart';
import 'package:yb_ride_user_web/helper/appColors.dart';



Future showRecipetSheet(
    BuildContext context,
    double noOfDays,
    String totalAmount,
    String invoiceDateTime,
    String serviceFromDateTime,
    String serviceToDateTime,
    double numberOfDays,
    String invoiceId,
    String paymentMethod,
    Map<String, double> charges,
    ) {
  ScreenshotController screenshotController = ScreenshotController();

  Future<void> _saveReceipt(var imageData) async {
    try {
      // Convert the image data to a Uint8List
      List<int> bytes = List<int>.from(imageData);

      // Create a blob from the image bytes
      final blob = html.Blob([Uint8List.fromList(bytes)]);

      // Create a temporary URL for the blob
      final url = html.Url.createObjectUrlFromBlob(blob);

      // Create an anchor element to trigger the download
      final anchor = html.AnchorElement(href: url)
        ..setAttribute("download", "receipt_image.png")
        ..click();

      // Clean up the temporary URL
      html.Url.revokeObjectUrl(url);

      Snackbar.showSnackBar('YB-Ride', "Receipt saved to downloads", Icons.done_all);
    } catch (e) {
      Snackbar.showSnackBar('YB-Ride', e.toString(), Icons.done_all);
    }
  }

  // Future<void> _saveReceipt(var imageData) async {
  //   try {
  //
  //     await ImageGallerySaver.saveImage(imageData, quality: 100);
  //
  //     Snackbar.showSnackBar('YB-Ride', "Receipt saved to gallery", Icons.done_all);
  //   } catch (e) {
  //
  //     Snackbar.showSnackBar('YB-Ride', e.toString(), Icons.done_all);
  //
  //   }
  // }
  double totalAmountToPay = 0.0;
  double _calculateSubTotal() {
    double subTotal = 0;
    subTotal = AppConstants.totalPrice +
        AppConstants.bostonPoliceFees +
        AppConstants.bostonParking +
        AppConstants.bostonConventionCenter +
        AppConstants.tempDeposit;
    return subTotal;
  }


  double _calculateTax() {
    // return _calculateSubTotal() * 0.0625;
    return _calculateSubTotal() * (AppConstants.salesTaxPercentage / 100);
  }

  double _calculateTotal() {
    totalAmountToPay = _calculateSubTotal() + _calculateTax();
    AppConstants.totalAmountToPay = totalAmountToPay;
    return _calculateSubTotal() + _calculateTax();
  }

  return showModalBottomSheet(
      isScrollControlled: true,
      isDismissible: false,
      useSafeArea: true,
      backgroundColor: Colors.white,
      context: context,
      builder: (_) {
        return Screenshot(
          controller: screenshotController,
          child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Container(
              padding: EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(12.0),
                color: Colors.white,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  HeadingTextWidget(
                    title: 'YB-Ride Receipt',
                    textColor: AppColors.blackColor,
                  ),
                  SizedBox(height: 10),
                  SubHeadingTextWidget(
                    title: 'Total Rental Amount: $totalAmount',
                    textColor: AppColors.blackColor,
                  ),
                  SubHeadingTextWidget(
                    title: 'Invoice Date and Time: $invoiceDateTime',
                    textColor: AppColors.blackColor,
                  ),
                  SubHeadingTextWidget(
                    title: 'Service From Date and Time: $serviceFromDateTime',
                    textColor: AppColors.blackColor,
                  ),
                  SubHeadingTextWidget(
                    title: 'Service To Date and Time: $serviceToDateTime',
                    textColor: AppColors.blackColor,
                  ),
                  SubHeadingTextWidget(
                    title: 'Number of Days: $numberOfDays',
                    textColor: AppColors.blackColor,
                  ),
                  // SubHeadingTextWidget(
                  //   title: 'Receipt Number: $receiptNumber',
                  //   textColor: Theme.of(context).headingColor,
                  // ),
                  SubHeadingTextWidget(
                    title: 'Invoice Id: $invoiceId',
                    textColor: AppColors.blackColor,
                  ),
                  SubHeadingTextWidget(
                    title: 'Payment Method: $paymentMethod',
                    textColor: AppColors.blackColor,
                  ),
                  Divider(
                    color: AppColors.blackColor,
                  ),
                  SizedBox(height: 20),
                  HeadingTextWidget(
                    title: 'Details:',
                    textColor: AppColors.blackColor,
                  ),
                  SizedBox(height: 10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: charges.entries.map((entry) {
                      return Padding(
                        padding: EdgeInsets.only(bottom: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          // crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // SubHeadingTextWidget(
                            //   title: 'QTY: ${noOfDays}',
                            //   textColor: Theme.of(context).headingColor,
                            // ),
                            // Spacer(),
                            Align(
                                alignment: Alignment.centerLeft,
                                child: SubHeadingTextWidget(
                                  title: '${entry.key}',
                                  textAlign: TextAlign.left,
                                  textColor: AppColors.blackColor,
                                )),
                            Spacer(),
                            SubHeadingTextWidget(
                              title: '\$${entry.value.toStringAsFixed(2)}',
                              textColor: AppColors.blackColor,
                            ),
                          ],
                        ),
                      );
                    }).toList(),
                  ),
                  Divider(
                    color: AppColors.blackColor,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SubHeadingTextWidget(
                        title: 'SubTotal:',
                        textColor: AppColors.blackColor,
                      ),
                      SubHeadingTextWidget(
                        title: '\$${_calculateSubTotal().toStringAsFixed(2)}',
                        textColor: AppColors.blackColor,
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SubHeadingTextWidget(
                        title:
                        'Sales Tax (${AppConstants.salesTaxPercentage}%):',
                        textColor: AppColors.blackColor,
                      ),
                      SubHeadingTextWidget(
                        title: '\$${_calculateTax().toStringAsFixed(2)}',
                        textColor: AppColors.blackColor,
                      ),
                    ],
                  ),
                  Divider(
                    color: AppColors.blackColor,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SubHeadingTextWidget(
                        title: 'Total:',
                        textColor: AppColors.blackColor,
                      ),
                      SubHeadingTextWidget(
                        title: '\$${_calculateTotal().toStringAsFixed(2)}',
                        textColor: AppColors.blackColor,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  RoundButton(
                      title: "Pay",
                      onPress: () async {
                        screenshotController.capture().then(
                              (Uint8List? image) {
                            _saveReceipt(image);
                            showCustomDialog(context);
                          },
                        );
                        Navigator.pop(context);
                        // Navigator.pop(context);
                        // final con = Get.put(PaymentController());
                        // con.makePayment(context, AppConstants.totalPrice);
                        // final payController = PaymentController();
                        // await payController.makePayment(
                        //     context, totalAmountToPay);
                      }),
                  SizedBox(
                    height: 20,
                  ),
                ],
              ),
            ),
          ),
        );
      });
}
