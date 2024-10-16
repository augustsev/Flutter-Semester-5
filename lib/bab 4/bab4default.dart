import 'package:flutter/material.dart'; // Mengimpor paket material dari Flutter

class ListViewPage extends StatefulWidget { // Membuat StatefulWidget untuk ListViewPage
  const ListViewPage({super.key}); // Konstruktor untuk StatefulWidget

  @override
  State<ListViewPage> createState() => _ListViewPageState(); // Menghubungkan dengan state _ListViewPageState
}

class _ListViewPageState extends State<ListViewPage> { // State untuk ListViewPage
  bool switchEnable = true; // Variabel untuk menyimpan status switch (true/false)

  void onChangeSwitch({required bool value}) { // Fungsi untuk menangani perubahan switch
    setState(() {
      switchEnable = value; // Mengubah nilai switch berdasarkan input
    });
  }

  @override
  Widget build(BuildContext context) { // Metode build untuk membangun widget
    return Scaffold( // Scaffold sebagai struktur dasar halaman
      appBar: AppBar( // AppBar untuk header halaman
        title: const Text( // Teks di dalam AppBar
          'ListView', // Judul AppBar
          style: TextStyle( // Gaya teks pada AppBar
            fontSize: 16.0, // Ukuran font 16.0
            fontWeight: FontWeight.w600, // Ketebalan font w600 (semi-bold)
          ),
        ),
      ),
      body: SafeArea( // SafeArea untuk memastikan konten tidak terpotong oleh status bar atau notch
        child: ListView( // Menggunakan ListView untuk menampilkan list secara vertikal
          shrinkWrap: true, // Agar ListView hanya sebesar kontennya
          physics: const BouncingScrollPhysics(), // Efek bouncing saat scroll
          padding: EdgeInsets.zero, // Mengatur padding menjadi nol
          children: [
            ListTile( // Membuat ListTile pertama
              leading: const Icon(Icons.airplanemode_active_rounded), // Ikon di sebelah kiri
              title: const Text( // Teks judul ListTile
                'Airplane Mode', // Judul item
                style: TextStyle( // Gaya teks
                  fontSize: 16.0, // Ukuran font 16.0
                ),
              ),
              trailing: Transform.translate( // Menggeser posisi trailing
                offset: const Offset(10.0, 0.0), // Offset untuk menggeser posisi switch
                child: Switch( // Switch untuk mengaktifkan atau menonaktifkan mode pesawat
                  value: switchEnable, // Status switch berdasarkan variabel switchEnable
                  onChanged: (value) => onChangeSwitch(value: value), // Memanggil fungsi onChangeSwitch saat switch diubah
                ),
              ),
            ),
            const ListTile( // Membuat ListTile kedua
              leading: Icon(Icons.wifi_rounded), // Ikon Wi-Fi di sebelah kiri
              title: Text( // Teks judul ListTile
                'Wi-Fi', // Judul item
                style: TextStyle( // Gaya teks
                  fontSize: 16.0, // Ukuran font 16.0
                ),
              ),
              trailing: Icon(Icons.chevron_right_rounded), // Ikon panah kanan di sebelah kanan
            ),
            const ListTile( // Membuat ListTile ketiga
              leading: Icon(Icons.bluetooth_rounded), // Ikon Bluetooth di sebelah kiri
              title: Text( // Teks judul ListTile
                'Bluetooth', // Judul item
                style: TextStyle( // Gaya teks
                  fontSize: 16.0, // Ukuran font 16.0
                ),
              ),
              trailing: Icon(Icons.chevron_right_rounded), // Ikon panah kanan di sebelah kanan
            ),
          ],
        ),
      ),
    );
  }
}
