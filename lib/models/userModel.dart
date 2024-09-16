class UserModel {
  String id;
  String username;
  String phone;
  String email;
  bool emailVerfied;

  UserModel({
    required this.id,
    required this.username,
    this.phone = "",
    required this.email,
    this.emailVerfied = false,
  });

  UserModel.fromJson(Map<String, dynamic> json)
      : this(
            id: json['id'],
            email: json['email'],
            phone: json['phone'],
            username: json['username'],
            emailVerfied: json['emailVerfied']);

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'email': email,
      'phone': phone,
      'username': username,
      'emailVerfied': emailVerfied
    };
  }
}
