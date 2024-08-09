import 'package:cabzing_driverapp/common/utils/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../common/utils/constants/dimensions.dart';
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
        title: Text("Invoices"),
        showBackArrow: true,
      ),
      body: Column(
        children: [
          Divider(color: AppColors.borderColor,thickness: 1,),
          Padding(
            padding: EdgeInsets.all(screenWidth*0.05),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: screenWidth * 0.58,
                    child: TextFormField(
                      decoration: InputDecoration(
                        labelText: "Serach",
                        prefixIcon: Icon(Iconsax.search_normal)
                      ),
                    )),
                SizedBox(
                    width: screenWidth * 0.3,
                    child: ElevatedButton(onPressed: (){}, child: Text("Add Filters")))
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
                  return Padding(
                    padding: EdgeInsets.all(screenWidth*0.05),
                    child: Container(
                      width: screenWidth,
                      height: screenHeight * 0.06,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text("#InvoiceNo"),
                              Text("name"),
                            ],
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text('status'),
                              Text('SAR 10,000'),
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
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
