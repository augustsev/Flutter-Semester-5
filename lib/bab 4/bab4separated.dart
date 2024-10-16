import 'package:flutter/material.dart'; // Mengimpor paket material dari Flutter

class ListViewSeparatedPage extends StatefulWidget { // Membuat StatefulWidget untuk ListViewSeparatedPage
  const ListViewSeparatedPage({super.key}); // Konstruktor untuk StatefulWidget

  @override
  State<ListViewSeparatedPage> createState() => _ListViewSeparatedPageState(); // Menghubungkan dengan state _ListViewSeparatedPageState
}

class _ListViewSeparatedPageState extends State<ListViewSeparatedPage> { // State untuk ListViewSeparatedPage
  List<String> listData = List<String>.generate(100, (index) => 'Data $index'); // Membuat list string sebanyak 100 elemen

  @override
  Widget build(BuildContext context) { // Metode build untuk membangun widget
    return Scaffold( // Scaffold sebagai struktur dasar halaman
      appBar: AppBar( // AppBar untuk header halaman
        title: const Text( // Teks di dalam AppBar
          'ListView Separated', // Judul AppBar
          style: TextStyle( // Gaya teks pada AppBar
            fontSize: 16.8, // Ukuran font 16.8
            fontWeight: FontWeight.w600, // Ketebalan font w600 (semi-bold)
          ),
        ),
      ),
      body: SafeArea( // SafeArea untuk memastikan konten tidak terpotong oleh status bar atau notch
        child: ListView.separated( // Menggunakan ListView.separated untuk memisahkan item dengan pemisah (divider)
          itemCount: listData.length, // Jumlah item sesuai dengan panjang listData
          shrinkWrap: true, // Agar ListView hanya sebesar kontennya
          physics: const BouncingScrollPhysics(), // Efek bouncing saat scroll
          padding: EdgeInsets.zero, // Mengatur padding menjadi nol
          itemBuilder: (context, index) => ListTile( // Membuat setiap item list menggunakan ListTile
            dense: true, // Membuat ListTile lebih padat
            title: Text( // Teks untuk judul ListTile
              listData[index], // Menampilkan data dari listData sesuai index
              style: const TextStyle( // Gaya teks pada ListTile
                fontSize: 16.8, // Ukuran font 16.8
              ),
            ),
          ),
          separatorBuilder: (context, index) => const Divider( // Menambahkan Divider sebagai pemisah antar item
            height: 0.0, // Mengatur tinggi Divider menjadi 0.0 untuk pemisah yang tipis
          ),
        ),
      ),
    );
  }
}
