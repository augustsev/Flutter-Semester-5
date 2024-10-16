import 'package:flutter/material.dart'; // Mengimpor paket material dari Flutter
import 'package:bab3/bab 5/bab5extent.dart';

class PushNavigationPage extends StatefulWidget { // Membuat StatefulWidget untuk PushNavigationPage
  const PushNavigationPage({super.key}); // Konstruktor StatefulWidget

  @override
  State<PushNavigationPage> createState() => _PushNavigationPageState(); // Menghubungkan State
}

class _PushNavigationPageState extends State<PushNavigationPage> { // State untuk PushNavigationPage
  @override
  Widget build(BuildContext context) { // Metode build untuk membangun widget
    return Scaffold( // Scaffold sebagai struktur dasar halaman
      appBar: AppBar( // AppBar untuk header halaman
        title: const Text( // Teks di dalam AppBar
          'Push Navigation', // Judul AppBar
          style: TextStyle( // Gaya teks untuk AppBar
            fontSize: 16.0, // Ukuran font
            fontWeight: FontWeight.w600, // Ketebalan font
          ),
        ),
      ),
      body: SafeArea( // SafeArea untuk memastikan konten tidak terpotong oleh status bar atau notch
        child: Center( // Memusatkan konten di dalam body
          child: ElevatedButton( // Tombol yang dapat diklik
            onPressed: () => Navigator.push( // Menangani navigasi saat tombol ditekan
              context,
              MaterialPageRoute( // Menggunakan MaterialPageRoute untuk navigasi ke halaman baru
                builder: (context) => const GridViewExtentPage(), // Halaman yang dituju
              ),
            ),
            style: ElevatedButton.styleFrom( // Mengatur gaya tombol
              backgroundColor: Colors.blue, // Warna latar belakang tombol
              foregroundColor: Colors.white, // Warna teks tombol
            ),
            child: const Text( // Teks yang ditampilkan di tombol
              'Go to Detail Page', // Teks tombol
            ),
          ),
        ),
      ),
    );
  }
}
