import 'package:flutter/material.dart'; // Mengimpor paket Flutter untuk widget Material
import 'profilePage.dart'; // Mengimpor halaman ProfilePage
import 'package:http/http.dart' as http; // Mengimpor paket http untuk melakukan permintaan HTTP
import 'dart:convert'; // Mengimpor paket untuk mengonversi data JSON

// Mendefinisikan kelas ChangePasswordPage yang merupakan StatefulWidget
class ChangePasswordPage extends StatefulWidget {
  final String username; // Mendeklarasikan variabel username

  const ChangePasswordPage({Key? key, required this.username}) : super(key: key); // Constructor untuk menerima username

  @override
  _ChangePasswordPageState createState() => _ChangePasswordPageState(); // Membuat state untuk halaman
}

// State untuk ChangePasswordPage
class _ChangePasswordPageState extends State<ChangePasswordPage> {
  final _oldPasswordController = TextEditingController(); // Kontrol untuk old password
  final _newPasswordController = TextEditingController(); // Kontrol untuk new password
  final _confirmPasswordController = TextEditingController(); // Kontrol untuk konfirmasi new password
  final _formKey = GlobalKey<FormState>(); // Kunci untuk form

  // Fungsi untuk mengubah password
  Future<void> _changePassword() async {
    if (_formKey.currentState!.validate()) { // Memeriksa apakah form valid
      // Verifikasi old password ke server
      final response = await http.post(
        Uri.parse('http://localhost/flutter_api_materi5/select_old_password.php'), // URL endpoint verifikasi
        body: {
          'username': widget.username, // Mengirimkan username
          'old_password': _oldPasswordController.text, // Mengirimkan old password
        },
      );

      if (response.statusCode == 200) { // Memeriksa status kode respons
        final result = json.decode(response.body); // Mengonversi respons JSON
        if (result['valid']) { // Jika old password valid
          // Kirim permintaan untuk mengubah password
          final changeResponse = await http.post(
            Uri.parse('http://localhost/flutter_api_materi5/update_password.php'), // URL endpoint ganti password
            body: {
              'username': widget.username, // Mengirimkan username
              'new_password': _newPasswordController.text, // Mengirimkan new password
            },
          );

          if (changeResponse.statusCode == 200) { // Memeriksa status kode respons
            ScaffoldMessenger.of(context).showSnackBar( // Menampilkan SnackBar
              const SnackBar(content: Text('Password berhasil diubah!')),
            );
            Navigator.pop(context); // Kembali ke halaman sebelumnya
          } else {
            _showWarningDialog('Gagal mengubah password.'); // Menampilkan dialog jika gagal
          }
        } else {
          _showWarningDialog('Old Password tidak ditemukan.'); // Menampilkan dialog jika old password tidak valid
        }
      } else {
        _showWarningDialog('Terjadi kesalahan dalam memverifikasi password.'); // Menampilkan dialog jika terjadi kesalahan
      }
    }
  }

  // Fungsi untuk menampilkan dialog peringatan
  void _showWarningDialog(String message) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Peringatan'), // Judul dialog
          content: Text(message), // Konten dialog dengan pesan
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(), // Menutup dialog saat tombol ditekan
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }

  @override
  void dispose() {
    // Menghapus controller saat tidak lagi digunakan
    _oldPasswordController.dispose();
    _newPasswordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose(); // Memanggil dispose dari superclass
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ubah Password'), // Judul AppBar
        leading: IconButton(
          icon: const Icon(Icons.arrow_back), // Ikon panah kembali
          onPressed: () => Navigator.pop(context), // Kembali ke halaman sebelumnya saat ditekan
        ),
        backgroundColor: Colors.deepPurple, // Warna latar belakang AppBar
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0), // Memberikan padding di sekeliling body
        child: Form(
          key: _formKey, // Menggunakan kunci form
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center, // Mengatur posisi widget secara vertikal
            children: [
              // Input untuk old password
              TextFormField(
                controller: _oldPasswordController, // Menghubungkan dengan controller
                decoration: const InputDecoration(
                  labelText: 'Old Password', // Label untuk field
                  border: OutlineInputBorder(), // Border field
                ),
                obscureText: true, // Menyembunyikan teks saat mengetik
                validator: (value) {
                  if (value == null || value.isEmpty) { // Validasi input
                    _showWarningDialog('Old Password tidak boleh kosong'); // Menampilkan dialog jika kosong
                    return '';
                  }
                  return null; // Mengembalikan null jika valid
                },
              ),
              const SizedBox(height: 16), // Jarak antara input
              // Input untuk new password
              TextFormField(
                controller: _newPasswordController, // Menghubungkan dengan controller
                decoration: const InputDecoration(
                  labelText: 'New Password', // Label untuk field
                  border: OutlineInputBorder(), // Border field
                ),
                obscureText: true, // Menyembunyikan teks saat mengetik
                validator: (value) {
                  if (value == null || value.isEmpty) { // Validasi input
                    _showWarningDialog('New Password tidak boleh kosong'); // Menampilkan dialog jika kosong
                    return '';
                  } else if (value.length < 6) { // Memeriksa panjang password
                    _showWarningDialog('New Password minimal 6 karakter'); // Menampilkan dialog jika terlalu pendek
                    return '';
                  }
                  return null; // Mengembalikan null jika valid
                },
              ),
              const SizedBox(height: 16), // Jarak antara input
              // Input untuk konfirmasi new password
              TextFormField(
                controller: _confirmPasswordController, // Menghubungkan dengan controller
                decoration: const InputDecoration(
                  labelText: 'Confirm New Password', // Label untuk field
                  border: OutlineInputBorder(), // Border field
                ),
                obscureText: true, // Menyembunyikan teks saat mengetik
                validator: (value) {
                  if (value == null || value.isEmpty) { // Validasi input
                    _showWarningDialog('Confirm New Password tidak boleh kosong'); // Menampilkan dialog jika kosong
                    return '';
                  } else if (value != _newPasswordController.text) { // Memeriksa kesesuaian password
                    _showWarningDialog('Konfirmasi password tidak sesuai'); // Menampilkan dialog jika tidak sama
                    return '';
                  }
                  return null; // Mengembalikan null jika valid
                },
              ),
              const SizedBox(height: 24), // Jarak sebelum tombol konfirmasi
              // Tombol untuk mengonfirmasi penggantian password
              ElevatedButton(
                onPressed: _changePassword, // Memanggil fungsi _changePassword saat ditekan
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.deepPurple, // Warna latar belakang tombol
                  minimumSize: const Size(double.infinity, 50), // Ukuran minimum tombol
                ),
                child: const Text(
                  'Konfirmasi', // Teks tombol
                  style: TextStyle(color: Colors.white), // Warna teks tombol
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
