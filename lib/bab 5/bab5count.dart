import 'package:flutter/material.dart'; // Mengimpor paket material dari Flutter

class GridViewCountPage extends StatefulWidget { // Membuat StatefulWidget untuk GridViewCountPage
  const GridViewCountPage({super.key}); // Konstruktor StatefulWidget

  @override
  State<GridViewCountPage> createState() => _GridViewCountPageState(); // Menghubungkan State
}

class _GridViewCountPageState extends State<GridViewCountPage> { // State untuk GridViewCountPage
  @override
  Widget build(BuildContext context) { // Metode build untuk membangun widget
    return Scaffold( // Scaffold sebagai struktur dasar halaman
      appBar: AppBar( // AppBar untuk header halaman
        title: const Text( // Teks di dalam AppBar
          'GridView Count', // Judul AppBar
          style: TextStyle( // Gaya teks untuk AppBar
            fontSize: 16.8, // Ukuran font
            fontWeight: FontWeight.w600, // Ketebalan font
          ),
        ),
      ),
      body: SafeArea( // SafeArea untuk memastikan konten tidak terpotong oleh status bar atau notch
        child: GridView.count( // Menggunakan GridView.count untuk membuat grid berdasarkan jumlah kolom
          crossAxisCount: 3, // Jumlah kolom dalam grid
          mainAxisSpacing: 12.0, // Jarak antar baris
          crossAxisSpacing: 12.0, // Jarak antar kolom
          shrinkWrap: true, // Ukuran grid akan mengikuti konten
          physics: const BouncingScrollPhysics(), // Efek bouncing saat scroll
          padding: const EdgeInsets.all(16.0), // Padding di sekitar grid
          children: List.generate( // Menghasilkan daftar widget untuk grid
            50, // Jumlah elemen yang akan ditampilkan
            (index) => Container( // Mengembalikan Container untuk setiap item
              decoration: BoxDecoration( // Dekorasi container
                color: Colors.blue, // Warna latar biru
                borderRadius: BorderRadius.circular(8.0), // Sudut melengkung sebesar 8.0
              ),
              child: Center( // Memusatkan konten di dalam container
                child: Text( // Teks yang ditampilkan dalam container
                  'Product $index', // Menampilkan nama produk sesuai index
                  style: const TextStyle( // Gaya teks
                    fontSize: 16.0, // Ukuran font 16.0
                    color: Colors.white, // Warna teks putih
                  ),
                  textAlign: TextAlign.center, // Teks berada di tengah secara horizontal
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
