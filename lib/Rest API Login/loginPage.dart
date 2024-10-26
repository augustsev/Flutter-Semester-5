import 'package:flutter/material.dart'; // Mengimpor paket material design dari Flutter
import 'package:http/http.dart' as http; // Mengimpor paket HTTP untuk permintaan
import 'dart:convert'; // Mengimpor paket untuk mengonversi JSON
import 'homeScreen.dart'; // Mengimpor file homeScreen.dart yang berisi halaman home
import 'registerPage.dart';
import 'forgotPasswordPage.dart';

void main() => runApp(MyApp()); // Fungsi utama untuk menjalankan aplikasi dengan menjalankan MyApp

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

// Kelas LoginPage yang merupakan halaman login, stateful widget
class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState(); // Membuat state dari LoginPage
}

// State dari LoginPage
class _LoginPageState extends State<LoginPage> {
  final TextEditingController _usernameController = TextEditingController(); // Mengontrol input dari kolom username
  final TextEditingController _passwordController = TextEditingController(); // Mengontrol input dari kolom password
  final _formKey = GlobalKey<FormState>(); // Membuat kunci global untuk validasi form
  String? errorMessage; // Variabel untuk menyimpan pesan kesalahan jika validasi gagal

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Login')), // Membuat AppBar dengan judul "Login"
      body: Padding(
        padding: const EdgeInsets.all(16.0), // Memberikan padding di sekeliling layar
        child: Form(
          key: _formKey, // Menetapkan kunci form untuk validasi
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center, // Mengatur posisi widget berada di tengah secara vertikal
            children: [
              Image.asset(
                'assets/image/uty.png', // Memuat gambar dari direktori aset
                width: 200.0, // Lebar gambar
                height: 200.0, // Tinggi gambar
                filterQuality: FilterQuality.medium, // Menetapkan kualitas filter gambar
              ), // Gambar logo atau ilustrasi pada halaman login
              const SizedBox(height: 16), // Jarak vertikal sebesar 16 piksel
              TextFormField(
                controller: _usernameController, // Menghubungkan TextEditingController dengan input username
                decoration: const InputDecoration(
                  labelText: 'Username', // Label untuk kolom input
                  hintText: 'Enter Username', // Placeholder atau petunjuk teks di kolom input
                ),
              ),
              const SizedBox(height: 16), // Jarak vertikal antara kolom username dan password
              TextFormField(
                controller: _passwordController, // Menghubungkan TextEditingController dengan input password
                decoration: const InputDecoration(
                  labelText: 'Password', // Label untuk kolom input password
                  hintText: 'Enter password', // Placeholder untuk kolom input password
                ),
                obscureText: true, // Menyembunyikan teks saat pengguna mengetikkan password
              ),
              const SizedBox(height: 16), // Jarak vertikal setelah kolom password
              if (errorMessage != null) // Jika ada pesan kesalahan, tampilkan pesan tersebut
                Text(
                  errorMessage!, // Menampilkan pesan kesalahan
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
    String username = _usernameController.text.trim(); // Mengambil input username
    String password = _passwordController.text.trim(); // Mengambil input password

    setState(() {
      if (username.isEmpty && password.isEmpty) {
        errorMessage = "Masukkan username dan password."; // Tampilkan pesan kesalahan
      } else if (username.isEmpty) {
        errorMessage = "Anda belum mengisi username."; // Tampilkan pesan kesalahan
      } else if (password.isEmpty) {
        errorMessage = "Anda belum mengisi password."; // Tampilkan pesan kesalahan
      } else {
        errorMessage = null; // Bersihkan pesan kesalahan
        _login(username, password); // Panggil fungsi login
      }
    });
  }

  // Fungsi untuk mengirim permintaan login ke server
  Future<void> _login(String username, String password) async {
    final String url = 'http://localhost/flutter_api_materi5/login_page.php'; // URL API login

    try {
      // Mengirim request POST
      final response = await http.post(
        Uri.parse(url),
        body: {
          'username': username,
          'psw': password,
        },
      );

      // Memeriksa respons dari API
      if (response.statusCode == 200) {
        final responseData = json.decode(response.body);

        if (responseData['message'] == 'Login berhasil!') {
          // Jika login berhasil, navigasi ke halaman beranda
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => HomePage(username: username)), // Pindah ke halaman beranda dan kirim username
          );
        } else if (responseData['message'] == 'Username tidak ditemukan!') {
          // Tampilkan popup jika username tidak ditemukan
          _showErrorDialog('Akun tidak ditemukan. Silakan coba lagi.');
        } else if (responseData['message'] == 'Password salah!') {
          // Tampilkan popup jika password salah
          _showErrorDialog('Password salah. Silakan coba lagi.');
        } else {
          setState(() {
            errorMessage = responseData['message']; // Tampilkan pesan kesalahan dari server
          });
        }
      } else {
        setState(() {
          errorMessage = "Terjadi kesalahan, silakan coba lagi."; // Tampilkan pesan kesalahan umum
        });
      }
    } catch (e) {
      setState(() {
        errorMessage = "Koneksi gagal, silakan coba lagi."; // Pesan kesalahan untuk masalah jaringan
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
          content: Text(message), // Pesan yang akan ditampilkan
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
