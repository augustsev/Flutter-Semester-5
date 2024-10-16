import 'package:flutter/material.dart'; // Mengimpor paket material dari Flutter

class GridViewCustomPage extends StatefulWidget { // Membuat StatefulWidget untuk GridViewCustomPage
  const GridViewCustomPage({super.key}); // Konstruktor StatefulWidget

  @override
  State<GridViewCustomPage> createState() => _GridViewCustomPageState(); // Menghubungkan State
}

class _GridViewCustomPageState extends State<GridViewCustomPage> { // State untuk GridViewCustomPage
  List<String> listProduct = List<String>.generate(50, (index) => 'Product $index'); // Membuat list data produk

  @override
  Widget build(BuildContext context) { // Metode build untuk membangun widget
    return Scaffold( // Scaffold sebagai struktur dasar halaman
      appBar: AppBar( // AppBar untuk header halaman
        title: const Text( // Teks di dalam AppBar
          'GridView Custom', // Judul AppBar
          style: TextStyle( // Gaya teks untuk AppBar
            fontSize: 16.0, // Ukuran font
            fontWeight: FontWeight.w600, // Ketebalan font
          ),
        ),
      ),
      body: SafeArea( // SafeArea untuk memastikan konten tidak terpotong oleh status bar atau notch
        child: GridView.custom( // Menggunakan GridView.custom untuk kustomisasi grid
          shrinkWrap: true, // Ukuran grid akan mengikuti konten
          physics: const BouncingScrollPhysics(), // Efek bouncing saat scroll
          padding: const EdgeInsets.all(16.0), // Padding di sekitar grid
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount( // Delegasi grid untuk menentukan jumlah kolom dan jarak antar elemen
            crossAxisCount: 3, // Jumlah kolom dalam grid
            mainAxisSpacing: 12.0, // Jarak antar baris
            crossAxisSpacing: 12.0, // Jarak antar kolom
          ),
          childrenDelegate: SliverChildBuilderDelegate( // Delegate untuk membuat item grid secara dinamis
            (context, index) { // Item builder untuk setiap elemen grid
              if (index == 0) { // Jika item pertama (index 0)
                return Container( // Mengembalikan Container dengan dekorasi
                  decoration: BoxDecoration( // Dekorasi container
                    color: Colors.red, // Warna latar merah untuk item pertama
                    borderRadius: BorderRadius.circular(8.0), // Sudut melengkung sebesar 8.0
                  ),
                  child: Center( // Memusatkan teks di tengah item
                    child: Text( // Teks yang ditampilkan dalam item pertama
                      listProduct[index], // Nama produk sesuai dengan index
                      style: const TextStyle( // Gaya teks
                        fontSize: 16.0, // Ukuran font 16.0
                        color: Colors.white, // Warna teks putih
                      ),
                      textAlign: TextAlign.center, // Teks berada di tengah secara horizontal
                    ),
                  ),
                );
              } else { // Jika item selain index 0
                return Container( // Mengembalikan Container dengan dekorasi
                  decoration: BoxDecoration( // Dekorasi container
                    color: Colors.blue, // Warna latar biru untuk item lainnya
                    borderRadius: BorderRadius.circular(8.0), // Sudut melengkung sebesar 8.0
                  ),
                  child: Center( // Memusatkan teks di tengah item
                    child: Text( // Teks yang ditampilkan
                      listProduct[index], // Nama produk sesuai dengan index
                      style: const TextStyle( // Gaya teks
                        fontSize: 16.0, // Ukuran font 16.0
                        color: Colors.white, // Warna teks putih
                      ),
                      textAlign: TextAlign.center, // Teks berada di tengah secara horizontal
                    ),
                  ),
                );
              }
            },
            childCount: listProduct.length, // Jumlah item yang akan ditampilkan
          ),
        ),
      ),
    );
  }
}
