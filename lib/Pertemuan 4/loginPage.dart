import 'package:flutter/material.dart'; // Mengimpor paket material design dari Flutter
// import 'dart:developerd'; // Kode ini dikomentari karena tidak digunakan
import 'homeScreen.dart'; // Mengimpor file homeScreen.dart yang berisi halaman home

void main() => runApp(
    MyApp()); // Fungsi utama untuk menjalankan aplikasi dengan menjalankan MyApp

// Kelas MyApp sebagai widget utama aplikasi
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Login', // Menetapkan judul aplikasi
      theme: ThemeData(
        primarySwatch:
            Colors.deepPurple, // Menetapkan tema warna utama aplikasi
      ),
      home:
          LoginPage(), // Menampilkan halaman login saat aplikasi pertama kali dibuka
    );
  }
}

// Kelas LoginPage yang merupakan halaman login, stateful widget
class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() =>
      _LoginPageState(); // Membuat state dari LoginPage
}

// State dari LoginPage
class _LoginPageState extends State<LoginPage> {
  final TextEditingController _usernameController =
      TextEditingController(); // Mengontrol input dari kolom username
  final TextEditingController _passwordController =
      TextEditingController(); // Mengontrol input dari kolom password
  final _formKey =
      GlobalKey<FormState>(); // Membuat kunci global untuk validasi form
  String?
      errorMessage; // Variabel untuk menyimpan pesan kesalahan jika validasi gagal

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text('Login')), // Membuat AppBar dengan judul "Login"
      body: Padding(
        padding: const EdgeInsets.all(
            16.0), // Memberikan padding di sekeliling layar
        child: Form(
          key: _formKey, // Menetapkan kunci form untuk validasi
          child: Column(
            mainAxisAlignment: MainAxisAlignment
                .center, // Mengatur posisi widget berada di tengah secara vertikal
            children: [
              Image.asset(
                'assets/image/uty.png', // Memuat gambar dari direktori aset
                width: 200.0, // Lebar gambar
                height: 200.0, // Tinggi gambar
                filterQuality:
                    FilterQuality.medium, // Menetapkan kualitas filter gambar
              ), // Gambar logo atau ilustrasi pada halaman login
              const SizedBox(
                  height: 16), // Memberikan jarak vertikal sebesar 16 piksel
              TextFormField(
                controller:
                    _usernameController, // Menghubungkan TextEditingController dengan input username
                decoration: const InputDecoration(
                  labelText: 'Username', // Label untuk kolom input
                  hintText:
                      'Enter Username', // Placeholder atau petunjuk teks di kolom input
                ),
              ),
              const SizedBox(
                  height:
                      16), // Jarak vertikal antara kolom username dan password
              TextFormField(
                controller:
                    _passwordController, // Menghubungkan TextEditingController dengan input password
                decoration: const InputDecoration(
                  labelText: 'Password', // Label untuk kolom input password
                  hintText:
                      'Enter password', // Placeholder untuk kolom input password
                ),
                obscureText:
                    true, // Menyembunyikan teks saat pengguna mengetikkan password
              ),
              const SizedBox(
                  height: 16), // Jarak vertikal setelah kolom password
              if (errorMessage !=
                  null) // Jika ada pesan kesalahan, tampilkan pesan tersebut
                Text(
                  errorMessage!, // Menampilkan pesan kesalahan
                  style: const TextStyle(
                      color: Colors
                          .red), // Pesan kesalahan ditampilkan dalam warna merah
                ),
              Row(
                mainAxisAlignment: MainAxisAlignment
                    .end, // Menempatkan tombol di sebelah kanan
                children: [
                  TextButton(
                    onPressed: () {
                      // Aksi jika tombol "Forgot Password" ditekan (fungsi ini belum diimplementasikan)
                    },
                    child: const Text(
                      'Forgot Password?', // Teks pada tombol "Forgot Password"
                      style: TextStyle(
                        color: Colors.blue, // Warna teks tombol biru
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16), // Jarak vertikal sebelum tombol login
              ElevatedButton(
                onPressed:
                    _validateLogin, // Menjalankan fungsi _validateLogin saat tombol ditekan
                style: ElevatedButton.styleFrom(
                  backgroundColor:
                      Colors.yellow, // Warna latar belakang tombol kuning
                  foregroundColor: Colors.black, // Warna teks tombol hitam
                ),
                child: const Text('Login'), // Teks pada tombol "Login"
              ),
              const SizedBox(
                  height: 10), // Jarak vertikal sebelum tombol register
              TextButton(
                onPressed: () {
                  // Aksi jika tombol "Register" ditekan (fungsi ini belum diimplementasikan)
                },
                child: const Text(
                  'Register', // Teks pada tombol "Register"
                  style: TextStyle(
                    color: Colors.black, // Warna teks tombol hitam
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Fungsi untuk memvalidasi input login
  void _validateLogin() {
    String username = _usernameController.text
        .trim(); // Mengambil input username dan menghapus spasi di awal/akhir
    String password = _passwordController.text
        .trim(); // Mengambil input password dan menghapus spasi di awal/akhir

    setState(() {
      if (username.isEmpty && password.isEmpty) {
        // Jika username dan password kosong
        errorMessage =
            "Masukkan username dan password."; // Tampilkan pesan kesalahan
      } else if (username.isEmpty) {
        // Jika hanya username yang kosong
        errorMessage =
            "Anda belum mengisi username."; // Tampilkan pesan kesalahan
      } else if (password.isEmpty) {
        // Jika hanya password yang kosong
        errorMessage =
            "Anda belum mengisi password."; // Tampilkan pesan kesalahan
      } else {
        errorMessage = null; // Bersihkan pesan kesalahan
        // Navigasi ke halaman beranda (HomePage) dengan membawa data username
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => HomePage(
                username:
                    username), // Pindah ke halaman beranda dan kirim username
          ),
        );
      }
    });
  }
}
