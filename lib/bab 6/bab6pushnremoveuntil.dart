import 'package:flutter/material.dart'; // Mengimpor paket material dari Flutter
import 'package:bab3/bab 5/bab5extent.dart';

class PushremoveuntilNavigationPage extends StatefulWidget { // Membuat StatefulWidget untuk PushremoveuntilNavigationPage
  const PushremoveuntilNavigationPage({super.key}); // Konstruktor StatefulWidget

  @override
  State<PushremoveuntilNavigationPage> createState() => _PushremoveuntilNavigationPageState(); // Menghubungkan State
}

class _PushremoveuntilNavigationPageState extends State<PushremoveuntilNavigationPage> { // State untuk PushremoveuntilNavigationPage
  @override
  Widget build(BuildContext context) { // Metode build untuk membangun widget
    return Scaffold( // Scaffold sebagai struktur dasar halaman
      appBar: AppBar( // AppBar untuk header halaman
        title: const Text( // Teks di dalam AppBar
          'Push RemoveUntil Navigation', // Judul AppBar
          style: TextStyle( // Gaya teks untuk AppBar
            fontSize: 16.0, // Ukuran font
            fontWeight: FontWeight.w600, // Ketebalan font
          ),
        ),
      ),
      body: SafeArea( // SafeArea untuk memastikan konten tidak terpotong oleh status bar atau notch
        child: Center( // Memusatkan konten di dalam body
          child: ElevatedButton( // Tombol yang dapat diklik
            onPressed: () => Navigator.pushAndRemoveUntil( // Menangani navigasi saat tombol ditekan
              context,
              MaterialPageRoute( // Menggunakan MaterialPageRoute untuk navigasi ke halaman baru
                builder: (context) => const GridViewExtentPage(), // Halaman yang dituju
              ),
              (route) => false, // Menghapus semua rute di atas halaman baru
            ),
            style: ElevatedButton.styleFrom( // Mengatur gaya tombol
              backgroundColor: Colors.red, // Warna latar belakang tombol
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
