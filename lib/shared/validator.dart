class Validator {
  //phone number validation
  static String? validatePhoneNumber(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter a phone number';
    }
    // Remove any non-digit characters
    final digitsOnly = value.replaceAll(RegExp(r'\D'), '');
    // Check if the phone number starts with 0
    if (digitsOnly.startsWith('0')) {
      return 'Phone number should not start with 0';
    }
    // Check if the phone number is at least 10 digits long
    if (digitsOnly.length < 8) {
      return 'Phone number should be at least 8 digits long';
    }
    return null;
  }

  //otp validation
  static String? validateOTP(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter an OTP';
    }
    // Remove any non-digit characters
    final digitsOnly = value.replaceAll(RegExp(r'\D'), '');
    // Check if the OTP is exactly 6 digits long
    if (digitsOnly.length != 6) {
      return 'OTP should be exactly 6 digits long';
    }
    return null;
  }

  //username validation
  static String? validateUsername(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter a username';
    }
    // Check if the username is at least 3 characters long
    if (value.length < 3) {
      return 'Username should be at least 3 characters long';
    }
    return null;
  }
}
