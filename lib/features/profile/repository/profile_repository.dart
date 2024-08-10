import 'dart:convert';
import 'package:cabzing_driverapp/model/user_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fpdart/fpdart.dart';
import 'package:http/http.dart' as http;
import '../../../common/utils/constants/api_constants.dart';
import '../../../common/utils/type_def/failure.dart';

final profileRepositoryProvider = Provider((ref) => ProfileRepository());

class ProfileRepository{

  Future<Either<Failure,UserModel>> fetchUserData(String token,int userId) async {
    final String urlString = '${ApiConstants.baseUrl}${ApiConstants.users}${ApiConstants.usersView}$userId';
    final Uri url = Uri.parse(urlString);

    try {
      final response = await http.get(
        url,
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token', // Add the token here
        },
      );

      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        return Right(UserModel.fromJson(data)); // Return the UserModel
      } else {

        return Left(Failure(response.statusCode.toString()));
      }
    } catch (e) {

      return Left(Failure(e.toString()));
    }
  }



}