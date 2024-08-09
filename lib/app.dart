import 'package:flutter/material.dart';
import 'common/utils/theme/theme.dart';
import 'features/auth/screen/login.dart';
import 'features/invoice/screen/invoice.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.dark,
      darkTheme: CAppTheme.darkTheme,
      home:  LoginScreen()
    );
  }
}