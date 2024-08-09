import 'dart:convert';
import 'package:cabzing_driverapp/model/user_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fpdart/fpdart.dart';
import 'package:http/http.dart' as http;
import '../../../common/utils/constants/api_constants.dart';
import '../../../common/utils/type_def/failure.dart';

final homeRepositoryProvider = Provider((ref) => HomeRepository());

class HomeRepository{

  // Future<Either<Failure, Map<String, dynamic>>> login(BuildContext context) async {
  //   try {
  //
  //     final String urlString = ApiConstants.baseUrl + ApiConstants.sales + ApiConstants.salesList;
  //     final Uri url = Uri.parse(urlString);
  //
  //     final response = await http.post(
  //       url,
  //       headers: {'Content-Type': 'application/json'},
  //       body: jsonEncode(userLoginDataModel.toJson()),
  //     );
  //
  //     if (response.statusCode == 200) {
  //       var data = jsonDecode(response.body);
  //       return Right(data);
  //     } else {
  //       return Left(Failure("Something went wrong"));
  //     }
  //   } catch (e) {
  //     return Left(Failure(e.toString()));
  //   }
  // }

}