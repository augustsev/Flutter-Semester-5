import 'package:flutter/material.dart';  // Mengimpor package material untuk mendukung UI berbasis material design

// Membuat class StatefulWidget bernama StackPositionedPage
class StackPositionedPage extends StatefulWidget {
  const StackPositionedPage({super.key});  // Konstruktor dari StackPositionedPage

  @override
  State<StackPositionedPage> createState() => _StackPositionedPageState();  
  // Metode untuk membuat State yang terkait dengan widget ini
}

// State untuk StackPositionedPage
class _StackPositionedPageState extends State<StackPositionedPage> {
  @override
  Widget build(BuildContext context) {  
    // Fungsi build untuk membangun UI
    return Scaffold(  // Scaffold menyediakan struktur dasar visual untuk layar
      appBar: AppBar(  // AppBar adalah bagian atas aplikasi dengan judul
        title: const Text(  
          'Stack & Positioned',  // Menampilkan judul di AppBar
          style: TextStyle(  
            fontSize: 16.0,  // Ukuran font judul
            fontWeight: FontWeight.w600,  // Ketebalan font
          ),
        ),
      ),
      body: SafeArea(  
        // SafeArea memastikan konten tidak terpotong oleh status bar atau lekukan layar
        child: Stack(  
          // Stack menumpuk widget di atas satu sama lain dalam satu tumpukan
          children: [
            Center(  
              // Center memposisikan widget anak di tengah layar
              child: Container(
                width: 100.0,  // Lebar container biru
                height: 100.0,  // Tinggi container biru
                color: Colors.blue,  // Warna biru untuk container ini
              ),
            ),
            Positioned(  
              // Positioned digunakan untuk menempatkan widget secara absolut di Stack
              left: 0.0,  // Posisi dari kiri layar
              right: 0.0,  // Posisi dari kanan layar
              top: 0.0,  // Posisi dari atas layar
              bottom: 0.0,  // Posisi dari bawah layar
              child: Center(  
                // Center memposisikan anak di tengah dari Positioned
                child: Container(
                  width: 50.0,  // Lebar container merah
                  height: 50.0,  // Tinggi container merah
                  color: Colors.red,  // Warna merah untuk container ini
                ),
              ),
            ),
            Positioned(
              left: 0.0,  // Menempatkan container di pojok kiri atas
              top: 0.0,  // Menempatkan container di pojok kiri atas
              child: Center(
                child: Container(
                  width: 50.0,  // Lebar container merah di kiri atas
                  height: 50.0,  // Tinggi container merah di kiri atas
                  color: Colors.red,  // Warna merah untuk container ini
                ),
              ),
            ),
            Positioned(
              right: 0.0,  // Menempatkan container di pojok kanan bawah
              bottom: 0.0,  // Menempatkan container di pojok kanan bawah
              child: Center(
                child: Container(
                  width: 100.0,  // Lebar container oranye
                  height: 100.0,  // Tinggi container oranye
                  color: Colors.orange,  // Warna oranye untuk container ini
                ),
              ),
            ),
            Positioned(
              right: 0.0,  // Menempatkan container di pojok kanan bawah
              bottom: 0.0,  // Menempatkan container di pojok kanan bawah
              child: Center(
                child: Container(
                  width: 50.0,  // Lebar container indigo
                  height: 50.0,  // Tinggi container indigo
                  color: Colors.indigo,  // Warna indigo untuk container ini
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
