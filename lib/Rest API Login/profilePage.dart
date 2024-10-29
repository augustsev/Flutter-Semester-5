import 'package:flutter/material.dart'; // Mengimpor paket Flutter untuk widget Material
import 'homeScreen.dart'; // Mengimpor halaman HomePage
import 'loginPage.dart'; // Mengimpor halaman LoginPage
import 'package:http/http.dart' as http; // Mengimpor paket http untuk melakukan permintaan HTTP
import 'dart:convert'; // Mengimpor paket untuk mengonversi data JSON
import 'ubahPasswordPage.dart'; // Mengimpor halaman ubah password

// Mendefinisikan kelas ProfilePage yang merupakan StatelessWidget
class ProfilePage extends StatelessWidget {
  final String username; // Mendeklarasikan variabel username
  const ProfilePage({super.key, required this.username}); // Constructor untuk menerima username

  // Fungsi untuk menghapus akun
  Future<void> deleteAccount(BuildContext context) async {
    // Mengirimkan permintaan POST ke endpoint penghapusan akun
    final response = await http.post(
      Uri.parse('http://localhost/flutter_api_materi5/profile_page_hapus_akun.php'), // URL endpoint penghapusan
      body: {'username': username}, // Mengirimkan username sebagai body permintaan
    );

    // Memeriksa status kode respons
    if (response.statusCode == 200) {
      final result = json.decode(response.body); // Mengonversi respons JSON
      // Memeriksa apakah pesan dari server menunjukkan penghapusan berhasil
      if (result['message'] == 'Akun berhasil dihapus!') {
        // Menampilkan SnackBar dengan pesan sukses
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(result['message'])),
        );

        // Mengarahkan pengguna ke halaman Login setelah akun dihapus
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => LoginPage()),
          (Route<dynamic> route) => false, // Menghapus semua rute sebelumnya
        );
      } else {
        // Menampilkan SnackBar dengan pesan kesalahan
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(result['message'])),
        );
      }
    } else {
      // Menampilkan SnackBar jika terjadi kesalahan saat menghapus akun
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Terjadi kesalahan saat menghapus akun.')),
      );
    }
  }

  // Fungsi untuk mengganti password (masih dalam pengembangan)
  Future<void> changePassword(BuildContext context) async {
    // Menampilkan SnackBar yang menunjukkan fitur ini sedang dalam pengembangan
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Fitur Ubah Password sedang dalam pengembangan')),
    );
  }

  // Metode untuk membangun tampilan halaman
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Account'), // Judul AppBar
        backgroundColor: Colors.deepPurple, // Warna latar belakang AppBar
        automaticallyImplyLeading: false, // Menghilangkan tombol kembali
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center, // Mengatur posisi widget secara vertikal
          children: [
            // Widget CircleAvatar untuk menampilkan avatar pengguna
            const CircleAvatar(
              radius: 50, // Radius avatar
              backgroundColor: Colors.grey, // Warna latar belakang avatar
              child: Icon(
                Icons.person, // Ikon pengguna
                size: 50, // Ukuran ikon
                color: Colors.white, // Warna ikon
              ),
            ),
            const SizedBox(height: 16), // Jarak antara avatar dan username
            // Menampilkan username pengguna
            Text(
              username,
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold), // Gaya teks
            ),
            const SizedBox(height: 16), // Jarak antara username dan tombol
            // Tombol untuk mengubah password
            ElevatedButton.icon(
              onPressed: () {
                // Mengarahkan pengguna ke halaman ubah password
                Navigator.push(context, MaterialPageRoute(builder: (context) => ChangePasswordPage(username: username)));
              },
              icon: const Icon(Icons.lock), // Ikon kunci
              label: const Text('Ubah Password'), // Teks tombol
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue, // Warna latar belakang tombol
                foregroundColor: Colors.white, // Warna teks tombol
                minimumSize: const Size(200, 50), // Ukuran minimum tombol
              ),
            ),
            const SizedBox(height: 8), // Jarak antara tombol
            // Tombol untuk menghapus akun
            ElevatedButton.icon(
              onPressed: () => deleteAccount(context), // Memanggil fungsi deleteAccount saat tombol ditekan
              icon: const Icon(Icons.delete), // Ikon sampah
              label: const Text('Hapus Akun'), // Teks tombol
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red, // Warna latar belakang tombol
                foregroundColor: Colors.white, // Warna teks tombol
                minimumSize: const Size(200, 50), // Ukuran minimum tombol
              ),
            ),
            const SizedBox(height: 8), // Jarak antara tombol
            // Tombol untuk logout
            ElevatedButton.icon(
              onPressed: () {
                // Mengarahkan pengguna kembali ke halaman Login
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => LoginPage()),
                  (Route<dynamic> route) => false, // Menghapus semua rute sebelumnya
                );
              },
              icon: const Icon(Icons.logout), // Ikon keluar
              label: const Text('Logout'), // Teks tombol
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red, // Warna latar belakang tombol
                foregroundColor: Colors.white, // Warna teks tombol
                minimumSize: const Size(200, 50), // Ukuran minimum tombol
              ),
            ),
          ],
        ),
      ),
      // Bottom Navigation Bar untuk navigasi antar halaman
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home), // Ikon untuk halaman Home
            label: 'Home', // Label untuk halaman Home
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person), // Ikon untuk halaman Profile
            label: 'Profile', // Label untuk halaman Profile
          ),
        ],
        currentIndex: 1, // Menunjukkan indeks halaman saat ini (Profile)
        onTap: (index) {
          if (index == 0) {
            // Mengarahkan pengguna ke halaman Home jika item Home ditekan
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => HomePage(username: username),
              ),
            );
          }
        },
      ),
    );
  }
}
