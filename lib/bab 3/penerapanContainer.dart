import 'package:flutter/material.dart'; // Mengimpor material design dari Flutter

class ContainerPage extends StatefulWidget { // Membuat StatefulWidget untuk ContainerPage
  const ContainerPage({super.key}); // Konstruktor StatefulWidget

  @override
  State<ContainerPage> createState() => _ContainerPageState(); // Menghubungkan State
}

class _ContainerPageState extends State<ContainerPage> { // State untuk ContainerPage
  @override
  Widget build(BuildContext context) { // Metode build untuk membangun widget
    return Scaffold( // Scaffold sebagai struktur dasar halaman
      appBar: AppBar( // AppBar untuk header halaman
        title: const Text( // Teks di dalam AppBar
          'Container', // Judul AppBar
          style: TextStyle( // Gaya teks
            fontSize: 16.8, // Ukuran font
            fontWeight: FontWeight.w600, // Ketebalan font
          ),
        ),
      ),
      body: SafeArea( // SafeArea untuk memastikan konten tidak terpotong oleh status bar atau notch
        child: Center( // Widget Center untuk memusatkan konten
          child: Container( // Container widget untuk menampung konten
            width: 200.0, // Lebar container
            height: 200.0, // Tinggi container
            padding: const EdgeInsets.all(16.0), // Padding dalam container
            margin: const EdgeInsets.all(16.0), // Margin di luar container
            decoration: BoxDecoration( // Dekorasi container
              color: Colors.indigo, // Warna background container
              borderRadius: BorderRadius.circular(8.0), // Membuat sudut-sudut container melengkung
              boxShadow: const [ // Menambahkan efek bayangan
                BoxShadow(
                  color: Colors.black26, // Warna bayangan
                  blurRadius: 12.0, // Jarak blur bayangan
                  spreadRadius: 4.0, // Jarak sebaran bayangan
                  offset: Offset(0.0, 4.0), // Posisi bayangan
                ),
              ],
            ),
            child: const Center( // Widget Center untuk memusatkan teks dalam container
              child: Text( // Widget Text untuk menampilkan teks
                'Lorem ipsum dolor sit amet, consectetur adipiscing elit.', // Teks yang akan ditampilkan
                style: TextStyle( // Gaya teks
                  fontSize: 20.8, // Ukuran font
                  color: Colors.white, // Warna teks
                  fontWeight: FontWeight.w600, // Ketebalan font
                ),
                  textAlign: TextAlign.center, // Penempatan teks di tengah
                ),
              ),
            ),
          ),
        ),
      );
  }
}
