import 'package:flutter/material.dart'; // Mengimpor paket material dari Flutter

class ListviewBuilderPage extends StatefulWidget { // Membuat StatefulWidget bernama ListviewBuilderPage
  const ListviewBuilderPage({super.key}); // Konstruktor untuk StatefulWidget
  @override
  State<ListviewBuilderPage> createState() => _ListviewBuilderPageState(); // Menghubungkan dengan state _ListviewBuilderPageState
}

class _ListviewBuilderPageState extends State<ListviewBuilderPage> { // State untuk ListviewBuilderPage
  List<String> listData = List<String>.generate(100, (index) => 'Data $index'); // Membuat daftar string sebanyak 100 elemen

  @override
  Widget build(BuildContext context) { // Metode build untuk membangun widget
    return Scaffold( // Scaffold sebagai struktur dasar halaman
      appBar: AppBar( // AppBar untuk header halaman
        title: const Text( // Menampilkan teks pada AppBar
          'ListView Builder', // Judul halaman
          style: TextStyle( // Gaya teks pada judul
            fontSize: 16.0, // Ukuran font 16.0
            fontWeight: FontWeight.w600, // Ketebalan font w600 (semi-bold)
          ),
        ),
      ),
      body: SafeArea( // SafeArea untuk memastikan konten tidak terpotong oleh status bar atau notch
        child: ListView.builder( // ListView.builder untuk membuat list yang bersifat dinamis
          itemCount: listData.length, // Jumlah item yang ditampilkan sesuai panjang listData
          shrinkWrap: true, // Mengatur ListView agar tidak memaksimalkan tinggi/lebarnya
          physics: const BouncingScrollPhysics(), // Efek bouncing saat scroll
          padding: EdgeInsets.zero, // Mengatur padding menjadi nol (tanpa padding)
          itemBuilder: (context, index) => ListTile( // Membuat setiap elemen list menggunakan ListTile
            dense: true, // Mengatur ListTile agar tampil lebih padat
            title: Text( // Teks judul pada ListTile
              listData[index], // Menampilkan data dari listData sesuai index
              style: const TextStyle( // Mengatur gaya teks pada ListTile
                fontSize: 16.0, // Ukuran font 16.0
              ),
            ),
          ),
        ),
      ),
    );
  }
}
