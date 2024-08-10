// To parse this JSON data, do
//
//     final userModel = userModelFromJson(jsonString);

import 'dart:convert';

UserModel userModelFromJson(String str) => UserModel.fromJson(json.decode(str));

String userModelToJson(UserModel data) => json.encode(data.toJson());

class UserModel {
  int statusCode;
  Data data;
  CustomerData customerData;

  UserModel({
    required this.statusCode,
    required this.data,
    required this.customerData,
  });

  UserModel copyWith({
    int? statusCode,
    Data? data,
    CustomerData? customerData,
  }) =>
      UserModel(
        statusCode: statusCode ?? this.statusCode,
        data: data ?? this.data,
        customerData: customerData ?? this.customerData,
      );

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
    statusCode: json["StatusCode"],
    data: Data.fromJson(json["data"]),
    customerData: CustomerData.fromJson(json["customer_data"]),
  );

  Map<String, dynamic> toJson() => {
    "StatusCode": statusCode,
    "data": data.toJson(),
    "customer_data": customerData.toJson(),
  };
}

class CustomerData {
  DateTime dateOfBirth;
  String country;
  int phone;
  String state;
  dynamic city;
  dynamic address;
  String photo;
  String countryName;
  String stateName;

  CustomerData({
    required this.dateOfBirth,
    required this.country,
    required this.phone,
    required this.state,
    required this.city,
    required this.address,
    required this.photo,
    required this.countryName,
    required this.stateName,
  });

  CustomerData copyWith({
    DateTime? dateOfBirth,
    String? country,
    int? phone,
    String? state,
    dynamic city,
    dynamic address,
    String? photo,
    String? countryName,
    String? stateName,
  }) =>
      CustomerData(
        dateOfBirth: dateOfBirth ?? this.dateOfBirth,
        country: country ?? this.country,
        phone: phone ?? this.phone,
        state: state ?? this.state,
        city: city ?? this.city,
        address: address ?? this.address,
        photo: photo ?? this.photo,
        countryName: countryName ?? this.countryName,
        stateName: stateName ?? this.stateName,
      );

  factory CustomerData.fromJson(Map<String, dynamic> json) => CustomerData(
    dateOfBirth: DateTime.parse(json["DateOfBirth"]),
    country: json["Country"],
    phone: json["Phone"],
    state: json["State"],
    city: json["City"],
    address: json["Address"],
    photo: json["photo"],
    countryName: json["CountryName"],
    stateName: json["StateName"],
  );

  Map<String, dynamic> toJson() => {
    "DateOfBirth": "${dateOfBirth.year.toString().padLeft(4, '0')}-${dateOfBirth.month.toString().padLeft(2, '0')}-${dateOfBirth.day.toString().padLeft(2, '0')}",
    "Country": country,
    "Phone": phone,
    "State": state,
    "City": city,
    "Address": address,
    "photo": photo,
    "CountryName": countryName,
    "StateName": stateName,
  };
}

class Data {
  String firstName;
  String lastName;
  String username;
  String email;

  Data({
    required this.firstName,
    required this.lastName,
    required this.username,
    required this.email,
  });

  Data copyWith({
    String? firstName,
    String? lastName,
    String? username,
    String? email,
  }) =>
      Data(
        firstName: firstName ?? this.firstName,
        lastName: lastName ?? this.lastName,
        username: username ?? this.username,
        email: email ?? this.email,
      );

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    firstName: json["first_name"],
    lastName: json["last_name"],
    username: json["username"],
    email: json["email"],
  );

  Map<String, dynamic> toJson() => {
    "first_name": firstName,
    "last_name": lastName,
    "username": username,
    "email": email,
  };
}
