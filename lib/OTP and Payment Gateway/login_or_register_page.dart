import 'package:flutter/material.dart';
import 'login_page.dart';

class LoginOrRegisterScreen extends StatelessWidget {
  const LoginOrRegisterScreen({super.key});
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/image/otp and payment/signinorsignup.png'), // Ganti dengan path gambar Anda
            fit: BoxFit.cover, // Agar gambar memenuhi seluruh latar belakang
          ),
        ),
        child: Container(
          color: Colors.black54, // Semi-transparan agar teks terlihat jelas
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'WELCOME',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.orange,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const LoginPage()),
                  );
                },
                child: const Text('Sign In'),
              ),
              const SizedBox(height: 10),
              OutlinedButton(
                style: OutlinedButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: Colors.transparent,
                  side: const BorderSide(color: Colors.white),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                ),
                onPressed: () {
                  // Navigasi ke halaman Sign Up jika diperlukan
                },
                child: const Text('Sign Up'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
