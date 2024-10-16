import 'package:flutter/material.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({super.key}); // Konstruktor untuk DetailPage

  @override
  State<DetailPage> createState() => _DetailPageState(); // Membuat state untuk DetailPage
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Detail', // Judul untuk AppBar
          style: TextStyle(
            fontSize: 16.0, // Ukuran font
            fontWeight: FontWeight.w600, // Ketebalan font
          ),
        ),
      ),
      body: SafeArea(
        child: Center(
          child: ElevatedButton(
            onPressed: () => Navigator.pop(context), // Kembali ke halaman sebelumnya
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.red, // Warna latar belakang tombol
              foregroundColor: Colors.white, // Warna teks tombol
            ),
            child: const Text(
              'Go back to Home', // Teks pada tombol
            ),
          ),
        ),
      ),
    );
  }
}
