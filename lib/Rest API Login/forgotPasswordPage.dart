import 'package:flutter/material.dart'; // Import untuk menggunakan widget Material Design
import 'package:http/http.dart' as http; // Import untuk melakukan request HTTP
import 'dart:convert'; // Import untuk mengkonversi JSON
import 'package:flutter/services.dart'; // Import untuk clipboard

// Widget untuk halaman "Forgot Password"
class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({super.key}); // Constructor untuk ForgotPasswordPage

  @override
  _ForgotPasswordPageState createState() => _ForgotPasswordPageState(); // Mengembalikan state
}

// State untuk ForgotPasswordPage
class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  final TextEditingController _usernameController = TextEditingController(); // Controller untuk kolom username
  final TextEditingController _emailController = TextEditingController(); // Controller untuk kolom email
  String? _errorMessage; // Variabel untuk menyimpan pesan kesalahan

  // Fungsi untuk membangun UI halaman
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Forgot Password"), // Judul halaman
        leading: const BackButton(), // Tombol kembali
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0), // Padding di sekitar konten
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch, // Mengatur kolom agar mengisi lebar
          children: [
            TextField(
              controller: _usernameController, // Menghubungkan controller dengan kolom input
              decoration: const InputDecoration(labelText: "Username"), // Label untuk kolom input
            ),
            const SizedBox(height: 10), // Jarak vertikal antara kolom input
            TextField(
              controller: _emailController, // Menghubungkan controller dengan kolom input
              decoration: const InputDecoration(labelText: "Email"), // Label untuk kolom input
            ),
            const SizedBox(height: 20), // Jarak vertikal sebelum tombol
            ElevatedButton(
              onPressed: _resetPassword, // Panggil fungsi _resetPassword saat tombol ditekan
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.yellow, // Warna latar tombol
                foregroundColor: Colors.black, // Warna teks tombol
              ),
              child: const Text("Reset Password"), // Teks tombol
            ),
            // Jika ada pesan kesalahan, tampilkan di bawah tombol
            if (_errorMessage != null)
              Padding(
                padding: const EdgeInsets.only(top: 10), // Padding untuk pesan kesalahan
                child: Text(
                  _errorMessage!, // Menampilkan pesan kesalahan
                  style: const TextStyle(color: Colors.red), // Gaya teks pesan kesalahan
                ),
              ),
          ],
        ),
      ),
    );
  }

  // Fungsi untuk mereset password
  Future<void> _resetPassword() async {
    String username = _usernameController.text.trim(); // Ambil dan trim input username
    String email = _emailController.text.trim(); // Ambil dan trim input email

    // Validasi: pastikan username dan email tidak kosong
    if (username.isEmpty || email.isEmpty) {
      setState(() {
        _errorMessage = "Username dan Email tidak boleh kosong."; // Set pesan kesalahan
      });
      return; // Keluar dari fungsi jika ada yang kosong
    }

    // URL API untuk mereset password
    final String url = 'http://localhost/flutter_api_materi5/forgot_password_page.php';

    try {
      // Mengirim request POST ke server
      final response = await http.post(
        Uri.parse(url),
        body: {
          'username': username, // Mengirim username
          'email': email, // Mengirim email
        },
      );

      // Memeriksa respons dari server
      if (response.statusCode == 200) {
        final responseData = json.decode(response.body); // Decode JSON dari respons

        // Jika akun ditemukan, tampilkan password
        if (responseData['message'] == 'Akun ditemukan') {
          _showPasswordDialog(responseData['password']); // Tampilkan dialog dengan password
        } else {
          // Jika tidak, set pesan kesalahan
          setState(() {
            _errorMessage = responseData['message'];
          });
        }
      } else {
        // Jika status kode bukan 200, set pesan kesalahan
        setState(() {
          _errorMessage = "Terjadi kesalahan, silakan coba lagi.";
        });
      }
    } catch (e) {
      // Tangani kesalahan koneksi
      setState(() {
        _errorMessage = "Koneksi gagal, silakan coba lagi."; // Set pesan kesalahan
      });
    }
  }

  // Fungsi untuk menampilkan dialog dengan password
  void _showPasswordDialog(String password) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Password Anda'), // Judul dialog
          content: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween, // Mengatur isi dialog
            children: [
              Expanded(
                child: Text(password), // Menampilkan password
              ),
              IconButton(
                icon: const Icon(Icons.copy), // Ikon untuk salin
                onPressed: () {
                  // Salin password ke clipboard
                  Clipboard.setData(ClipboardData(text: password)); // Menyalin password
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Password disalin ke clipboard')), // Pesan SnackBar
                  );
                },
              ),
            ],
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('OK'), // Teks tombol OK
              onPressed: () {
                Navigator.of(context).pop(); // Menutup dialog saat tombol OK ditekan
              },
            ),
          ],
        );
      },
    );
  }
}
