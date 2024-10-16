import 'package:flutter/material.dart'; 
// Mengimpor paket 'material.dart' dari Flutter untuk membuat UI dengan desain material.

class PaddingPage extends StatefulWidget { 
  // Mendeklarasikan widget Stateful bernama PaddingPage.
  const PaddingPage({super.key}); 
  // Constructor PaddingPage menggunakan 'super.key' untuk kunci widget.

  @override 
  State<PaddingPage> createState() => _PaddingPageState(); 
  // Fungsi createState() yang mengembalikan state dari PaddingPage, yaitu _PaddingPageState.
}

class _PaddingPageState extends State<PaddingPage> { 
  // State dari widget PaddingPage.
  @override 
  Widget build(BuildContext context) { 
    // Fungsi build yang mendesain UI dan menampilkan widget di layar.
    return Scaffold( 
      // Scaffold menyediakan struktur dasar seperti app bar dan body untuk halaman.
      appBar: AppBar( 
        // Membuat AppBar di atas halaman.
        title: const Text( 
          // Teks di dalam AppBar.
          'Padding', 
          style: TextStyle( 
            fontSize: 16.0, 
            fontWeight: FontWeight.w600, 
          ), 
          // Pengaturan gaya teks pada AppBar (ukuran dan ketebalan huruf).
        ), 
      ), 
      body: SafeArea( 
        // Membuat area yang aman agar widget tidak terpotong oleh notifikasi atau status bar.
        child: Center( 
          // Menempatkan child widget di tengah layar.
          child: Column( 
            // Column mengatur widget di dalamnya secara vertikal.
            mainAxisAlignment: MainAxisAlignment.center, 
            // Mengatur child widget di tengah secara vertikal.
            children: [ 
              Material( 
                // Membuat widget Material untuk efek bayangan dan elevasi.
                color: Colors.blue.shade100, 
                // Mengatur warna background widget menjadi biru muda.
                child: const Text( 
                  'Widget Tanpa Padding', 
                  // Menampilkan teks tanpa padding (jarak antar elemen).
                ), 
              ), 
              const SizedBox(height: 16.0), 
              // SizedBox memberikan ruang kosong setinggi 16.0 antar widget.
              Material( 
                // Widget Material dengan background warna oranye muda.
                color: Colors.orange.shade100, 
                child: const Padding( 
                  // Membuat Padding yang mengelilingi teks.
                  padding: EdgeInsets.all(16.0), 
                  // Padding semua sisi sebesar 16.0.
                  child: Text( 
                    'Widget Dengan Padding', 
                    // Teks di dalam widget yang diberi padding.
                  ), 
                ), 
              ), 
              const SizedBox(height: 16.0), 
              // SizedBox untuk memberikan jarak antar widget.
              Material( 
                // Widget Material dengan warna latar belakang pink.
                color: Colors.pink.shade100, 
                child: const Padding( 
                  // Padding di kedua arah horizontal dan vertikal.
                  padding: EdgeInsets.symmetric( 
                    horizontal: 32.0, 
                    vertical: 8.0, 
                  ), 
                  child: Text( 
                    'Widget Dengan Padding', 
                    // Teks di dalam widget yang diberi padding secara simetris.
                  ), 
                ), 
              ), 
              const SizedBox(height: 16.0), 
              // SizedBox memberikan jarak antar widget.
              Material( 
                // Material dengan warna merah muda.
                color: Colors.red.shade100, 
                child: const Padding( 
                  // Padding hanya pada sisi tertentu (kiri, kanan, atas, bawah).
                  padding: EdgeInsets.only( 
                    left: 32.0, 
                    right: 16.0, 
                    top: 16.0, 
                    bottom: 8.0, 
                  ), 
                  child: Text( 
                    'Widget Dengan Padding', 
                    // Teks di dalam widget dengan padding berbeda di setiap sisi.
                  ), 
                ), 
              ), 
            ], 
          ), 
        ), 
      ), 
    ); 
  } 
}
