import 'package:flutter/material.dart'; // Mengimpor paket material dari Flutter
import 'bab6detailscreen.dart'; // Mengimpor halaman Detail
import 'bab6homescreen.dart'; // Mengimpor halaman Home

void main() {
  runApp(const MyApp()); // Menjalankan aplikasi dengan MyApp sebagai root
}

class MyApp extends StatelessWidget { // Kelas utama aplikasi
  const MyApp({super.key}); // Konstruktor untuk MyApp

  @override
  Widget build(BuildContext context) { // Metode build untuk membangun widget
    return MaterialApp(
      title: 'Quick Note', // Judul aplikasi
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple), // Mengatur tema dengan warna dasar
        useMaterial3: true, // Menggunakan Material 3
      ),
      initialRoute: '/', // Rute awal aplikasi
      routes: { // Mendefinisikan rute untuk navigasi
        '/': (context) => const HomePage(), // Rute utama
        '/detail': (context) => const DetailPage(), // Rute untuk halaman detail
      },
    );
  }
}
