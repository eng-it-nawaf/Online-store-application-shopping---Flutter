import 'dart:convert';
import 'package:http/http.dart' as http;
import '../constants/strings.dart';

class ApiService {
  Future<void> createAccount(Map<String, dynamic> accountData) async {
    final response = await http.post(
      Uri.parse('${Strings.apiBaseUrl}/create-account'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(accountData),
    );

    if (response.statusCode == 200) {
      // Handle success response
    } else {
      // Handle error response
      throw Exception('Failed to create account');
    }
  }
}
