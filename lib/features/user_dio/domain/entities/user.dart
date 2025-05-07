class User {
  final int? id;
  final String name;
  final String email;
  final String password;
  final String alias;

  User({
    this.id,
    required this.name,
    required this.email,
    required this.password,
    required this.alias,
  });

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'password': password,
      'alias': alias,
    };
  }

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      name: json['name'],
      email: json['email'],
      password: json['password'],
      alias: json['alias'],
    );
  }
}
