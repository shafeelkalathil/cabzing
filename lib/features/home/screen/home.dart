import 'package:cabzing_driverapp/common/utils/helpers/helpers_function.dart';
import 'package:cabzing_driverapp/features/invoice/screen/invoice.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: TextButton(
            onPressed: () {
              CAppHelperFunction.navigateToScreen(context,InvoiceScreen());
            },
            child: Text("Test"),
          ),
        ),
      ),
    );
  }
}
