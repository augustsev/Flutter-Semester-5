  import 'package:flutter/material.dart';
  import 'package:http/http.dart' as http;
  import 'dart:convert';

  class RegisterPage extends StatefulWidget {
    const RegisterPage({super.key});

    @override
    _RegisterPageState createState() => _RegisterPageState();
  }

  class _RegisterPageState extends State<RegisterPage> {
    bool _isPasswordVisible = false;
    bool _isConfirmPasswordVisible = false;
    bool _showNotification = false;
    String _notificationMessage = '';

    final TextEditingController _nameController = TextEditingController();
    final TextEditingController _usernameController = TextEditingController();
    final TextEditingController _emailController = TextEditingController();
    final TextEditingController _phoneController = TextEditingController();
    final TextEditingController _passwordController = TextEditingController();
    final TextEditingController _confirmPasswordController = TextEditingController();

    String? _nameError;
    String? _usernameError;
    String? _emailError;
    String? _phoneError;
    String? _passwordError;
    String? _confirmPasswordError;

    // Fungsi untuk validasi input pengguna
    bool _validateInputs() {
      setState(() {
        _nameError = _nameController.text.isEmpty ? "Nama tidak boleh kosong" : null;
        _usernameError = _usernameController.text.isEmpty ? "Username tidak boleh kosong" : null;
        _emailError = _emailController.text.isEmpty ? "Email tidak boleh kosong" : null;
        _phoneError = _phoneController.text.isEmpty ? "Nomor telepon tidak boleh kosong" : null;
        _passwordError = _passwordController.text.isEmpty ? "Password tidak boleh kosong" : null;
        _confirmPasswordError = _confirmPasswordController.text != _passwordController.text
            ? "Konfirmasi password harus sama dengan password"
            : null;
      });

      return _nameError == null &&
          _usernameError == null &&
          _emailError == null &&
          _phoneError == null &&
          _passwordError == null &&
          _confirmPasswordError == null;
    }

    Future<void> _registerUser() async {
      if (!_validateInputs()) return;

      final response = await http.post(
        Uri.parse('http://localhost/flutter_otp_payment/register_akun.php'),
        body: {
          'nama': _nameController.text,
          'username': _usernameController.text,
          'email': _emailController.text,
          'phone': _phoneController.text,
          'pasw': _passwordController.text,
        },
      );

      if (response.statusCode == 200) {
        final result = json.decode(response.body);
        setState(() {
          _notificationMessage = result['message'] == 'Data Berhasil di Create'
              ? 'Registrasi berhasil!'
              : 'Registrasi gagal!';
          _showNotification = true;
        });

        Future.delayed(const Duration(seconds: 2), () {
          setState(() => _showNotification = false);
          if (result['message'] == 'Data Berhasil di Create') Navigator.pop(context);
        });
      } else {
        setState(() {
          _notificationMessage = 'Gagal terhubung ke server!';
          _showNotification = true;
        });
        Future.delayed(const Duration(seconds: 2), () {
          setState(() => _showNotification = false);
        });
      }
    }

    @override
    Widget build(BuildContext context) {
      return Scaffold(
        body: Stack(
          children: [
            Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/image/otp and payment/nike_register.jpeg'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Center(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    AnimatedOpacity(
                      opacity: _showNotification ? 1.0 : 0.0,
                      duration: const Duration(milliseconds: 500),
                      child: Container(
                        padding: const EdgeInsets.all(10),
                        margin: const EdgeInsets.only(top: 20, bottom: 20),
                        decoration: BoxDecoration(
                          color: Colors.black87,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Text(
                          _notificationMessage,
                          style: const TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(16.0),
                      margin: const EdgeInsets.symmetric(horizontal: 16.0),
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.9),
                        borderRadius: BorderRadius.circular(18),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            'SIGN UP',
                            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(height: 30),
                          _buildTextField('Name', Icons.person, controller: _nameController, errorText: _nameError),
                          const SizedBox(height: 16),
                          _buildTextField('Username', Icons.person, controller: _usernameController, errorText: _usernameError),
                          const SizedBox(height: 16),
                          _buildTextField('Email', Icons.email, controller: _emailController, errorText: _emailError),
                          const SizedBox(height: 16),
                          _buildTextField('Phone', Icons.phone, controller: _phoneController, errorText: _phoneError),
                          const SizedBox(height: 16),
                          _buildTextField(
                            'Password',
                            Icons.lock,
                            controller: _passwordController,
                            obscureText: !_isPasswordVisible,
                            onToggleVisibility: () {
                              setState(() {
                                _isPasswordVisible = !_isPasswordVisible;
                              });
                            },
                            errorText: _passwordError,
                          ),
                          const SizedBox(height: 16),
                          _buildTextField(
                            'Confirm Password',
                            Icons.lock,
                            controller: _confirmPasswordController,
                            obscureText: !_isConfirmPasswordVisible,
                            onToggleVisibility: () {
                              setState(() {
                                _isConfirmPasswordVisible = !_isConfirmPasswordVisible;
                              });
                            },
                            errorText: _confirmPasswordError,
                          ),
                          const SizedBox(height: 30),
                          ElevatedButton(
                            onPressed: _registerUser,
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xFFFF4F00),
                              padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 50),
                            ),
                            child: const Text(
                              'Sign Up',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      );
    }

    Widget _buildTextField(String label, IconData icon, {
      TextEditingController? controller,
      bool obscureText = false,
      VoidCallback? onToggleVisibility,
      String? errorText,
    }) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextField(
            controller: controller,
            obscureText: obscureText,
            decoration: InputDecoration(
              labelText: label,
              labelStyle: const TextStyle(color: Colors.grey),
              enabledBorder: const UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.grey),
              ),
              focusedBorder: const UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.blue),
              ),
              prefixIcon: Icon(icon),
              suffixIcon: onToggleVisibility != null
                  ? IconButton(
                      icon: Icon(
                        obscureText ? Icons.visibility : Icons.visibility_off,
                        color: Colors.grey,
                      ),
                      onPressed: onToggleVisibility,
                    )
                  : null,
              errorText: errorText,
            ),
          ),
        ],
      );
    }
  }
