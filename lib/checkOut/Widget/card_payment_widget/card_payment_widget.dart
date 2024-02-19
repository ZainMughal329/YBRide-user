import 'package:flutter/material.dart';

import '../../../components/headingTextWidget.dart';
import '../../../components/subHeadingText.dart';

Widget showAdminPayment(BuildContext context) {
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
                      'The payment is send to the admin on the following card number and after the payment is received the trip has been approved.',
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    HeadingTextWidget(title: 'Note: '),
                    Flexible(
                      child: SubHeadingTextWidget(
                          title:
                              ' Make sure the Card Holder Name and the name while booking the trip is same.'),
                    ),
                  ],
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
                      'The payment is send to the admin on the following card number and after the payment is received the trip has been approved.',
                  fontSize: 13,
                  textColor: Colors.black,
                ),
                SizedBox(
                  height: 10,
                ),

                Row(
                  children: [
                    HeadingTextWidget(
                      title: 'Note: ',
                      fontSize: 15,
                    ),
                    Flexible(
                      child: SubHeadingTextWidget(
                        title:
                            ' Make sure the Card Holder Name and the name while booking the trip is same.',
                        fontSize: 13,
                        maxLines: 3,
                        textColor: Colors.black,
                      ),
                    ),
                  ],
                ),
              ],
            )
          ],
        ),
      ),
    ),
  );
}
