import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class PaymentController extends GetxController {

  dynamic paymentIntent;

  displayPaymentSheet(BuildContext context) async {
    try {
      await Stripe.instance.presentPaymentSheet().then((value) {
        print(":::::::::::DisplaypaymentResponse:::::::::::");
        print(value);

        showDialog(
            context: context,
            builder: (_) => AlertDialog(
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    Icons.check_circle,
                    color: Colors.green,
                    size: 100.0,
                  ),
                  SizedBox(height: 10.0),
                  Text("Payment Successful!"),
                  SizedBox(height: 10.0),
                ],
              ),
            ));

        paymentIntent = null;
      }).onError((error, stackTrace) {
        throw Exception(error);
      });
    } on StripeException catch (e) {
      print('Error is:---> $e');
      AlertDialog(
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              children: const [
                Icon(
                  Icons.cancel,
                  color: Colors.red,
                ),
                Text("Payment Failed"),
              ],
            ),
          ],
        ),
      );
    } catch (e) {
      print('$e');
    }
  }

  createPaymentIntent(
      // String currency, double totalAmount
      ) async {
    try {
      //Request body
      Map<String, dynamic> body =  {


        "payment_method_data": {
          "billing_details": {
            "address": {
              "country": "PK"
            }
          },
          "type": "card",
          "card": {
            "number": "4242424242424242",
            "exp_month": "4",
            "cvc": "134",
            "exp_year": "24"
          },

          "payment_user_agent": "stripe-ios/23.18.3; variant.legacy; PaymentSheet"
        },
        // "client_secret": "********************",
        "use_stripe_sdk": "true",
        "expand": {
          "0": "payment_method"
        },
        'amount': '800',
        'currency': 'USD',
        'receipt_email': 'hamza@gmail.com',
        'description': 'YB-Car rent for ' +
            '8' +
            ' days',

        // Make post request to Stripe

        // 'amount': calculateDoubleAmount(800),
        // 'currency': 'USD',
        // 'receipt_email': 'hamza@gmail.com',
        // 'description': 'YB-Car rent for ' +
        //     '8' +
        //     ' days',

      };
      // {
      //
      //   // 'amount': calculateAmount(amount),
      //   'amount': calculateDoubleAmount(totalAmount),
      //   'currency': currency,
      //   'receipt_email': 'hamza@gmail.com',
      //   'description': 'YB-Car rent for ' +
      //       '7' +
      //       ' days',
      //   // The description of Payment
      // };

      //Make post request to Stripe
      var response = await http.post(
        Uri.parse('https://api.stripe.com/v1/payment_intents'),
        headers: {
          'Authorization': 'Bearer sk_test_51Ogo46EwduwUAGBR6619v0dguE6DlSE4n461X2P3SPjB36K9zAqbU8lQyp7WuqIMQatRCsf7LQx7w5nKAfRKluYy00k7p6obF5',
          'Content-Type': 'application/x-www-form-urlencoded',
        },
        body: body,
      );
      print(":::::::::::Create Payment Intent :::::::::::::");
      final data = json.decode(response.body);
      var paymentId = data['id'].toString();
      print('id:'+paymentId.toString(),);
      return json.decode(response.body);
    } catch (err) {
      print('error:'+err.toString());
      throw Exception(err.toString());
    }
  }

  Future<void> makePayment(BuildContext context, double totalAmount) async {
    try {
      //STEP 1: Create Payment Intent
      // paymentIntent = await createPaymentIntent('USD', totalAmount);
      //STEP 2: Initialize Payment Sheet
      await Stripe.instance
          .initPaymentSheet(
          paymentSheetParameters: SetupPaymentSheetParameters(
              paymentIntentClientSecret: paymentIntent!['client_secret'],
              //Gotten from payment intent
              style: ThemeMode.light,
              merchantDisplayName: 'YB-Ride'))
          .then((value) {});

      //STEP 3: Display Payment sheet
      displayPaymentSheet(context);
    } catch (err) {
      throw Exception(err);
    }
  }

  calculateAmount(String amount) {
    final calculatedAmout = (int.parse(amount)) * 100;
    return calculatedAmout.toString();
  }

  String calculateDoubleAmount(double amount) {
    int result = (amount * 100).round();
    return result.toString(); // Output: 16375
  }


  Future<String?> sendPaymentRequest() async {
    // Replace 'your_secret_key' with your actual secret key from Stripe
    String secretKey = 'sk_test_51Ogo46EwduwUAGBR6619v0dguE6DlSE4n461X2P3SPjB36K9zAqbU8lQyp7WuqIMQatRCsf7LQx7w5nKAfRKluYy00k7p6obF5';

    // Create a map representing the payment details
    Map<String, dynamic> paymentDetails = {

      'amount': 1000, // Example amount in cents (e.g., $10.00)
      'currency': 'USD', // Example currency
      'description': 'Example payment',
      'payment_method_data': {
        'type': 'card',

        'card': {
          'number': '4242424242424242', // Example card number
          'exp_month': 12, // Example expiration month
          'exp_year': 2025, // Example expiration year
          'cvc': '123', // Example security code
        },
      }, // Example description
    };

    // Send the POST request to Stripe
    http.Response response = await http.post(
      Uri.parse('https://api.stripe.com/v1/payment_intents'),
      headers: {
        'Authorization': 'Bearer $secretKey',
        'Content-Type': 'application/json',
      },
      body: json.encode(paymentDetails),
    );

    // Check the response status
    if (response.statusCode == 200 || response.statusCode == 201) {
      // Payment successful
      Map<String, dynamic> responseData = jsonDecode(response.body);
      String paymentId = responseData['id'];
      print('Payment successful. Payment ID: $paymentId');
      return paymentId;
    } else {
      // Payment failed
      print('Payment failed: ${response.body}');
      return null;
    }
  }




}
