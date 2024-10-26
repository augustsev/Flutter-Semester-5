import 'package:flutter/material.dart'; // Mengimpor paket material design untuk penggunaan widget
import 'profilePage.dart'; // Mengimpor halaman profile

class HomePage extends StatelessWidget { // Mendefinisikan HomePage sebagai StatelessWidget
  final String username; // Mendeklarasikan variabel username

  const HomePage({super.key, required this.username}); // Constructor untuk HomePage dengan username yang diperlukan

  @override
  Widget build(BuildContext context) { // Metode untuk membangun UI halaman
    return Scaffold( // Menggunakan Scaffold sebagai struktur dasar halaman
      appBar: AppBar( // Membuat AppBar di bagian atas
        title: const Text('Home Page'), // Judul dari AppBar
        backgroundColor: Colors.deepPurple, // Warna latar belakang AppBar
        automaticallyImplyLeading: false, // Menyembunyikan tombol kembali
      ),
      body: SafeArea( // Menggunakan SafeArea untuk menghindari area yang terhalang (seperti notch)
        child: Padding( // Menambahkan padding di sekitar konten
          padding: const EdgeInsets.all(16.0), // Jarak padding 16 piksel di semua sisi
          child: Column( // Menggunakan Column untuk mengatur layout vertikal
            crossAxisAlignment: CrossAxisAlignment.start, // Mengatur alignmen kolom ke kiri
            children: [
              Text( // Menampilkan teks sambutan
                'Hallo, $username!', // Menyapa pengguna dengan username
                style: const TextStyle( // Mengatur gaya teks
                  fontSize: 24, // Ukuran font
                  fontWeight: FontWeight.bold, // Menebalkan teks
                ),
              ),
              const SizedBox(height: 8), // Menambahkan jarak vertikal 8 piksel
              const Text( // Menampilkan teks "Selamat Pagi"
                'Selamat Pagi',
                style: TextStyle(fontSize: 18), // Ukuran font untuk teks
              ),
              const SizedBox(height: 16), // Menambahkan jarak vertikal 16 piksel
              Center( // Mengatur konten di tengah
                child: Image.asset( // Menampilkan gambar menggunakan aset
                  'assets/image/menu.png', // Path gambar
                  width: 300, // Lebar gambar
                  height: 200, // Tinggi gambar
                  fit: BoxFit.cover, // Mengatur gambar untuk menutupi area
                ),
              ),
              const SizedBox(height: 16), // Menambahkan jarak vertikal 16 piksel
              const Text( // Menampilkan teks "Menu"
                'Menu:',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold), // Mengatur gaya teks
              ),
              const SizedBox(height: 8), // Menambahkan jarak vertikal 8 piksel
              Expanded( // Memungkinkan penggunaan ruang tersisa di layar
                child: ListView( // Menggunakan ListView untuk daftar item
                  children: [
                    _menuItem('Mie Kentang', 'Rp. 23.000', 'assets/image/mie ayam.jpg'), // Menampilkan item menu
                    _menuItem('Ayam Kentang', 'Rp. 15.000', 'assets/image/ayam goreng.jpg'), // Menampilkan item menu
                    _menuItem('Kentang Goreng', 'Rp. 11.000', 'assets/image/kentang.jpg'), // Menampilkan item menu
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar( // Membuat BottomNavigationBar di bagian bawah
        items: const [ // Menyusun item pada BottomNavigationBar
          BottomNavigationBarItem(
            icon: Icon(Icons.home), // Ikon untuk Home
            label: 'Home', // Label untuk Home
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person), // Ikon untuk Profile
            label: 'Profile', // Label untuk Profile
          ),
        ],
        currentIndex: 0, // Mengatur indeks item yang aktif (Home)
        onTap: (index) { // Fungsi saat item ditekan
          if (index == 1) { // Jika item Profile ditekan
            Navigator.pushReplacement( // Navigasi ke halaman Profile
              context,
              MaterialPageRoute(
                builder: (context) => ProfilePage(username: username), // Mengirim username ke halaman Profile
              ),
            );
          }
        },
      ),
    );
  }

  // Fungsi untuk membangun item menu
  Widget _menuItem(String name, String price, String imagePath) {
    return Padding( // Menambahkan padding di sekitar item
      padding: const EdgeInsets.symmetric(vertical: 4.0), // Jarak vertikal 4 piksel
      child: ListTile( // Menggunakan ListTile untuk menampilkan item menu
        contentPadding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 12.0), // Padding konten
        leading: Image.asset( // Menampilkan gambar di sisi kiri
          imagePath, // Path gambar
          width: 30, // Lebar gambar
          height: 30, // Tinggi gambar
          fit: BoxFit.cover, // Mengatur gambar untuk menutupi area
        ),
        title: Text(name), // Menampilkan nama item
        subtitle: Text(price, style: const TextStyle(fontWeight: FontWeight.bold)), // Menampilkan harga item
        trailing: ElevatedButton( // Menampilkan tombol "Beli" di sisi kanan
          onPressed: () {}, // Fungsi yang akan dijalankan saat tombol ditekan (belum diimplementasikan)
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.orange, // Warna latar belakang tombol
            foregroundColor: Colors.white, // Warna teks tombol
          ),
          child: const Text('Beli'), // Teks tombol
        ),
      ),
    );
  }
}
