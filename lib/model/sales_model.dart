// To parse this JSON data, do
//
//     final salesModel = salesModelFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

SalesModel salesModelFromJson(String str) => SalesModel.fromJson(json.decode(str));

String salesModelToJson(SalesModel data) => json.encode(data.toJson());

class SalesModel {
  int index;
  String id;
  String voucherNo;
  DateTime date;
  String ledgerName;
  double totalGrossAmtRounded;
  double totalTaxRounded;
  int grandTotalRounded;
  String customerName;
  double totalTax;
  String status;
  int grandTotal;
  bool isBillwised;
  String billwiseStatus;

  SalesModel({
    required this.index,
    required this.id,
    required this.voucherNo,
    required this.date,
    required this.ledgerName,
    required this.totalGrossAmtRounded,
    required this.totalTaxRounded,
    required this.grandTotalRounded,
    required this.customerName,
    required this.totalTax,
    required this.status,
    required this.grandTotal,
    required this.isBillwised,
    required this.billwiseStatus,
  });

  SalesModel copyWith({
    int? index,
    String? id,
    String? voucherNo,
    DateTime? date,
    String? ledgerName,
    double? totalGrossAmtRounded,
    double? totalTaxRounded,
    int? grandTotalRounded,
    String? customerName,
    double? totalTax,
    String? status,
    int? grandTotal,
    bool? isBillwised,
    String? billwiseStatus,
  }) =>
      SalesModel(
        index: index ?? this.index,
        id: id ?? this.id,
        voucherNo: voucherNo ?? this.voucherNo,
        date: date ?? this.date,
        ledgerName: ledgerName ?? this.ledgerName,
        totalGrossAmtRounded: totalGrossAmtRounded ?? this.totalGrossAmtRounded,
        totalTaxRounded: totalTaxRounded ?? this.totalTaxRounded,
        grandTotalRounded: grandTotalRounded ?? this.grandTotalRounded,
        customerName: customerName ?? this.customerName,
        totalTax: totalTax ?? this.totalTax,
        status: status ?? this.status,
        grandTotal: grandTotal ?? this.grandTotal,
        isBillwised: isBillwised ?? this.isBillwised,
        billwiseStatus: billwiseStatus ?? this.billwiseStatus,
      );

  factory SalesModel.fromJson(Map<String, dynamic> json) => SalesModel(
    index: json["index"],
    id: json["id"],
    voucherNo: json["VoucherNo"],
    date: DateTime.parse(json["Date"]),
    ledgerName: json["LedgerName"],
    totalGrossAmtRounded: json["TotalGrossAmt_rounded"]?.toDouble(),
    totalTaxRounded: json["TotalTax_rounded"]?.toDouble(),
    grandTotalRounded: json["GrandTotal_Rounded"],
    customerName: json["CustomerName"],
    totalTax: json["TotalTax"]?.toDouble(),
    status: json["Status"],
    grandTotal: json["GrandTotal"],
    isBillwised: json["is_billwised"],
    billwiseStatus: json["billwise_status"],
  );

  Map<String, dynamic> toJson() => {
    "index": index,
    "id": id,
    "VoucherNo": voucherNo,
    "Date": "${date.year.toString().padLeft(4, '0')}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}",
    "LedgerName": ledgerName,
    "TotalGrossAmt_rounded": totalGrossAmtRounded,
    "TotalTax_rounded": totalTaxRounded,
    "GrandTotal_Rounded": grandTotalRounded,
    "CustomerName": customerName,
    "TotalTax": totalTax,
    "Status": status,
    "GrandTotal": grandTotal,
    "is_billwised": isBillwised,
    "billwise_status": billwiseStatus,
  };
}
