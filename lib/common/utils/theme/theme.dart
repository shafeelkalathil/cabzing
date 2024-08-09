import 'package:flutter/material.dart';
import 'custom_theme/appbar_theme.dart';
import 'custom_theme/bottom_sheet_theme.dart';
import 'custom_theme/checkkbox_theme.dart';
import 'custom_theme/elevated_button_theme.dart';
import 'custom_theme/text_form_field_theme.dart';
import 'custom_theme/text_theme.dart';

class CAppTheme {
  CAppTheme._();


  static ThemeData darkTheme = ThemeData(
      primaryColor: Colors.blue,
      useMaterial3: true,
      fontFamily: "Poppins",
      brightness: Brightness.dark,
      scaffoldBackgroundColor: Colors.black,
      textTheme: CTextTheme.darkTextTheme,
      elevatedButtonTheme: CElevatedButtonTheme.darkElevatedButtonTheme,
    appBarTheme: CAppBarTheme.darkAppBarTheme,
    checkboxTheme: CCheckBoxTheme.darkCheckboxTheme,
    bottomSheetTheme: CBottomSheetTheme.darkBottomSheetTheme,
    inputDecorationTheme: CTextFromFieldTheme.darkInputDecoration,
  );
}