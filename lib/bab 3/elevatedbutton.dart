import 'dart:developer'; // Mengimpor paket dart:developer untuk log
import 'package:flutter/material.dart'; // Mengimpor paket material dari Flutter


class ElevatedButtonPage extends StatefulWidget { // Membuat StatefulWidget bernama ElevatedButtonPage
  const ElevatedButtonPage({super.key}); // Konstruktor untuk ElevatedButtonPage

  @override
  State<ElevatedButtonPage> createState() => _ElevatedButtonPageState(); // Menghubungkan dengan state _ElevatedButtonPageState
}

class _ElevatedButtonPageState extends State<ElevatedButtonPage> { // State dari ElevatedButtonPage
  @override
  Widget build(BuildContext context) { // Metode build untuk membangun widget
    return Scaffold( // Scaffold untuk struktur dasar tampilan
      appBar: AppBar( // AppBar untuk bagian atas halaman
        title: const Text( // Judul AppBar
          'ElevatedButton', // Teks judul
          style: TextStyle( // Mengatur gaya teks
            fontSize: 16.0, // Ukuran font
            fontWeight: FontWeight.w600, // Ketebalan font
          ),
        ),
      ),
      body: SafeArea( // SafeArea untuk memastikan tampilan tidak terpotong
        child: Center( // Widget Center untuk memusatkan konten
          child: Padding( // Padding untuk memberi ruang di sekitar konten
            padding: const EdgeInsets.all(16.0), // Jarak padding di semua sisi
            child: Column( // Column untuk menata widget secara vertikal
              mainAxisAlignment: MainAxisAlignment.center, // Menyusun di tengah secara vertikal
              children: [
                ElevatedButton( // ElevatedButton pertama
                  onPressed: () => log('Button clicked'), // Tindakan saat tombol diklik
                  style: ElevatedButton.styleFrom( // Mengatur gaya tombol
                    backgroundColor: Colors.indigo, // Warna latar tombol
                    foregroundColor: Colors.white, // Warna teks
                  ),
                  child: const Text('Click Me'), // Teks pada tombol
                ),
                const SizedBox(height: 16.0), // Jarak antar widget
                ElevatedButton.icon( // ElevatedButton dengan ikon
                  onPressed: () => log('Button clicked'), // Tindakan saat tombol diklik
                  style: ElevatedButton.styleFrom( // Gaya tombol
                    backgroundColor: Colors.green, // Warna latar tombol
                    foregroundColor: Colors.white, // Warna teks
                  ),
                  icon: const Icon(Icons.play_arrow_rounded), // Ikon pada tombol
                  label: const Text('Click Me'), // Teks pada tombol
                ),
                const SizedBox(height: 16.0), // Jarak antar widget
                SizedBox( // SizedBox untuk mengatur ukuran tombol
                  width: double.maxFinite, // Lebar penuh
                  height: 48.0, // Tinggi 48.0
                  child: ElevatedButton.icon( // ElevatedButton dengan ikon
                    onPressed: () => log('Button clicked'), // Tindakan saat tombol diklik
                    style: ElevatedButton.styleFrom( // Gaya tombol
                      backgroundColor: Colors.blue, // Warna latar tombol
                      foregroundColor: Colors.white, // Warna teks
                      shape: RoundedRectangleBorder( // Membuat tombol dengan sudut melengkung
                        borderRadius: BorderRadius.circular(8.0), // Sudut melengkung 8.0
                      ),
                    ),
                    icon: const Icon(Icons.play_arrow_rounded), // Ikon pada tombol
                    label: const Text('Click Me'), // Teks pada tombol
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
