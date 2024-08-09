import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CAppHelperFunction{

  static void showSnackBar(String message,BuildContext context){
    ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(message))
    );
  }

  static void showAlert(String title,String message,BuildContext context,bool isConformation,VoidCallback? onPressed,){
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(title),
          content: Text(message),
          actions: isConformation == true
              ? [
                TextButton(onPressed: () => Navigator.of(context).pop(), child: const Text("No")),
                TextButton(onPressed: () {onPressed?.call();}, child: const Text("Yes")),
          ]
              :[TextButton(onPressed: () => Navigator.of(context).pop(),
                child: const Text("OK"))],
        );
      },);
  }

  static void navigateToScreen(BuildContext context,Widget screen){
    Navigator.push(context, MaterialPageRoute(builder: (context) => screen,));
  }

  static void navigateToBackScreen(BuildContext context){
    Navigator.pop(context);
  }

  static void navigateToScreenAndRemoveUntil(BuildContext context,Widget screen){
    Navigator.pushAndRemoveUntil(context, MaterialPageRoute(
        builder: (context) => screen), (route) => false);
  }

  static void splashAutoRedirected(BuildContext context,Widget isLoginScreen,bool isLogin,Widget screen){
    Timer(const Duration(seconds: 3),() {
      if(isLogin){
        navigateToScreenAndRemoveUntil(context,isLoginScreen);
      }
      else{
        navigateToScreenAndRemoveUntil(context,screen);
      }
    });
  }

  static double screenWidth(BuildContext context){
    return MediaQuery.of(context).size.width;
  }

  static double screenHeight(BuildContext context){
    return MediaQuery.of(context).size.height;
  }

  static String getFormattedDate(DateTime date,{String format='dd MMM yyyy'}){
    return DateFormat(format).format(date);
  }

  static DateTime? getInitialDate(String date) {
    try {
      // Try parsing the text in the TextField
      DateTime parsedDate = DateFormat('dd-MM-yyyy').parse(date);
      return parsedDate;
    } catch (e) {
      if (kDebugMode) {

      }
      // If parsing fails, return the current date
      return DateTime.now();
    }
  }

  static bool isDarkMood(BuildContext context){
    return Theme.of(context).brightness == Brightness.dark;
  }

  static List<String> setSearchParam(String caseNumber) {
    List<String> caseSearchList = <String>[];
    String temp = "";

    List<String> nameSplits = caseNumber.split(" ");
    for (int i = 0; i < nameSplits.length; i++) {
      String name = "";

      for (int k = i; k < nameSplits.length; k++) {
        name = "$name${nameSplits[k]} ";
      }
      temp = "";

      for (int j = 0; j < name.length; j++) {
        temp = temp + name[j];
        caseSearchList.add(temp.toUpperCase());
      }
    }
    return caseSearchList;
  }

}