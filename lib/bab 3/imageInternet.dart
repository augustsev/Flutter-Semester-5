import 'package:flutter/material.dart'; // Mengimpor material design dari Flutter

class ImageNetworkPage extends StatefulWidget { // Membuat StatefulWidget untuk ImageNetworkPage
  const ImageNetworkPage({super.key}); // Konstruktor StatefulWidget

  @override
  State<ImageNetworkPage> createState() => _ImageNetworkPageState(); // Menghubungkan State
}

class _ImageNetworkPageState extends State<ImageNetworkPage> { // State untuk ImageNetworkPage
  @override
  Widget build(BuildContext context) { // Metode build untuk membangun widget
    return Scaffold( // Scaffold sebagai struktur dasar halaman
      appBar: AppBar( // AppBar untuk header halaman
        title: const Text( // Teks di dalam AppBar
          'Image Network', // Judul AppBar
          style: TextStyle( // Gaya teks
            fontSize: 16.8, // Ukuran font
            fontWeight: FontWeight.w600, // Ketebalan font
          ),
        ),
      ),
      body: SafeArea( // SafeArea untuk memastikan konten tidak terpotong oleh status bar atau notch
        child: Center( // Widget Center untuk memusatkan konten
          child: ClipRRect( // ClipRRect untuk membuat border-radius pada gambar
            borderRadius: BorderRadius.circular(8.0), // Border radius untuk melengkungkan tepi gambar
            child: Image.network( // Menampilkan gambar dari URL menggunakan Image.network
              'https://images.unsplash.com/photo-1646423875983-9b2488aa7137?q=80&w=3376&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D', // URL gambar
              width: 300.0, // Lebar gambar
              height: 300.0, // Tinggi gambar
              fit: BoxFit.cover, // Menyesuaikan ukuran gambar
              filterQuality: FilterQuality.medium, // Kualitas filter gambar
            ),
          ),
        ),
      ),
    );
  }
}
