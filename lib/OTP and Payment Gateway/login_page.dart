import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/image/otp and payment/jordan_login.png', // Tambahkan gambar sepatu putih di assets
                height: 150,
              ),
              const SizedBox(height: 20),
              const Text(
                'SIGN IN',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 20),
              const TextField(
                decoration: InputDecoration(
                  labelText: 'Username or Email',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 10),
              const TextField(
                obscureText: true,
                decoration: InputDecoration(
                  labelText: 'Password',
                  border: OutlineInputBorder(),
                  suffixIcon: Icon(Icons.visibility_off),
                ),
              ),
              const SizedBox(height: 10),
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () {
                    // Aksi untuk lupa password
                  },
                  child: const Text('Forgot Password?'),
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.orange,
                  padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                ),
                onPressed: () {
                  // Aksi untuk Sign In
                },
                child: const Text('Sign In'),
              ),
              const SizedBox(height: 10),
              TextButton(
                onPressed: () {
                  // Navigasi ke halaman Sign Up
                },
                child: const Text("Don't have an account? Sign Up"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
