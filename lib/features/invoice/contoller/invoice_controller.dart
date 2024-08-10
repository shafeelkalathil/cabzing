



import 'package:cabzing_driverapp/model/get_invoice_model.dart';
import 'package:cabzing_driverapp/model/sales_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../common/utils/helpers/helpers_function.dart';
import '../../auth/controller/auth_controller.dart';
import '../repository/invoice_repository.dart';

final invoiceControllerProvider =
StateNotifierProvider<InvoiceController, bool>((ref) {
  return InvoiceController(
    invoiceRepository: ref.watch(invoiceRepositoryProvider),
    ref: ref,
  );
});



class InvoiceController extends StateNotifier<bool> {
  final InvoiceRepository _invoiceRepository;
  final Ref _ref;
  InvoiceController({required InvoiceRepository invoiceRepository, required Ref ref})
      : _invoiceRepository = invoiceRepository,
        _ref = ref,
        super(false);

  Future<List<SalesModel>> fetchSalesData(BuildContext context, GetInvoiceModel getInvoiceModel) async {
    try {
      String token = _ref.watch(currentUserToken);
      final res = await _invoiceRepository.fetchSalesData(context, getInvoiceModel, token);
      return res.fold((l) {
          CAppHelperFunction.showSnackBar(l.message, context);
          throw Exception(l.message);
        }, (r) => r,);
    } catch (e) {
      CAppHelperFunction.showSnackBar(e.toString(), context);
      throw Exception(e.toString());
    }
  }

}


