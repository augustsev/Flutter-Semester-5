import 'package:flutter/material.dart';
import 'package:http/http.dart' as http; // Import untuk melakukan request HTTP
import 'dart:convert'; // Import untuk mengkonversi JSON

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();

  void _register() async {
    final String username = _usernameController.text;
    final String email = _emailController.text;
    final String password = _passwordController.text;
    final String confirmPassword = _confirmPasswordController.text;

    // Validasi input
    if (username.isEmpty || email.isEmpty || password.isEmpty || confirmPassword.isEmpty) {
      _showError("Semua field harus diisi!");
      return;
    }

    // Validasi format email
    if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(email)) {
      _showError("Format email tidak valid!");
      return;
    }

    // Periksa apakah password dan konfirmasi password cocok
    if (password != confirmPassword) {
      _showError("Password dan konfirmasi password tidak cocok!");
      return;
    }

    // URL API untuk pendaftaran
    final String url = 'http://localhost/flutter_api_materi5/create_register.php';

    // Mengirim request POST
    final response = await http.post(
      Uri.parse(url),
      body: {
        'username': username,
        'email': email,
        'psw': password,
      },
    );

    // Memeriksa respons dari API
    if (response.statusCode == 200) {
      final responseData = json.decode(response.body);
      if (responseData['message'] == 'Data Berhasil di Create') {
        _showSuccess("Pendaftaran berhasil!");
      } else {
        _showError("Pendaftaran gagal!");
      }
    } else {
      _showError("Terjadi kesalahan, silakan coba lagi.");
    }
  }

  void _showError(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message, style: const TextStyle(color: Colors.red))),
    );
  }

  void _showSuccess(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message, style: const TextStyle(color: Colors.green))),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Register"),
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
            const SizedBox(height: 10),
            TextField(
              controller: _passwordController,
              decoration: const InputDecoration(labelText: "Password"),
              obscureText: true,
            ),
            const SizedBox(height: 10),
            TextField(
              controller: _confirmPasswordController,
              decoration: const InputDecoration(labelText: "Confirm Password"),
              obscureText: true,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _register, // Panggil fungsi _register saat tombol ditekan
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.yellow,
                foregroundColor: Colors.black,
              ),
              child: const Text("Register"),
            ),
          ],
        ),
      ),
    );
  }
}
