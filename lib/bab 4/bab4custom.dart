import 'package:flutter/material.dart'; // Mengimpor paket material dari Flutter

class ListViewCustomPage extends StatefulWidget { // Membuat StatefulWidget untuk ListViewCustomPage
  const ListViewCustomPage({super.key}); // Konstruktor untuk StatefulWidget

  @override
  State<ListViewCustomPage> createState() => _ListViewCustomPageState(); // Menghubungkan dengan state _ListViewCustomPageState
}

class _ListViewCustomPageState extends State<ListViewCustomPage> { // State untuk ListViewCustomPage
  List<String> listData = List<String>.generate(100, (index) => 'Data $index'); // Membuat list string sebanyak 100 elemen

  @override
  Widget build(BuildContext context) { // Metode build untuk membangun widget
    return Scaffold( // Scaffold sebagai struktur dasar halaman
      appBar: AppBar( // AppBar untuk header halaman
        title: const Text( // Teks di dalam AppBar
          'ListView Custom', // Judul AppBar
          style: TextStyle( // Gaya teks pada AppBar
            fontSize: 16.0, // Ukuran font 16.0
            fontWeight: FontWeight.w600, // Ketebalan font w600 (semi-bold)
          ),
        ),
      ),
      body: SafeArea( // SafeArea untuk memastikan konten tidak terpotong oleh status bar atau notch
        child: ListView.custom( // Menggunakan ListView.custom untuk kustomisasi ListView
          shrinkWrap: true, // Agar ListView hanya sebesar kontennya
          physics: const BouncingScrollPhysics(), // Efek bouncing saat scroll
          padding: EdgeInsets.zero, // Mengatur padding menjadi nol
          childrenDelegate: SliverChildBuilderDelegate( // Delegasi untuk membangun anak dari ListView
            (context, index) => ListTile( // Membuat setiap item list menggunakan ListTile
              dense: true, // Membuat ListTile lebih padat
              title: Text( // Teks untuk judul ListTile
                listData[index], // Menampilkan data dari listData sesuai index
                style: const TextStyle( // Gaya teks pada ListTile
                  fontSize: 16.0, // Ukuran font 16.0
                ),
              ),
            ),
            childCount: listData.length, // Jumlah item sesuai dengan panjang listData
          ),
        ),
      ),
    );
  }
}
