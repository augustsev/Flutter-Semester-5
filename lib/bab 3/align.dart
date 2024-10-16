import 'package:flutter/material.dart'; // Mengimpor paket material dari Flutter

class AlignPage extends StatefulWidget { // Membuat StatefulWidget bernama AlignPage
  const AlignPage({super.key}); // Konstruktor untuk AlignPage

  @override
  State<AlignPage> createState() => _AlignPageState(); // Menghubungkan dengan state _AlignPageState
}

class _AlignPageState extends State<AlignPage> { // State dari AlignPage
  @override
  Widget build(BuildContext context) { // Metode build untuk membangun widget
    return Scaffold( // Scaffold untuk struktur dasar tampilan
      appBar: AppBar( // Membuat AppBar pada bagian atas
        title: const Text( // Judul dari AppBar
          'Align', // Teks yang tampil di AppBar
          style: TextStyle( // Mengatur gaya teks
            fontSize: 16.0, // Ukuran font
            fontWeight: FontWeight.w600, // Ketebalan font
          ),
        ),
      ),
      body: SafeArea( // Membuat SafeArea agar konten tidak terpotong oleh notifikasi bar
        child: Stack( // Menggunakan Stack untuk menumpuk widget
          children: [
            Padding( // Membungkus widget dengan padding
              padding: const EdgeInsets.all(16.0), // Mengatur jarak di sekeliling
              child: Column( // Membuat kolom untuk menampung beberapa widget
                mainAxisAlignment: MainAxisAlignment.center, // Mengatur posisi ke tengah secara vertikal
                children: [
                  Align( // Menggunakan Align widget untuk posisi anak widget
                    alignment: Alignment.center, // Posisikan di tengah
                    child: Container( // Membuat container untuk menampilkan warna
                      width: 50.0, // Lebar container
                      height: 50.0, // Tinggi container
                      color: Colors.blue, // Warna container biru
                    ),
                  ),
                  const SizedBox(height: 16.0), // Memberi jarak antar widget
                  Align( // Menggunakan Align widget
                    alignment: Alignment.centerLeft, // Posisikan di tengah kiri
                    child: Container( // Membuat container
                      width: 50.0, // Lebar container
                      height: 50.0, // Tinggi container
                      color: Colors.purple, // Warna container ungu
                    ),
                  ),
                  const SizedBox(height: 16.0), // Memberi jarak antar widget
                  Align( // Menggunakan Align widget
                    alignment: Alignment.centerRight, // Posisikan di tengah kanan
                    child: Container( // Membuat container
                      width: 50.0, // Lebar container
                      height: 50.0, // Tinggi container
                      color: Colors.orange, // Warna container oranye
                    ),
                  ),
                  Align( // Menggunakan Align widget
                    alignment: Alignment.topLeft, // Posisikan di atas kiri
                    child: Container( // Membuat container
                      width: 50.0, // Lebar container
                      height: 50.0, // Tinggi container
                      color: Colors.red, // Warna container merah
                    ),
                  ),
                  Align( // Menggunakan Align widget
                    alignment: Alignment.bottomRight, // Posisikan di bawah kanan
                    child: Container( // Membuat container
                      width: 50.0, // Lebar container
                      height: 50.0, // Tinggi container
                      color: Colors.pink, // Warna container merah muda
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
