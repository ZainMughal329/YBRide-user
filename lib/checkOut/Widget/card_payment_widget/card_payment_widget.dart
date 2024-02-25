import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../components/headingTextWidget.dart';
import '../../../components/subHeadingText.dart';
import '../../../helper/AppConstants.dart';
import '../payment/paymentController.dart';

final con = Get.put(PaymentController());
Widget showAdminPayment(BuildContext context) {
  con.fetchContactDetails();

  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 17),
    child: Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          border: Border.all(color: Colors.black54)),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                HeadingTextWidget(title: 'Payment Method'),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SubHeadingTextWidget(
                  title:
                  'Users have to pay on the following mentioned account of the YB-Ride Systems.Account #"${AppConstants.ybAccNumber}" YB-Ride system will confirm the payment and update the status within 2 hours of booking on working days.\nNote: Make sure to confirm the account holder name "${AppConstants.ybAccName}" while conforming the payments\nEmail: ${AppConstants.ybEmail}\nPhone:${AppConstants.ybPhone}',
                ),
                SizedBox(
                  height: 10,
                ),
              ],
            )
          ],
        ),
      ),
    ),
  );
}

Widget showAdminPaymentSmall(BuildContext context) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 17),
    child: Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          border: Border.all(color: Colors.black54)),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                HeadingTextWidget(
                  title: 'Payment Method',
                  fontSize: 15,
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SubHeadingTextWidget(
                  title:
                      'Users have to pay on the following mentioned account of the YB-Ride Systems.Account #"${AppConstants.ybAccNumber}" YB-Ride system will confirm the payment and update the status within 2 hours of booking on working days.\nNote: Make sure to confirm the account holder name "${AppConstants.ybAccName}" while conforming the payments\nEmail: ${AppConstants.ybEmail}\nPhone:${AppConstants.ybPhone}',
                  fontSize: 13,
                  textColor: Colors.black,
                ),
              ],
            )
          ],
        ),
      ),
    ),
  );
}
