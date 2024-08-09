import 'package:cabzing_driverapp/common/utils/constants/app_colors.dart';
import 'package:cabzing_driverapp/common/utils/style/widget/text_style.dart';
import 'package:cabzing_driverapp/features/invoice/screen/widgets/sales_details.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../common/utils/constants/dimensions.dart';
import '../../../common/utils/constants/image_constants.dart';
import '../../../common/widgets/appbar/appbar.dart';

class InvoiceScreen extends StatefulWidget {
  const InvoiceScreen({super.key});

  @override
  State<InvoiceScreen> createState() => _InvoiceScreenState();
}

class _InvoiceScreenState extends State<InvoiceScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CAppBar(
        title: Text("Invoices",style: customTextStyle(fontWeight: FontWeight.w500,fontSize: 16),),
        showBackArrow: true,
      ),
      body: Column(
        children: [
          Divider(color: AppColors.borderColor,thickness: 1,),
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
                        labelStyle: customTextStyle(color: Color(0xff8A8A8A),fontWeight: FontWeight.w400,fontSize: 14),
                        prefixIcon: Icon(Iconsax.search_normal,color: Color(0xff8A8A8A),)
                      ),
                    )),
                SizedBox(
                    width: screenWidth * 0.32,
                    child: ElevatedButton(onPressed: (){}, child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Image(image: AssetImage(ImageConstants.filterIcon)),
                        Text("Add Filters",style: customTextStyle(fontWeight: FontWeight.w400,fontSize: 15),),
                      ],
                    )))
              ],
            ),
          ),
          Divider(color: AppColors.borderColor,thickness: 1,),
          Container(
            width: screenWidth,
            height: screenHeight*0.7,
            child: ListView.separated(
              shrinkWrap: true,
                itemBuilder: (context, index) {
                  return SalesDetails(invoiceNo: '1052453576',customerName: "shafeel",status: "Invoiced",amount: "1000",);
                },
                separatorBuilder: (context, index) {
                  return Divider(color: AppColors.borderColor,thickness: 0.6);
                },
                itemCount: 10
            ),
          )
        ],
      ),
    );
  }
}


