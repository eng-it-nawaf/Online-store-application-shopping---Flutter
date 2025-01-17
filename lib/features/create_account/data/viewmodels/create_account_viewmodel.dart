import 'package:flutter/foundation.dart';

class CreateAccountViewModel extends ChangeNotifier {
  String email = '';
  String password = '';
  String phoneNumber = '';

  void updateEmail(String newEmail) {
    email = newEmail;
    notifyListeners();
  }

  void updatePassword(String newPassword) {
    password = newPassword;
    notifyListeners();
  }

  void updatePhoneNumber(String newPhoneNumber) {
    phoneNumber = newPhoneNumber;
    notifyListeners();
  }
}
