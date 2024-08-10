// To parse this JSON data, do
//
//     final getInvoiceModel = getInvoiceModelFromJson(jsonString);

import 'dart:convert';

GetInvoiceModel getInvoiceModelFromJson(String str) => GetInvoiceModel.fromJson(json.decode(str));

String getInvoiceModelToJson(GetInvoiceModel data) => json.encode(data.toJson());

class GetInvoiceModel {
  int branchId;
  String companyId;
  int createdUserId;
  int priceRounding;
  int pageNo;
  int itemsPerPage;
  String type;
  int warehouseId;

  GetInvoiceModel({
    required this.branchId,
    required this.companyId,
    required this.createdUserId,
    required this.priceRounding,
    required this.pageNo,
    required this.itemsPerPage,
    required this.type,
    required this.warehouseId,
  });

  GetInvoiceModel copyWith({
    int? branchId,
    String? companyId,
    int? createdUserId,
    int? priceRounding,
    int? pageNo,
    int? itemsPerPage,
    String? type,
    int? warehouseId,
  }) =>
      GetInvoiceModel(
        branchId: branchId ?? this.branchId,
        companyId: companyId ?? this.companyId,
        createdUserId: createdUserId ?? this.createdUserId,
        priceRounding: priceRounding ?? this.priceRounding,
        pageNo: pageNo ?? this.pageNo,
        itemsPerPage: itemsPerPage ?? this.itemsPerPage,
        type: type ?? this.type,
        warehouseId: warehouseId ?? this.warehouseId,
      );

  factory GetInvoiceModel.fromJson(Map<String, dynamic> json) => GetInvoiceModel(
    branchId: json["BranchID"],
    companyId: json["CompanyID"],
    createdUserId: json["CreatedUserID"],
    priceRounding: json["PriceRounding"],
    pageNo: json["page_no"],
    itemsPerPage: json["items_per_page"],
    type: json["type"],
    warehouseId: json["WarehouseID"],
  );

  Map<String, dynamic> toJson() => {
    "BranchID": branchId,
    "CompanyID": companyId,
    "CreatedUserID": createdUserId,
    "PriceRounding": priceRounding,
    "page_no": pageNo,
    "items_per_page": itemsPerPage,
    "type": type,
    "WarehouseID": warehouseId,
  };
}
