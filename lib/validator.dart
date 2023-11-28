
import 'Model/checkoutModel.dart';

class Validator {
  static bool validateKeys(CheckoutModel checkout) {
    if (checkout.cancelUrl.trim().isEmpty || !isValidUrl(checkout.cancelUrl)) {
      showErrorToast("Invalid or missing cancel URL.");
      return false;
    }

    if (checkout.phone.trim().isEmpty || !isNumeric(checkout.phone)) {
      showErrorToast("Invalid or missing phone number.");
      return false;
    }
    if (checkout.email.trim().isEmpty || !isValidEmail(checkout.email)) {
      showErrorToast("Invalid or missing email address.");
      return false;
    }
    if (checkout.errorUrl.trim().isEmpty || !isValidUrl(checkout.errorUrl)) {
      showErrorToast("Invalid or missing error URL.");
      return false;
    }
    if (checkout.notifyUrl.trim().isEmpty || !isValidUrl(checkout.notifyUrl)) {
      showErrorToast("Invalid or missing notify URL.");
      return false;
    }
    if (checkout.successUrl.trim().isEmpty || !isValidUrl(checkout.successUrl)) {
      showErrorToast("Invalid or missing success URL.");
      return false;
    }
    if (checkout.paymentMethods.isEmpty) {
      showErrorToast("At least one payment method is required.");
      return false;
    }
    if (checkout.expireDate.trim().isEmpty) {
      showErrorToast("Expiration date is required.");
      return false;
    }
    if (checkout.items.isEmpty) {
      showErrorToast("At least one item is required.");
      return false;
    }
    if (checkout.beneficiaries.isEmpty) {
      showErrorToast("At least one beneficiary is required.");
      return false;
    }
    if (checkout.lang.trim().isEmpty) {
      showErrorToast("Language is required.");
      return false;
    }

    return true;
  }

  static bool isValidUrl(String url) {

    // Regular expression pattern for URL validation
    const pattern = r'^https?:\/\/(?:www\.|(?!www))[^\s.]+\.[^\s]{2,}|www\.[^\s]+\.[^\s]{2,}$';
    final regex = RegExp(pattern);
    return regex.hasMatch(url);
  }

  static bool isValidEmail(String email) {
    // Regular expression pattern for email validation
    const pattern = r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$';
    final regex = RegExp(pattern);
    return regex.hasMatch(email);
  }

  static bool isNumeric(String value) {
    // Regular expression pattern for numeric validation
    const pattern = r'^\d+$';
    final regex = RegExp(pattern);
    return regex.hasMatch(value);
  }

  static void showErrorToast(String message) {
    // Implement your error toast display logic here
    print("Error: $message");
  }
}