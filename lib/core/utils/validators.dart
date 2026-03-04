class Validators {
  static String? validateEmail(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Email or ID cannot be empty';
    }
    // You can add more complex email/ID validation logic here if needed.
    return null;
  }

  static String? validatePassword(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Password cannot be empty';
    }
    if (value.length < 4) {
      return 'Password must be at least 4 characters long';
    }
    return null;
  }
}
