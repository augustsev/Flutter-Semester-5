import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key}); // Konstruktor untuk HomePage

  @override
  State<HomePage> createState() => _HomePageState(); // Membuat state untuk HomePage
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Home', // Judul untuk AppBar
          style: TextStyle(
            fontSize: 16.0, // Ukuran font
            fontWeight: FontWeight.w600, // Ketebalan font
          ),
        ),
      ),
      body: SafeArea(
        child: Center(
          child: ElevatedButton(
            onPressed: () => Navigator.pushNamed(context, '/detail'), // Navigasi ke halaman detail
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blue, // Warna latar belakang tombol
              foregroundColor: Colors.white, // Warna teks tombol
            ),
            child: const Text(
              'Go to Detail Page', // Teks pada tombol
            ),
          ),
        ),
      ),
    );
  }
}
