import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'home_page.dart';
import 'register_page.dart';
import 'reset_password_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _isLoading = false;
  String? _usernameError; // Menyimpan pesan kesalahan untuk username
  String? _passwordError; // Menyimpan pesan kesalahan untuk password

  Future<void> _loginUser() async {
    setState(() {
      _usernameError = null; // Reset pesan kesalahan untuk username
      _passwordError = null; // Reset pesan kesalahan untuk password
    });

    if (_usernameController.text.isEmpty && _passwordController.text.isEmpty) {
      setState(() {
        _passwordError = "Mohon lengkapi semua kolom yang tersedia."; // Pesan kesalahan untuk semua kolom kosong
      });
      return;
    }

    if (_usernameController.text.isEmpty) {
      setState(() {
        _usernameError = "Mohon isi username atau email."; // Pesan kesalahan untuk username
      });
      return;
    }

    if (_passwordController.text.isEmpty) {
      setState(() {
        _passwordError = "Mohon isi password."; // Pesan kesalahan untuk password
      });
      return;
    }

    setState(() {
      _isLoading = true; // Mulai loading
    });

    try {
      final response = await http.post(
        Uri.parse('http://localhost/flutter_otp_payment/login_akun.php'),
        body: {
          'username_or_email': _usernameController.text,
          'password': _passwordController.text,
        },
      );

      setState(() {
        _isLoading = false; // Hentikan loading
      });

      if (response.statusCode == 200) {
        final result = json.decode(response.body);
        if (result['success']) {
          // Login berhasil
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => const HomeScreen()),
          );
        } else {
          // Menampilkan pesan kesalahan dari server
          setState(() {
            // Mengubah pesan kesalahan berdasarkan kondisi
            if (result['message'] == "Password salah.") {
              _passwordError = "Password yang Anda masukkan salah."; // Pesan untuk password salah
            } else if (result['message'] == "Akun tidak ditemukan.") {
              _usernameError = "Akun dengan username/email tersebut tidak ditemukan."; // Pesan untuk akun tidak ditemukan
            } else {
              _usernameError = result['message']; // Pesan kesalahan dari server
            }
          });
        }
      } else {
        setState(() {
          _usernameError = "Terjadi kesalahan dalam menghubungkan ke server. Silakan coba lagi."; // Pesan kesalahan
        });
      }
    } catch (e) {
      setState(() {
        _isLoading = false; // Hentikan loading jika terjadi kesalahan
        _usernameError = "Terjadi kesalahan. Mohon coba lagi."; // Pesan kesalahan
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            'assets/image/otp and payment/jordan_login.png',
            height: double.infinity,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
          Container(
            color: Colors.black.withOpacity(0.5),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20.0),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.9),
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black26,
                    blurRadius: 10.0,
                    offset: Offset(0, -2),
                  ),
                ],
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const SizedBox(height: 20),
                  const Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'SIGN IN',
                      style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.black),
                    ),
                  ),
                  const SizedBox(height: 20),
                  TextField(
                    controller: _usernameController,
                    decoration: InputDecoration(
                      labelText: 'Username or Email',
                      labelStyle: const TextStyle(color: Colors.black),
                      border: const UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.black),
                      ),
                      focusedBorder: const UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.orange),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  // Menampilkan pesan kesalahan untuk username/email
                  if (_usernameError != null)
                    Text(
                      _usernameError!,
                      style: const TextStyle(color: Colors.red),
                    ),
                  TextField(
                    controller: _passwordController,
                    obscureText: true,
                    decoration: InputDecoration(
                      labelText: 'Password',
                      labelStyle: const TextStyle(color: Colors.black),
                      border: const UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.black),
                      ),
                      focusedBorder: const UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.orange),
                      ),
                      suffixIcon: const Icon(Icons.visibility_off, color: Colors.black),
                    ),
                  ),
                  const SizedBox(height: 10),
                  // Menampilkan pesan kesalahan untuk password
                  if (_passwordError != null)
                    Text(
                      _passwordError!,
                      style: const TextStyle(color: Colors.red),
                    ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const ForgotPasswordPage()),
                        );
                      },
                      child: const Text(
                        'Forgot Password?',
                        style: TextStyle(color: Colors.blue),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFFF4F00),
                      padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                    onPressed: _isLoading ? null : _loginUser,
                    child: _isLoading
                        ? const CircularProgressIndicator()
                        : const Text('Sign In', style: TextStyle(fontWeight: FontWeight.bold)),
                  ),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text("Don't have an account?", style: TextStyle(color: Colors.black)),
                      TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => const RegisterPage()),
                          );
                        },
                        child: const Text('Sign Up', style: TextStyle(color: Colors.blue)),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
