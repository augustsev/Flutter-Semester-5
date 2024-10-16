import 'package:flutter/material.dart'; // Mengimpor paket material dari Flutter

class GridViewExtentPage extends StatefulWidget { // Membuat StatefulWidget untuk GridViewExtentPage
  const GridViewExtentPage({super.key}); // Konstruktor StatefulWidget

  @override
  State<GridViewExtentPage> createState() => _GridViewExtentPageState(); // Menghubungkan State
}

class _GridViewExtentPageState extends State<GridViewExtentPage> { // State untuk GridViewExtentPage
  @override
  Widget build(BuildContext context) { // Metode build untuk membangun widget
    return Scaffold( // Scaffold sebagai struktur dasar halaman
      appBar: AppBar( // AppBar untuk header halaman
        title: const Text( // Teks di dalam AppBar
          'GridView Extent', // Judul AppBar
          style: TextStyle( // Gaya teks untuk AppBar
            fontSize: 16.0, // Ukuran font
            fontWeight: FontWeight.w600, // Ketebalan font
          ),
        ),
      ),
      body: SafeArea( // SafeArea untuk memastikan konten tidak terpotong oleh status bar atau notch
        child: GridView.extent( // Menggunakan GridView.extent untuk membuat grid dengan batas maksimum lebar kolom
          maxCrossAxisExtent: 150.0, // Lebar maksimum setiap kolom dalam grid
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
