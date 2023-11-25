import 'package:elearning/src/core/utils/constants/strings.dart';

class Validator {
  static String? validateUsername(String? value) {
    if (value == null || value.isEmpty) {
      return AppStrings.nullUsername;
    } else if (!RegExp(r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$')
        .hasMatch(value)) {
      return AppStrings.invalidEmail;
    }
    return null;
  }

  static String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return AppStrings.nullPassword;
    } else if (value.length < 6) {
      return AppStrings.shortPassword;
    } else if (RegExp(r'[!@#$%^&*(),.?":{}|<>]').hasMatch(value)) {
      return AppStrings.specialChars;
    }
    return null;
  }

  static String? validatePhone(String? value) {
    if (value == null || value.isEmpty) {
      return AppStrings.nullNumberPhone;
    } else if (value.length < 10) {
      return AppStrings.shortNumberPhone;
    }
    return null;
  }

  static bool validateOtp(String value) {
    return value.length == 4;
  }
  // static bool isLoginValid(String username, String password) {
  //   // Example: Validate against hardcoded credentials
  //   return username == 'admin' && password == '12345656';
  // }
}
