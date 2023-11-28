library arifpay_flutter_sdk;
import 'dart:convert';
import 'package:arifpay_flutter_sdk/validator.dart';
import 'package:http/http.dart' as http;
import 'Model/checkoutModel.dart';

class Arifpay {
  final String apiKey;
  late final Map<String, String> headers;

  static const String baseUrl = "https://gateway.arifpay.org/api/sandbox/checkout/session";

  Arifpay(this.apiKey) {
    headers = {
      'Content-Type': 'application/json',
      'x-arifpay-key': apiKey,
    };
  }

  Future<String> initializePayment(CheckoutModel checkoutModel) async {
    try {
      bool isValid = Validator.validateKeys(checkoutModel);
      if (!isValid) {
        return 'Invalid keys';
      }

      checkoutModel.generateNonce(); // Generate the nonce

      final response = await http.post(
        Uri.parse(Arifpay.baseUrl),
        headers: headers,
        body: jsonEncode(checkoutModel.toJson()),
      );

      if (response.statusCode == 200) {
        return response.body;
      } else if (response.statusCode == 400) {
        return 'Validation Error: ${response.body}';
      } else {
        return 'Request failed with status: ${response.statusCode}';
      }
    } catch (e) {
      return 'Error occurred: $e';
    }
  }
}