import 'package:flutter/material.dart'; // Mengimpor paket Material Design dari Flutter
import 'package:http/http.dart' as http; // Mengimpor paket HTTP untuk mengirim permintaan HTTP ke server
import 'dart:convert'; // Mengimpor paket untuk mengonversi data JSON dari server
import 'homeScreen.dart'; // Mengimpor halaman beranda (home screen) dari file homeScreen.dart
import 'registerPage.dart'; // Mengimpor halaman registrasi (register page) dari file registerPage.dart
import 'forgotPasswordPage.dart'; // Mengimpor halaman lupa password dari file forgotPasswordPage.dart

void main() => runApp(MyApp()); // Fungsi utama untuk menjalankan aplikasi Flutter dengan MyApp sebagai widget utama

// Kelas MyApp sebagai widget utama aplikasi
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Login', // Menetapkan judul aplikasi
      theme: ThemeData(
        primarySwatch: Colors.deepPurple, // Menetapkan tema warna utama aplikasi
      ),
      home: LoginPage(), // Menampilkan halaman login saat aplikasi pertama kali dibuka
    );
  }
}

// Kelas LoginPage yang merupakan halaman login, menggunakan StatefulWidget
class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState(); // Membuat dan menghubungkan state dari LoginPage
}

// State dari LoginPage yang bertanggung jawab untuk mengelola data input dan logika
class _LoginPageState extends State<LoginPage> {
  final TextEditingController _usernameController = TextEditingController(); // Kontrol input teks username
  final TextEditingController _passwordController = TextEditingController(); // Kontrol input teks password
  final _formKey = GlobalKey<FormState>(); // Kunci global untuk validasi form
  String? errorMessage; // Variabel untuk menyimpan pesan kesalahan jika validasi gagal

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Login')), // Membuat AppBar dengan judul "Login"
      body: Padding(
        padding: const EdgeInsets.all(16.0), // Menyisipkan padding di sekeliling layar
        child: Form(
          key: _formKey, // Menghubungkan form dengan kunci untuk validasi
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center, // Mengatur posisi widget berada di tengah secara vertikal
            children: [
              Image.asset(
                'assets/image/uty.png', // Memuat gambar dari folder assets
                width: 200.0, // Menentukan lebar gambar
                height: 200.0, // Menentukan tinggi gambar
                filterQuality: FilterQuality.medium, // Menetapkan kualitas gambar
              ),
              const SizedBox(height: 16), // Menyisipkan jarak vertikal sebesar 16 piksel
              TextFormField(
                controller: _usernameController, // Menghubungkan TextEditingController dengan input username
                decoration: const InputDecoration(
                  labelText: 'Username', // Label untuk kolom input username
                  hintText: 'Enter Username', // Placeholder atau petunjuk di kolom input username
                ),
              ),
              const SizedBox(height: 16), // Jarak vertikal antara kolom username dan password
              TextFormField(
                controller: _passwordController, // Menghubungkan TextEditingController dengan input password
                decoration: const InputDecoration(
                  labelText: 'Password', // Label untuk kolom input password
                  hintText: 'Enter password', // Placeholder atau petunjuk di kolom input password
                ),
                obscureText: true, // Menyembunyikan teks password saat mengetik
              ),
              const SizedBox(height: 16), // Jarak vertikal setelah kolom password
              if (errorMessage != null) // Jika ada pesan kesalahan, tampilkan pesan tersebut
                Text(
                  errorMessage!, // Menampilkan pesan kesalahan yang tersimpan
                  style: const TextStyle(color: Colors.red), // Pesan kesalahan ditampilkan dalam warna merah
                ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end, // Menempatkan tombol di sebelah kanan
                children: [
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => ForgotPasswordPage()),
                      );
                    },
                    child: const Text(
                      'Forgot Password?', // Teks pada tombol "Forgot Password"
                      style: TextStyle(color: Colors.blue), // Warna teks tombol biru
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16), // Jarak vertikal sebelum tombol login
              ElevatedButton(
                onPressed: _validateLogin, // Menjalankan fungsi _validateLogin saat tombol ditekan
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.yellow, // Warna latar belakang tombol kuning
                  foregroundColor: Colors.black, // Warna teks tombol hitam
                ),
                child: const Text('Login'), // Teks pada tombol "Login"
              ),
              const SizedBox(height: 10), // Jarak vertikal sebelum tombol register
              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => RegisterPage()),
                  );
                },
                child: const Text(
                  'Register', // Teks pada tombol "Register"
                  style: TextStyle(color: Colors.black), // Warna teks tombol hitam
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Fungsi untuk memvalidasi input login
  void _validateLogin() async {
    String username = _usernameController.text.trim(); // Mengambil input username dan menghapus spasi di awal/akhir
    String password = _passwordController.text.trim(); // Mengambil input password dan menghapus spasi di awal/akhir

    setState(() {
      if (username.isEmpty && password.isEmpty) {
        errorMessage = "Masukkan username dan password."; // Jika kedua input kosong, tampilkan pesan kesalahan
      } else if (username.isEmpty) {
        errorMessage = "Anda belum mengisi username."; // Jika username kosong, tampilkan pesan kesalahan
      } else if (password.isEmpty) {
        errorMessage = "Anda belum mengisi password."; // Jika password kosong, tampilkan pesan kesalahan
      } else {
        errorMessage = null; // Jika tidak ada kesalahan, bersihkan pesan kesalahan
        _login(username, password); // Panggil fungsi login
      }
    });
  }

  // Fungsi untuk mengirim permintaan login ke server
  Future<void> _login(String username, String password) async {
    final String url = 'http://localhost/flutter_api_materi5/login_page.php'; // URL endpoint API untuk login

    try {
      final response = await http.post( // Mengirim permintaan POST ke server
        Uri.parse(url),
        body: {
          'username': username,
          'psw': password,
        },
      );

      // Memeriksa respons dari server untuk login
      if (response.statusCode == 200) {
        final responseData = json.decode(response.body); // Decode JSON dari response

        if (responseData['message'] == 'Login berhasil!') {
          // Jika login berhasil, navigasi ke halaman beranda
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => HomePage(username: username)), // Pindah ke halaman beranda
          );
        } else if (responseData['message'] == 'Username tidak ditemukan!') {
          _showErrorDialog('Akun tidak ditemukan. Silakan coba lagi.'); // Tampilkan popup jika username salah
        } else if (responseData['message'] == 'Password salah!') {
          _showErrorDialog('Password salah. Silakan coba lagi.'); // Tampilkan popup jika password salah
        } else {
          setState(() {
            errorMessage = responseData['message']; // Tampilkan pesan kesalahan dari server jika ada
          });
        }
      } else {
        setState(() {
          errorMessage = "Terjadi kesalahan, silakan coba lagi."; // Pesan kesalahan jika terjadi masalah
        });
      }
    } catch (e) {
      setState(() {
        errorMessage = "Koneksi gagal, silakan coba lagi."; // Pesan kesalahan untuk masalah koneksi jaringan
      });
    }
  }

  // Fungsi untuk menampilkan dialog kesalahan
  void _showErrorDialog(String message) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Peringatan'), // Judul dialog
          content: Text(message), // Pesan yang akan ditampilkan di dialog
          actions: <Widget>[
            TextButton(
              child: const Text('OK'), // Tombol untuk menutup dialog
              onPressed: () {
                Navigator.of(context).pop(); // Menutup dialog
              },
            ),
          ],
        );
      },
    );
  }
}
