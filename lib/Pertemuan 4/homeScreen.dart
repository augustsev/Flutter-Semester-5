import 'package:flutter/material.dart'; // Mengimpor paket material design dari Flutter

// Kelas HomePage sebagai halaman beranda yang menerima username sebagai parameter
class HomePage extends StatelessWidget {
  final String username; // Variabel untuk menyimpan username yang diterima dari halaman login

  // Konstruktor untuk menerima username
  const HomePage({super.key, required this.username});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'), // Menampilkan judul "Home Page" di AppBar
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0), // Memberikan padding sebesar 16 piksel di sekeliling layar
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start, // Mengatur posisi teks dan elemen ke kiri
            children: [
              // Menampilkan pesan sapaan dengan nama pengguna (username)
              Text(
                'Hallo, $username!', // Menampilkan username dari variabel yang diterima
                style: const TextStyle(
                  fontSize: 24, // Ukuran font besar untuk sapaan
                  fontWeight: FontWeight.bold, // Mengatur teks menjadi tebal
                ),
              ),
              const SizedBox(height: 8), // Memberikan jarak vertikal antara elemen
              const Text(
                'Selamat Pagi', // Teks "Selamat Pagi"
                style: TextStyle(fontSize: 18), // Ukuran font sedang
              ),
              const SizedBox(height: 16), // Jarak vertikal sebelum elemen berikutnya
              // Menampilkan gambar dari folder assets
              Center(
                child: Image.asset(
                  'assets/image/menu.png', // Menampilkan gambar dari path assets
                  width: 300, // Lebar gambar
                  height: 200, // Tinggi gambar
                  fit: BoxFit.cover, // Gambar akan diatur agar menutupi area yang disediakan
                ),
              ),
              const SizedBox(height: 16), // Jarak vertikal antara elemen
              // Menampilkan teks "Menu" dengan style yang lebih besar dan tebal
              const Text(
                'Menu:',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold), // Teks "Menu" tebal
              ),
              const SizedBox(height: 8), // Jarak vertikal antara teks dan daftar
              // Daftar menu makanan
              Expanded(
                child: ListView(
                  children: [
                    // Memanggil fungsi _menuItem untuk membuat setiap item menu
                    _menuItem('Mie Kentang', 'Rp. 23.000', 'assets/image/mie ayam.jpg'), // Item menu Mie Kentang
                    _menuItem('Ayam Kentang', 'Rp. 15.000', 'assets/image/ayam goreng.jpg'), // Item menu Ayam Kentang
                    _menuItem('Kentang Goreng', 'Rp. 11.000', 'assets/image/kentang.jpg'), // Item menu Kentang Goreng
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Fungsi _menuItem untuk menampilkan elemen daftar makanan
  Widget _menuItem(String name, String price, String imagePath) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0), // Padding vertikal untuk tiap item menu
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 12.0), // Padding dalam untuk konten list
        leading: Image.asset(
          imagePath, // Menampilkan gambar makanan
          width: 30, // Ukuran gambar kecil di sebelah kiri item
          height: 30, // Tinggi gambar kecil di sebelah kiri item
          fit: BoxFit.cover, // Mengatur gambar agar menutupi area yang disediakan
        ),
        title: Text(name), // Nama makanan yang ditampilkan di item list
        subtitle: Text(price, style: const TextStyle(fontWeight: FontWeight.bold)), // Harga makanan dengan teks tebal
        trailing: ElevatedButton(
          onPressed: () {
            // Logika untuk tombol "Beli" akan ditulis di sini
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.orange, // Warna latar tombol "Beli" adalah oranye
            foregroundColor: Colors.white, // Warna teks pada tombol "Beli" adalah putih
          ),
          child: const Text('Beli'), // Teks pada tombol "Beli"
        ),
      ),
    );
  }
}
