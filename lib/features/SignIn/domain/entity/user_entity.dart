class UserEntity {

  String email;
  String userName;
  String uid;

  UserEntity({
    required this.email,
    required this.uid,
    required this.userName,
  });

  factory UserEntity.fromJson(Map<String, dynamic> json) => UserEntity(
        email: json["email"],
        userName: json["userName"],
        uid: json["uid"],
      );

  Map<String, dynamic> toJson() => {
        "email": email,
        "userName": userName,
        "uid": uid,
      };


}