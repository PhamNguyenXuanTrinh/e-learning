class Validator {
  static String? validateUsername(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your username';
    } else if (value.length < 6 ||
        value.contains(RegExp(r'[!#$%^&*(),.?":{}|<>]'))) {
      return 'Username must be 6 characters long';
    }
    return null;
  }

  static String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your password';
    } else if (value.length < 6 ||
        value.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'))) {
      return 'Password must be 6 characters long ';
    }
    return null;
  }

  static String? validatePhone(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your phone number';
    } else if (value.length < 10) {
      return 'Phone number must be at least 10 digits';
    }
    return null;
  }

  static String? validateOtp(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your phone number';
    } else if (value.length < 4) {
      return 'Phone number must be at least 4 digits';
    }
    return null;
  }
  // static bool isLoginValid(String username, String password) {
  //   // Example: Validate against hardcoded credentials
  //   return username == 'admin' && password == '12345656';
  // }
}
