import 'package:cabzing_driverapp/common/utils/constants/app_colors.dart';
import 'package:cabzing_driverapp/common/utils/constants/dimensions.dart';
import 'package:cabzing_driverapp/common/utils/constants/image_constants.dart';
import 'package:cabzing_driverapp/features/home/screen/chart.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../common/utils/helpers/helpers_function.dart';
import '../../../common/widgets/appbar/appbar.dart';
import '../../../common/widgets/card/custom_cards.dart';
import '../../invoice/screen/invoice.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late TextTheme textTheme;

  @override
  Widget build(BuildContext context) {
    textTheme = Theme.of(context).textTheme;
    return Scaffold(
      appBar: CAppBar(
        title: SizedBox(child: Image.asset(ImageConstants.appLogo)),
        actions: [
          CircleAvatar(
            backgroundColor: Colors.transparent,
            radius: screenWidth * 0.08,
            backgroundImage: AssetImage(ImageConstants.profileIcon),
          )
        ],
      ),
      body: SafeArea(
          child: Column(
        children: [
          CustomCards(
              child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      RichText(
                        text: TextSpan(
                            text: 'SAR ',
                            style: textTheme.bodySmall,
                            children: [
                              TextSpan(
                                  text: '2,78000.0',
                                  style: textTheme.bodyMedium)
                            ]),
                      ),
                      RichText(
                        text: TextSpan(
                            text: '+21% ',
                            style: const TextStyle(color: Colors.green),
                            children: [
                              TextSpan(
                                  text: 'than last month',
                                  style: textTheme.bodySmall)
                            ]),
                      ),
                    ],
                  ),
                  Text(
                    'Revenue',
                    style: textTheme.bodyLarge,
                  )
                ],
              ),
              const LineChartWidget()
            ],
          )),

          CustomCards(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                width: screenWidth * 0.1,
                height: screenHeight * 0.11,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(screenWidth * 0.05),
                    color: AppColors.cream1),
                child: const Icon(Iconsax.sticker,color: Colors.black,size: 15,),
              ),
              SizedBox(
                width: screenWidth * 0.5,
                height: screenHeight * 0.1,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Bookings',style: textTheme.bodyMedium,),
                    Text('123',style: textTheme.titleSmall,),
                    Text('Reserved',style: textTheme.labelMedium,),
                  ],
                ),
              ),
              Container(
                width: screenWidth * 0.2,
                height: screenWidth * 0.2,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(screenWidth * 0.05),
                    color: AppColors.blackShade1,),
                child: const Icon(Icons.arrow_forward),
              )
            ],
          )),

          CustomCards(
              onTap: (){
                CAppHelperFunction.navigateToScreen(context,const InvoiceScreen());
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                width: screenWidth * 0.1,
                height: screenHeight * 0.11,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(screenWidth * 0.05),
                    color: AppColors.cream2),
                child: const Icon(Iconsax.money,color: Colors.black,size: 15,),
              ),
              SizedBox(
                width: screenWidth * 0.5,
                height: screenHeight * 0.1,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Invoices',style: textTheme.bodyMedium,),
                    Text('10232.00',style: textTheme.titleSmall,),
                    Text('Rupees',style: textTheme.labelMedium,),
                  ],
                ),
              ),
              Container(
                width: screenWidth * 0.2,
                height: screenWidth * 0.2,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(screenWidth * 0.05),
                    color: AppColors.blackShade1,),
                child: const Icon(Icons.arrow_forward),
              )
            ],
          ))
        ],
      )),
    );
  }
}
