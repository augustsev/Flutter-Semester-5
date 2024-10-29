import 'package:flutter/material.dart';
import 'login_or_register_page.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
                'assets/image/otp and payment/start.png'), // Ganti dengan path gambar Anda
            fit: BoxFit.cover, // Agar gambar memenuhi seluruh latar belakang
          ),
        ),
      ),
    );
  }
}
