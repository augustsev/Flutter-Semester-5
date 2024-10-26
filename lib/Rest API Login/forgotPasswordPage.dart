import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter/services.dart'; // Tambahkan import untuk Clipboard

class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({super.key});

  @override
  _ForgotPasswordPageState createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  String? _errorMessage;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Forgot Password"),
        leading: const BackButton(),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: _usernameController,
              decoration: const InputDecoration(labelText: "Username"),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: _emailController,
              decoration: const InputDecoration(labelText: "Email"),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _resetPassword,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.yellow,
                foregroundColor: Colors.black,
              ),
              child: const Text("Reset Password"),
            ),
            if (_errorMessage != null)
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Text(
                  _errorMessage!,
                  style: const TextStyle(color: Colors.red),
                ),
              ),
          ],
        ),
      ),
    );
  }

  Future<void> _resetPassword() async {
    String username = _usernameController.text.trim();
    String email = _emailController.text.trim();

    if (username.isEmpty || email.isEmpty) {
      setState(() {
        _errorMessage = "Username dan Email tidak boleh kosong.";
      });
      return;
    }

    final String url = 'http://localhost/flutter_api_materi5/forgot_password_page.php';

    try {
      final response = await http.post(
        Uri.parse(url),
        body: {
          'username': username,
          'email': email,
        },
      );

      if (response.statusCode == 200) {
        final responseData = json.decode(response.body);

        if (responseData['message'] == 'Akun ditemukan') {
          _showPasswordDialog(responseData['password']);
        } else {
          setState(() {
            _errorMessage = responseData['message'];
          });
        }
      } else {
        setState(() {
          _errorMessage = "Terjadi kesalahan, silakan coba lagi.";
        });
      }
    } catch (e) {
      setState(() {
        _errorMessage = "Koneksi gagal, silakan coba lagi.";
      });
    }
  }

  void _showPasswordDialog(String password) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Password Anda'),
          content: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text(password), // Menampilkan password
              ),
              IconButton(
                icon: const Icon(Icons.copy),
                onPressed: () {
                  // Salin password ke clipboard
                  Clipboard.setData(ClipboardData(text: password));
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Password disalin ke clipboard')),
                  );
                },
              ),
            ],
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('OK'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
