import 'package:flutter/material.dart';
import 'login_or_register_page.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();

    // Inisialisasi Animation Controller
    _controller = AnimationController(
      duration: const Duration(seconds: 2), // Durasi animasi
      vsync: this,
    );

    // Membuat Animation
    _animation = Tween<double>(begin: 0.0, end: 1.0).animate(_controller);

    // Memulai animasi
    _controller.forward();

    // Navigasi setelah delay
    Future.delayed(const Duration(seconds: 4), () {
      if (mounted) {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => const LoginOrRegisterScreen()), // Ganti dengan halaman tujuan Anda
        );
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FadeTransition(
        opacity: _animation,
        child: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/image/otp and payment/start.png'), // Ganti dengan path gambar Anda
              fit: BoxFit.cover, // Agar gambar memenuhi seluruh latar belakang
            ),
          ),
        ),
      ),
    );
  }
}
