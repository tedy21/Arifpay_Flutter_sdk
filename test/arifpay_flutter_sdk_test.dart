import 'package:arifpay_flutter_sdk/arifpay_flutter_sdk.dart';
import 'package:arifpay_flutter_sdk/Model/checkoutModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:logger/logger.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final arifPay =  Arifpay("tZzd6Kd34xXfY7GNAi9eMjjLeaNXuxYR");

  final logger = Logger();

  CheckoutModel checkoutModel = CheckoutModel(
    cancelUrl: "https://example.com",
    phone: "251944294981",
    email: "natnael@arifpay.net",
    errorUrl: "http://error.com",
    notifyUrl: "https://gateway.arifpay.net/test/callback",
    successUrl: "http://example.com",
    paymentMethods: ["TELEBIRR"],
    expireDate: "2025-02-01T03:45:27",
    items: [
      CheckoutItem(
        name: "ሙዝ",
        quantity: 1,
        price: 1,
        description: "Fresh Corner preimuim Banana.",
        image: "https://4.imimg.com/data4/KK/KK/GLADMIN-/product-8789_bananas_golden-500x500.jpg",
      ),
      CheckoutItem(
        name: "ሙዝ",
        quantity: 3,
        price: 1,
        description: "Fresh Corner preimuim Banana.",
        image: "",
      ),
    ],
    beneficiaries: [
      Beneficiary(
        accountNumber: "01320811436100",
        bank: "AWINETAA",
        amount: 4.0,
      ),
    ],
    lang: "EN",
  );

  final responseUrl = await arifPay.initializePayment(checkoutModel);
  logger.d('Response: $responseUrl');
}