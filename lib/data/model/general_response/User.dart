class User {
  String? username;
  String? firstName;
  String? lastName;
  String? email;
  String? phone;
  String? password;
  String? rePassword;

  User({
    this.username,
    this.firstName,
    this.lastName,
    this.email,
    this.phone,
    this.password,
    this.rePassword,
  });

  User.fromJson(dynamic json) {
    username = json['username'];
    firstName = json['firstName'];
    lastName = json['lastName'];
    email = json['email'];
    phone = json['phone'];
    password = json['password'];
    rePassword = json['rePassword'];
  }

  Map<String, dynamic> toJson() {
    return {
      'username': username,
      'firstName': firstName,
      'lastName': lastName,
      'email': email,
      'phone': phone,
      'password': password,
      'rePassword': rePassword,
    };
  }
}
