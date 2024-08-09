class UserLoginDataModel {
  String username;
  String password;
  bool isMobile;

  UserLoginDataModel({
    required this.username,
    required this.password,
    required this.isMobile,
  });

  UserLoginDataModel copyWith({
    String? username,
    String? password,
    bool? isMobile,
  }) =>
      UserLoginDataModel(
        username: username ?? this.username,
        password: password ?? this.password,
        isMobile: isMobile ?? this.isMobile,
      );

  factory UserLoginDataModel.fromJson(Map<String, dynamic> json) => UserLoginDataModel(
    username: json["username"],
    password: json["password"],
    isMobile: json["is_mobile"],
  );

  Map<String, dynamic> toJson() => {
    "username": username,
    "password": password,
    "is_mobile": isMobile,
  };
}