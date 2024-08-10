import 'package:cabzing_driverapp/common/utils/constants/app_colors.dart';
import 'package:cabzing_driverapp/common/utils/style/widget/text_style.dart';
import 'package:cabzing_driverapp/features/auth/controller/auth_controller.dart';
import 'package:cabzing_driverapp/features/invoice/screen/filter_screen.dart';
import 'package:cabzing_driverapp/features/invoice/screen/widgets/sales_details.dart';
import 'package:cabzing_driverapp/model/get_invoice_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:iconsax/iconsax.dart';

import '../../../common/utils/constants/dimensions.dart';
import '../../../common/utils/constants/image_constants.dart';
import '../../../common/utils/helpers/helpers_function.dart';
import '../../../common/widgets/appbar/appbar.dart';
import '../../../model/sales_model.dart';
import '../contoller/invoice_controller.dart';

class InvoiceScreen extends ConsumerStatefulWidget {
  const InvoiceScreen({super.key});

  @override
  ConsumerState<InvoiceScreen> createState() => _InvoiceScreenState();
}

class _InvoiceScreenState extends ConsumerState<InvoiceScreen> {

  Future<List<SalesModel>> fetchSalesData() async {
   final userId = ref.watch(currentUserId);
    GetInvoiceModel getInvoiceModel = GetInvoiceModel(
        branchId: 1,
        companyId: "1901b825-fe6f-418d-b5f0-7223d0040d08",
        createdUserId: userId,
        priceRounding: 2,
        pageNo: 1,
        itemsPerPage: 10,
        type: "Sales",
        warehouseId: 1
    );
    return ref.read(invoiceControllerProvider.notifier).fetchSalesData(context, getInvoiceModel);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CAppBar(
        title: Text("Invoices",style: customTextStyle(fontWeight: FontWeight.w500,fontSize: 16),),
        showBackArrow: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const Divider(color: AppColors.borderColor,thickness: 1,),
            Padding(
              padding: EdgeInsets.all(screenWidth*0.04),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: screenWidth * 0.58,
                      child: TextFormField(
                        decoration: InputDecoration(
                          labelText: "Serach",
                          labelStyle: customTextStyle(color: const Color(0xff8A8A8A),fontWeight: FontWeight.w400,fontSize: 14),
                          prefixIcon: const Icon(Iconsax.search_normal,color: Color(0xff8A8A8A),)
                        ),
                      )),
                  SizedBox(
                      width: screenWidth * 0.32,
                      child: ElevatedButton(onPressed: (){
                        CAppHelperFunction.navigateToScreen(context,const FilterScreen());
                      }, child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Image(image: AssetImage(ImageConstants.filterIcon)),
                          Text("Add Filters",style: customTextStyle(fontWeight: FontWeight.w400,fontSize: 15),),
                        ],
                      )))
                ],
              ),
            ),
            const Divider(color: AppColors.borderColor,thickness: 1,),
            SizedBox(
              width: screenWidth,
              height: screenHeight*0.7,
              child: FutureBuilder<List<SalesModel>>(
                future: fetchSalesData(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (snapshot.hasError) {
                    return Center(child: Text('Error: ${snapshot.error}'));
                  } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                    return const Center(child: Text('No data available'));
                  } else {
                    return ListView.builder(
                      itemCount: snapshot.data!.length,
                      itemBuilder: (context, index) {
                        SalesModel sales = snapshot.data![index];
                        return SalesDetails(
                          amount: sales.grandTotal.toString(),
                          status: sales.status,
                          customerName: sales.customerName,
                          invoiceNo: sales.voucherNo,
                        );
                      },
                    );
                  }
                },
              ),

            )
          ],
        ),
      ),
    );
  }
}


