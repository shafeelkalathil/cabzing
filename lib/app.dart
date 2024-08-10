import 'dart:io';

import 'package:flutter/material.dart';
import 'package:month_year_picker/month_year_picker.dart';
import 'common/utils/theme/theme.dart';
import 'features/spalsh/screen/splash.dart';
import 'package:flutter_localizations/flutter_localizations.dart';


class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.dark,
      darkTheme: CAppTheme.darkTheme,
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        MonthYearPickerLocalizations.delegate,
      ],
      home:  const SplashScreen()
    );
  }
}



class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback = (X509Certificate cert, String host, int port) => true;
  }
}