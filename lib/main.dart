import 'package:flutter/material.dart';
import 'package:tryapp/HomePage.dart';
import 'package:tryapp/cart_page.dart';
import 'package:tryapp/core/store.dart';
import 'package:tryapp/forgotpassword.dart';
import 'package:tryapp/loginpage.dart';
import 'package:tryapp/utils/routes.dart';
import 'package:velocity_x/velocity_x.dart';
// import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(VxState(store: MyStore(), child: MyApp()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.system,
      routes: {
        "/": (context) => HomePage(),
        MyRoutes.homeRoute: (context) => HomePage(),
        MyRoutes.loginRoute: (context) => LoginPage(),
        MyRoutes.cartRoute: (context) => CartPage(),
        MyRoutes.forgotPasswordRoute: (context) => ForgotPassword(),
      },
    );
  }
}
