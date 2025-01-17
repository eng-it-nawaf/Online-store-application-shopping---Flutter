class AccountModel {
  final String email;
  final String password;
  final String phoneNumber;

  AccountModel({
    required this.email,
    required this.password,
    required this.phoneNumber,
  });

  Map<String, dynamic> toJson() {
    return {
      'email': email,
      'password': password,
      'phone_number': phoneNumber,
    };
  }

  factory AccountModel.fromJson(Map<String, dynamic> json) {
    return AccountModel(
      email: json['email'],
      password: json['password'],
      phoneNumber: json['phone_number'],
    );
  }
}
