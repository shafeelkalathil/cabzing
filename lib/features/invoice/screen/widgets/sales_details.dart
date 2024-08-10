import 'package:cabzing_driverapp/common/utils/style/widget/text_style.dart';
import 'package:flutter/material.dart';

import '../../../../common/utils/constants/dimensions.dart';

class SalesDetails extends StatelessWidget {
  const SalesDetails({
    super.key, required this.invoiceNo, required this.customerName, required this.status, required this.amount,
  });

  final String invoiceNo,customerName,status,amount;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(screenWidth*0.05),
      child: SizedBox(
        width: screenWidth,
        height: screenHeight * 0.06,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text("#",style: customTextStyle(color: const Color(0xff7D7D7D),fontWeight: FontWeight.w400,fontSize: 14),),
                    Text(invoiceNo,style: customTextStyle(fontWeight: FontWeight.w400,fontSize: 14),),
                  ],
                ),
                Text(customerName,style: customTextStyle(fontWeight: FontWeight.w500,fontSize: 14),),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(status,style: customTextStyle(fontSize: 13,fontWeight: FontWeight.w400,color: status == "Invoiced" ? const Color(0xff1C60E2) :const Color(0xff7D7D7D) ),),
                Row(
                  children: [
                    Text("SAR. ",style: customTextStyle(color: const Color(0xff888888),fontWeight: FontWeight.w400,fontSize: 14)),
                    Text(amount,style: customTextStyle(fontWeight: FontWeight.w400,fontSize: 14),),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}