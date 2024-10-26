import 'package:flutter/material.dart';
import 'profilePage.dart';
import 'package:http/http.dart' as http; // Import package http
import 'dart:convert'; // Import json

class ChangePasswordPage extends StatefulWidget {
  final String username;

  const ChangePasswordPage({Key? key, required this.username}) : super(key: key);

  @override
  _ChangePasswordPageState createState() => _ChangePasswordPageState();
}

class _ChangePasswordPageState extends State<ChangePasswordPage> {
  final _oldPasswordController = TextEditingController();
  final _newPasswordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  Future<void> _changePassword() async {
    if (_formKey.currentState!.validate()) {
      // Verifikasi old password ke server
      final response = await http.post(
        Uri.parse('http://localhost/flutter_api_materi5/select_old_password.php'), // Ganti dengan URL endpoint verifikasi
        body: {
          'username': widget.username,
          'old_password': _oldPasswordController.text,
        },
      );

      if (response.statusCode == 200) {
        final result = json.decode(response.body);
        if (result['valid']) {
          // Jika valid, lanjutkan untuk mengubah password
          // Kirim permintaan untuk mengubah password
          final changeResponse = await http.post(
            Uri.parse('http://localhost/flutter_api_materi5/update_password.php'), // Ganti dengan URL endpoint ganti password
            body: {
              'username': widget.username,
              'new_password': _newPasswordController.text,
            },
          );

          if (changeResponse.statusCode == 200) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Password berhasil diubah!')),
            );
            Navigator.pop(context);
          } else {
            _showWarningDialog('Gagal mengubah password.');
          }
        } else {
          _showWarningDialog('Old Password tidak ditemukan.');
        }
      } else {
        _showWarningDialog('Terjadi kesalahan dalam memverifikasi password.');
      }
    }
  }

  // Fungsi untuk menampilkan dialog peringatan
  void _showWarningDialog(String message) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Peringatan'),
          content: Text(message),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }

  @override
  void dispose() {
    _oldPasswordController.dispose();
    _newPasswordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ubah Password'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
        backgroundColor: Colors.deepPurple,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                controller: _oldPasswordController,
                decoration: const InputDecoration(
                  labelText: 'Old Password',
                  border: OutlineInputBorder(),
                ),
                obscureText: true,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    _showWarningDialog('Old Password tidak boleh kosong');
                    return '';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _newPasswordController,
                decoration: const InputDecoration(
                  labelText: 'New Password',
                  border: OutlineInputBorder(),
                ),
                obscureText: true,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    _showWarningDialog('New Password tidak boleh kosong');
                    return '';
                  } else if (value.length < 6) {
                    _showWarningDialog('New Password minimal 6 karakter');
                    return '';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _confirmPasswordController,
                decoration: const InputDecoration(
                  labelText: 'Confirm New Password',
                  border: OutlineInputBorder(),
                ),
                obscureText: true,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    _showWarningDialog('Confirm New Password tidak boleh kosong');
                    return '';
                  } else if (value != _newPasswordController.text) {
                    _showWarningDialog('Konfirmasi password tidak sesuai');
                    return '';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 24),
              ElevatedButton(
                onPressed: _changePassword,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.deepPurple,
                  minimumSize: const Size(double.infinity, 50),
                ),
                child: const Text(
                  'Konfirmasi',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
