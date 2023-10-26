class UserModel {
  final String uid;
  final String email;
  final String name;
  final String role;

  UserModel({
    required this.uid,
    required this.email,
    required this.name,
    required this.role,
  });

  Map<String, dynamic> toJson() => {
        'uid': uid,
        'email': email,
        'name': name,
        'role': role,
      };

  static UserModel fromJson(Map<String, dynamic> json) => UserModel(
      uid: json['uid'],
      email: json['email'],
      name: json['name'],
      role: json['role']);
}
