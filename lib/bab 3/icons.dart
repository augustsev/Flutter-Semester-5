import 'package:flutter/material.dart'; // Mengimpor material design dari Flutter

class IconPage extends StatefulWidget { // Membuat StatefulWidget untuk IconPage
  const IconPage({super.key}); // Konstruktor StatefulWidget

  @override
  State<IconPage> createState() => _IconPageState(); // Menghubungkan State
}

class _IconPageState extends State<IconPage> { // State untuk IconPage
  @override
  Widget build(BuildContext context) { // Metode build untuk membangun widget
    return Scaffold( // Scaffold sebagai struktur dasar halaman
      appBar: AppBar( // AppBar untuk header halaman
        title: const Text( // Teks di dalam AppBar
          'Icon', // Judul AppBar
          style: TextStyle( // Gaya teks
            fontSize: 16.8, // Ukuran font
            fontWeight: FontWeight.w600, // Ketebalan font
          ),
        ),
      ),
      body: const SafeArea( // SafeArea untuk memastikan konten tidak terpotong oleh status bar atau notch
        child: Center( // Widget Center untuk memusatkan konten
          child: Column( // Kolom untuk menempatkan beberapa widget di dalamnya
            mainAxisAlignment: MainAxisAlignment.center, // Pusatkan widget secara vertikal
            children: [
              Row( // Baris pertama untuk ikon jempol
                mainAxisAlignment: MainAxisAlignment.center, // Pusatkan widget dalam baris secara horizontal
                children: [
                  Icon( // Ikon jempol ke atas
                    Icons.thumb_up_rounded,
                  ),
                  SizedBox(width: 16.0), // Spasi antara ikon
                  Icon( // Ikon jempol ke bawah
                    Icons.thumb_down_rounded,
                  ),
                ],
              ),
              SizedBox(height: 16.0), // Spasi antara baris pertama dan kedua
              Row( // Baris kedua dengan ikon berwarna dan ukuran lebih besar
                mainAxisAlignment: MainAxisAlignment.center, // Pusatkan widget dalam baris secara horizontal
                children: [
                  Icon( // Ikon jempol ke atas dengan warna biru dan ukuran 32
                    Icons.thumb_up_rounded,
                    color: Colors.blue,
                    size: 32.0,
                  ),
                  SizedBox(width: 16.0), // Spasi antara ikon
                  Icon( // Ikon jempol ke bawah dengan warna merah dan ukuran 32
                    Icons.thumb_down_rounded,
                    color: Colors.red,
                    size: 32.0,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
