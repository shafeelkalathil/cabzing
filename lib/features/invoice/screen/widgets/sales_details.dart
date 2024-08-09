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
      child: Container(
        width: screenWidth,
        height: screenHeight * 0.06,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(invoiceNo),
                Text(customerName),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(status),
                Text('SAR $amount'),
              ],
            ),
          ],
        ),
      ),
    );
  }
}