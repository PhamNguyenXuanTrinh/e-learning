import 'package:elearning/src/core/utils/constants/strings.dart';

class Validator {
  static String? validateUsername(String? value) {
    if (value == null || value.isEmpty) {
      return AppStrings.nullUsername;
    } else if (value.length < 6 ||
        value.contains(RegExp(r'[!#$%^&*(),.?":{}|<>]'))) {
      return AppStrings.shortUsername;
    }
    return null;
  }

  static String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return AppStrings.nullPassword;
    } else if (value.length < 6 ||
        value.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'))) {
      return AppStrings.shortPassword;
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

  static String? validateOtp(String? value) {
    if (value == null || value.isEmpty) {
      return AppStrings.nullOtp;
    } else if (value.length < 4) {
      return AppStrings.shortOtp;
    }
    return null;
  }
  // static bool isLoginValid(String username, String password) {
  //   // Example: Validate against hardcoded credentials
  //   return username == 'admin' && password == '12345656';
  // }
}
