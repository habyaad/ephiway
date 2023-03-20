class User {
  User({
    this.id,
    required this.username,
    required this.email,
    required this.password,
  });

  final String? id;
  final String username;
  final String email;
  final String password;

  factory User.fromJson(Map<String, dynamic> json){
    return User(
      id: json["id"],
      username: json["username"],
      email: json["email"],
      password: json["password"],
    );
  }

  Map<String, dynamic> toJson() => {
    "id": id,
    "username": username,
    "email": email,
    "password": password,
  };

}
