import 'package:flutter/cupertino.dart';

class CheckoutModel {
  String cancelUrl;
  String nonce;
  String phone;
  String email;
  String errorUrl;
  String notifyUrl;
  String successUrl;
  List<String> paymentMethods = [];
  String expireDate;
  List<CheckoutItem> items = [];
  List<Beneficiary> beneficiaries = [];
  String lang;

  CheckoutModel({
    required this.cancelUrl,
   // required this.nonce,
    required this.phone,
    required this.email,
    required this.errorUrl,
    required this.notifyUrl,
    required this.successUrl,
    required this.paymentMethods,
    required this.expireDate,
    required this.items,
    required this.beneficiaries,
    required this.lang,
  }) : nonce = '' {
    generateNonce(); // Generate the nonce during object creation
  }

  void generateNonce() {
    nonce = UniqueKey().toString();
  }
  Map<String, dynamic> toJson() {
    return {
      'cancelUrl': cancelUrl,
     'nonce': nonce,
      'phone': phone,
      'email': email,
      'errorUrl': errorUrl,
      'notifyUrl': notifyUrl,
      'successUrl': successUrl,
      'paymentMethods': paymentMethods,
      'expireDate': expireDate,
      'items': items.map((item) => item.toJson()).toList(),
      'beneficiaries': beneficiaries.map((beneficiary) => beneficiary.toJson()).toList(),
      'lang': lang,
    };
  }
}

class CheckoutItem {
  String name;
  double price;
  int quantity;
  String description;
  String image;

  CheckoutItem({
    required this.name,
    required this.price,
    required this.quantity,
    required this.description,
    required this.image,
  });

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'price': price,
      'quantity': quantity,
      'description': description,
      'image': image,
    };
  }
}

class Beneficiary {
  String accountNumber;
  String bank;
  double amount;

  Beneficiary({
    required this.accountNumber,
    required this.amount,
    required this.bank,
  });

  Map<String, dynamic> toJson() {
    return {
      'accountNumber': accountNumber,
      'bank': bank,
      'amount': amount,
    };
  }
}
