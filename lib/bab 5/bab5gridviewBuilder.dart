import 'package:flutter/material.dart'; // Mengimpor paket material dari Flutter

class GridViewBuilderPage extends StatefulWidget { // Membuat StatefulWidget untuk GridViewBuilderPage
  const GridViewBuilderPage({super.key}); // Konstruktor untuk StatefulWidget

  @override
  State<GridViewBuilderPage> createState() => _GridViewBuilderPageState(); // Menghubungkan State
}

class _GridViewBuilderPageState extends State<GridViewBuilderPage> { // State untuk GridViewBuilderPage
  List<String> listProduct = List<String>.generate(50, (index) => 'Product $index'); // List data produk yang akan ditampilkan pada grid

  @override
  Widget build(BuildContext context) { // Metode build untuk membangun widget
    return Scaffold( // Scaffold sebagai struktur dasar halaman
      appBar: AppBar( // AppBar untuk header halaman
        title: const Text( // Teks di dalam AppBar
          'GridView Builder', // Judul AppBar
          style: TextStyle( // Gaya teks untuk AppBar
            fontSize: 16.0, // Ukuran font 16.0
            fontWeight: FontWeight.w600, // Ketebalan font w600 (semi-bold)
          ),
        ),
      ),
      body: SafeArea( // SafeArea untuk memastikan konten tidak terpotong oleh status bar atau notch
        child: GridView.builder( // Menggunakan GridView.builder untuk menampilkan grid item
          itemCount: listProduct.length, // Jumlah item dalam grid
          shrinkWrap: true, // Grid hanya akan sebesar kontennya
          physics: const BouncingScrollPhysics(), // Efek bouncing saat scroll
          padding: const EdgeInsets.all(16.0), // Padding di sekitar grid sebesar 16.0
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount( // Menentukan konfigurasi grid
            crossAxisCount: 3, // Jumlah kolom dalam grid
            mainAxisSpacing: 12.0, // Jarak antara baris
            crossAxisSpacing: 12.0, // Jarak antara kolom
          ),
          itemBuilder: (context, index) => Container( // Membangun widget untuk setiap item dalam grid
            decoration: BoxDecoration( // Menentukan dekorasi untuk setiap container item
              color: Colors.blue, // Warna latar biru
              borderRadius: BorderRadius.circular(8.0), // Membuat sudut melengkung sebesar 8.0
            ),
            child: Center( // Memusatkan teks dalam setiap item
              child: Text( // Teks yang ditampilkan pada setiap item
                listProduct[index], // Menampilkan nama produk berdasarkan indeks
                style: const TextStyle( // Gaya teks
                  fontSize: 16.0, // Ukuran font 16.0
                  color: Colors.white, // Warna teks putih
                ),
                textAlign: TextAlign.center, // Teks diposisikan di tengah secara horizontal
              ),
            ),
          ),
        ),
      ),
    );
  }
}
