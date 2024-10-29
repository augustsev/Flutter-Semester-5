import 'package:flutter/material.dart'; // Mengimpor package material Flutter untuk menggunakan widget UI
import 'package:http/http.dart' as http; // Import untuk melakukan request HTTP
import 'dart:convert'; // Import untuk mengkonversi JSON

class RegisterPage extends StatefulWidget { // Mendefinisikan kelas RegisterPage sebagai StatefulWidget
  const RegisterPage({super.key}); // Konstruktor untuk RegisterPage

  @override
  _RegisterPageState createState() => _RegisterPageState(); // Membuat state untuk RegisterPage
}

class _RegisterPageState extends State<RegisterPage> { // Mendefinisikan state untuk RegisterPage
  final TextEditingController _usernameController = TextEditingController(); // Controller untuk username
  final TextEditingController _emailController = TextEditingController(); // Controller untuk email
  final TextEditingController _passwordController = TextEditingController(); // Controller untuk password
  final TextEditingController _confirmPasswordController = TextEditingController(); // Controller untuk konfirmasi password

  void _register() async { // Fungsi untuk melakukan registrasi
    final String username = _usernameController.text; // Mengambil username dari controller
    final String email = _emailController.text; // Mengambil email dari controller
    final String password = _passwordController.text; // Mengambil password dari controller
    final String confirmPassword = _confirmPasswordController.text; // Mengambil konfirmasi password dari controller

    // Validasi input
    if (username.isEmpty || email.isEmpty || password.isEmpty || confirmPassword.isEmpty) { // Memeriksa apakah semua field diisi
      _showError("Semua field harus diisi!"); // Menampilkan pesan error
      return; // Menghentikan eksekusi jika ada field yang kosong
    }

    // Validasi format email
    if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(email)) { // Memeriksa format email menggunakan RegExp
      _showError("Format email tidak valid!"); // Menampilkan pesan error jika format email salah
      return; // Menghentikan eksekusi
    }

    // Periksa apakah password dan konfirmasi password cocok
    if (password != confirmPassword) { // Memeriksa kesesuaian password dan konfirmasi password
      _showError("Password dan konfirmasi password tidak cocok!"); // Menampilkan pesan error
      return; // Menghentikan eksekusi
    }

    // URL API untuk pendaftaran
    final String url = 'http://localhost/flutter_api_materi5/create_register.php'; // Mendefinisikan URL endpoint API

    // Mengirim request POST
    final response = await http.post( // Mengirimkan request POST ke server
      Uri.parse(url), // Mengonversi URL ke Uri
      body: { // Mengirim data dalam body request
        'username': username, // Mengirim username
        'email': email, // Mengirim email
        'psw': password, // Mengirim password
      },
    );

    // Memeriksa respons dari API
    if (response.statusCode == 200) { // Memeriksa apakah status code respons adalah 200 (OK)
      final responseData = json.decode(response.body); // Mengonversi respons JSON ke Map
      if (responseData['message'] == 'Data Berhasil di Create') { // Memeriksa pesan dari respons
        _showSuccess("Pendaftaran berhasil!"); // Menampilkan pesan sukses
      } else {
        _showError("Pendaftaran gagal!"); // Menampilkan pesan error jika pendaftaran gagal
      }
    } else {
      _showError("Terjadi kesalahan, silakan coba lagi."); // Menampilkan pesan error jika status code bukan 200
    }
  }

  void _showError(String message) { // Fungsi untuk menampilkan pesan error
    ScaffoldMessenger.of(context).showSnackBar( // Menampilkan SnackBar di Scaffold
      SnackBar(content: Text(message, style: const TextStyle(color: Colors.red))), // Mengatur warna teks menjadi merah
    );
  }

  void _showSuccess(String message) { // Fungsi untuk menampilkan pesan sukses
    ScaffoldMessenger.of(context).showSnackBar( // Menampilkan SnackBar di Scaffold
      SnackBar(content: Text(message, style: const TextStyle(color: Colors.green))), // Mengatur warna teks menjadi hijau
    );
  }

  @override
  Widget build(BuildContext context) { // Fungsi untuk membangun tampilan UI
    return Scaffold( // Membuat Scaffold sebagai struktur dasar layout
      appBar: AppBar( // Membuat AppBar di bagian atas
        title: const Text("Register"), // Menampilkan judul
        leading: const BackButton(), // Menampilkan tombol kembali di AppBar
      ),
      body: Padding( // Menambahkan padding di sekeliling konten
        padding: const EdgeInsets.all(16.0), // Padding 16 piksel di semua sisi
        child: Column( // Membuat kolom untuk menampung widget
          crossAxisAlignment: CrossAxisAlignment.stretch, // Mengatur semua widget untuk membentang penuh
          children: [
            TextField( // Membuat TextField untuk input username
              controller: _usernameController, // Menghubungkan controller
              decoration: const InputDecoration(labelText: "Username"), // Mengatur label
            ),
            const SizedBox(height: 10), // Memberi jarak antara TextField
            TextField( // Membuat TextField untuk input email
              controller: _emailController, // Menghubungkan controller
              decoration: const InputDecoration(labelText: "Email"), // Mengatur label
            ),
            const SizedBox(height: 10), // Memberi jarak antara TextField
            TextField( // Membuat TextField untuk input password
              controller: _passwordController, // Menghubungkan controller
              decoration: const InputDecoration(labelText: "Password"), // Mengatur label
              obscureText: true, // Menyembunyikan teks untuk keamanan
            ),
            const SizedBox(height: 10), // Memberi jarak antara TextField
            TextField( // Membuat TextField untuk input konfirmasi password
              controller: _confirmPasswordController, // Menghubungkan controller
              decoration: const InputDecoration(labelText: "Confirm Password"), // Mengatur label
              obscureText: true, // Menyembunyikan teks untuk keamanan
            ),
            const SizedBox(height: 20), // Memberi jarak sebelum tombol
            ElevatedButton( // Membuat tombol untuk registrasi
              onPressed: _register, // Panggil fungsi _register saat tombol ditekan
              style: ElevatedButton.styleFrom( // Mengatur gaya tombol
                backgroundColor: Colors.yellow, // Mengatur warna latar belakang tombol
                foregroundColor: Colors.black, // Mengatur warna teks tombol
              ),
              child: const Text("Register"), // Mengatur teks pada tombol
            ),
          ],
        ),
      ),
    );
  }
}
