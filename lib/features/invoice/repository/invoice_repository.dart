import 'dart:convert';
import 'package:cabzing_driverapp/model/sales_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fpdart/fpdart.dart';
import 'package:http/http.dart' as http;
import '../../../common/utils/constants/api_constants.dart';
import '../../../common/utils/type_def/failure.dart';
import '../../../model/get_invoice_model.dart';

final invoiceRepositoryProvider = Provider((ref) => InvoiceRepository());

class InvoiceRepository{

  Future<Either<Failure, List<SalesModel>>> fetchSalesData(BuildContext context, GetInvoiceModel getInvoiceModel, String token) async {
    try {
      final String urlString = ApiConstants.baseUrl + ApiConstants.sales + ApiConstants.salesList;
      final Uri url = Uri.parse(urlString);

      final response = await http.post(
        url,
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',
        },
        body: jsonEncode(getInvoiceModel.toJson()),
      );

      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        if (data["StatusCode"] == 6000) {
          List<SalesModel> salesList = (data["data"] as List)
              .map((item) => SalesModel.fromJson(item))
              .toList();
          return Right(salesList);
        } else {
          return Left(Failure("Unexpected status code: ${data["StatusCode"]}"));
        }
      } else {
        return Left(Failure("Something went wrong"));
      }
    } catch (e) {
      return Left(Failure(e.toString()));
    }
  }

}