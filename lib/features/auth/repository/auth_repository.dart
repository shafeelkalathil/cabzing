import 'dart:convert';
import 'package:cabzing_driverapp/common/utils/helpers/helpers_function.dart';
import 'package:cabzing_driverapp/common/utils/type_def/failure.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fpdart/fpdart.dart';
import 'package:http/http.dart' as http;
import '../../../common/utils/constants/api_constants.dart';
import '../../../common/utils/type_def/type_def.dart';
import '../../../model/user_login_model.dart';
import '../../invoice/screen/invoice.dart';

final authRepositoryProvider = Provider((ref) => AuthRepository());

class AuthRepository{
  Future<Either<Failure, Map<String, dynamic>>> login(BuildContext context, UserLoginDataModel userLoginDataModel) async {
    try {
      final String urlString = ApiConstants.loginBaseUrl + ApiConstants.users + ApiConstants.login;
      final Uri url = Uri.parse(urlString);

      final response = await http.post(
        url,
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode(userLoginDataModel.toJson()),
      );

      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        return Right(data);
      } else {
        return Left(Failure("Something went wrong"));
      }
    } catch (e) {
      return Left(Failure(e.toString()));
    }
  }


}