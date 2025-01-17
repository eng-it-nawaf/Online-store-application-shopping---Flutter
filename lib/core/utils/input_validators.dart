class InputValidators {
  static String? validateEmail(String email) {
    final emailRegex = RegExp(r'^[^@]+@[^@]+\.[^@]+');
    if (email.isEmpty) return 'Email cannot be empty';
    if (!emailRegex.hasMatch(email)) return 'Enter a valid email';
    return null;
  }

  static String? validatePassword(String password) {
    if (password.isEmpty) return 'Password cannot be empty';
    if (password.length < 6) return 'Password must be at least 6 characters';
    return null;
  }
}
