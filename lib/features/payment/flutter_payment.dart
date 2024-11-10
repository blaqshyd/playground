import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_paypal_checkout/flutter_paypal_checkout.dart';

import '../../core/env.dart';

class PaypalPayment extends StatefulWidget {
  const PaypalPayment({super.key});

  @override
  State<PaypalPayment> createState() => _PaypalPaymentState();
}

class _PaypalPaymentState extends State<PaypalPayment> {
  void _paymentMethod() {
    Navigator.of(context).push(MaterialPageRoute(
      builder: (BuildContext context) => PaypalCheckout(
        sandboxMode: true,
        clientId: Env.clientId,
        secretKey: Env.secretKey,
        returnURL: "https://sandbox.paypal.com",
        cancelURL: "https://sandbox.paypal.com",
        transactions: const [
          {
            "amount": {
              "total": '70',
              "currency": "USD",
              "details": {
                "subtotal": '70',
                "shipping": '0',
                "shipping_discount": 0
              }
            },
            "description": "The payment transaction description.",
            "item_list": {
              "items": [
                {
                  "name": "Apple",
                  "quantity": 4,
                  "price": '5',
                  "currency": "USD"
                },
                {
                  "name": "Pineapple",
                  "quantity": 5,
                  "price": '10',
                  "currency": "USD"
                }
              ],
              "shipping_address": {
                "recipient_name": "Raman Singh",
                "line1": "Delhi",
                "line2": "",
                "city": "Delhi",
                "country_code": "IN",
                "postal_code": "11001",
                "phone": "+00000000",
                "state": "Texas"
              },
            }
          }
        ],
        note: "PAYMENT_NOTE",
        onSuccess: (Map params) async {
          log("onSuccess: $params");
        },
        onError: (error) {
          log("onError: $error");
          Navigator.pop(context);
        },
        onCancel: () {
          log('cancelled:');
        },
      ),
    ));

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Paypal'),
      ),
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: _paymentMethod,
        tooltip: 'Increment',
        label: const Text('Checkout'),
        icon: const Icon(Icons.add),
      ),
    );
  }
}
