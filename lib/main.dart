// import 'package:bab3/assetsLokal.dart';

// import 'bab 3/stack.dart';
// import 'bab 3/padding.dart';
// import 'bab 3/align.dart';
// import 'bab 3/elevatedbutton.dart';
// import 'bab 3/textfield.dart';
// import 'bab 3/imageInternet.dart';
// import 'bab 3/assetsLokal.dart';
// import 'bab 3/penerapanContainer.dart';
// import 'bab 3/icons.dart';

// import 'bab 4/bab4listviewBuilder.dart';
// import 'bab 4/bab4separated.dart';
// import 'bab 4/bab4custom.dart';
// import 'bab 4/bab4default.dart';

// import 'bab 5/bab5gridviewBuilder.dart';
// import 'bab 5/bab5custom.dart';
// import 'bab 5/bab5count.dart';
// import 'bab 5/bab5extent.dart';

// import 'bab 6/bab6pushnpop.dart';
// import 'bab 6/bab6replacement.dart';
// import 'bab 6/bab6pushnremoveuntil.dart';
// import 'bab 6/bab6homescreen.dart';
// import 'bab 6/bab6detailscreen.dart';


import 'package:flutter/material.dart';

import 'package:bab3/OTP and Payment Gateway/start.dart';
import 'package:bab3/OTP and Payment Gateway/login_or_register_page.dart';
import 'package:bab3/OTP and Payment Gateway/login_page.dart';
import 'package:bab3/OTP and Payment Gateway/home_page.dart';
import 'package:bab3/OTP and Payment Gateway/register_page.dart';
import 'package:bab3/OTP and Payment Gateway/reset_password_page.dart';
import 'package:bab3/OTP and Payment Gateway/otp_page.dart';
import 'package:bab3/OTP and Payment Gateway/cart_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const SplashScreen(),
        '/loginorregister': (context) => const LoginOrRegisterScreen(),
        '/login': (context) => const LoginPage(),
        '/register': (context) => const RegisterPage(),
      },
    );
  }
}