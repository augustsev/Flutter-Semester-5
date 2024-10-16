import 'package:flutter/material.dart'; // Mengimpor material design dari Flutter

class ImageAssetPage extends StatefulWidget { // Membuat StatefulWidget untuk ImageAssetPage
  const ImageAssetPage({super.key}); // Konstruktor StatefulWidget

  @override
  State<ImageAssetPage> createState() => _ImageAssetPageState(); // Menghubungkan State
}

class _ImageAssetPageState extends State<ImageAssetPage> { // State untuk ImageAssetPage
  @override
  Widget build(BuildContext context) { // Metode build untuk membangun widget
    return Scaffold( // Scaffold sebagai struktur dasar halaman
      appBar: AppBar( // AppBar untuk header halaman
        title: const Text( // Teks di dalam AppBar
          'Image Asset', // Judul AppBar
          style: TextStyle( // Gaya teks
            fontSize: 16.0, // Ukuran font
            fontWeight: FontWeight.w600, // Ketebalan font
          ),
        ),
      ),
      body: SafeArea( // SafeArea untuk memastikan konten tidak terpotong oleh status bar atau notch
        child: Center( // Widget Center untuk memusatkan konten
          child: ClipRRect( // ClipRRect untuk membuat border-radius pada gambar
            borderRadius: BorderRadius.circular(8.0), // Border radius untuk melengkungkan tepi gambar
            child: Image.asset( // Menampilkan gambar dari asset lokal menggunakan Image.asset
              'assets/image/malioboro.jpeg', // Lokasi gambar di folder assets
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
