class CustomerModel {
  String email;
  String firstname;
  String lastName;
  String password;

  CustomerModel({
    required this.email,
    required this.firstname,
    required this.lastName,
    required this.password,
  });

  Map<String, dynamic> toJson() {
    Map<String, dynamic> map = {};

    map.addAll({
      'email': email,
      'firstname': firstname,
      'lastName': lastName,
      'password': password,
    });

    return map;
  }
}
