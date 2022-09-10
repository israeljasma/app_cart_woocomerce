class UserModel {
  final int id;
  final String email;
  final String firstname;
  final String lastname;
  final String avatar;
  UserModel({
    required this.id,
    required this.email,
    required this.firstname,
    required this.lastname,
    required this.avatar,
  });
  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'],
      email: json['email'],
      firstname: json['firstname'] ?? 'firstname',
      lastname: json['lastname'] ?? 'lastname',
      avatar: json['avatar'] ??
          'https://i0.wp.com/imgs.hipertextual.com/wp-content/uploads/2022/05/avatar-2-disney.jpg?fit=2500%2C1406&quality=60&strip=all&ssl=1',
    );
  }
}
