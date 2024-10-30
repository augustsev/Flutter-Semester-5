import 'package:flutter/material.dart';
import 'home_page.dart'; // Ganti dengan import halaman yang sesuai
import 'cart_page.dart';
import 'login_page.dart'; // Tambahkan ini untuk navigasi kembali
import 'login_or_register_page.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text('Profile'),
        backgroundColor: Colors.white,
        elevation: 0,
        actions: [
          IconButton(
            icon: const Icon(Icons.edit, color: Colors.black),
            onPressed: () {
              // Implementasi logika untuk mengedit profil
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Gambar Profil
            Stack(
              alignment: Alignment.bottomRight,
              children: [
                const CircleAvatar(
                  radius: 60,
                  backgroundImage: AssetImage('assets/image/your_profile_image.png'), // Ganti dengan path gambar profil Anda
                ),
                IconButton(
                  icon: const Icon(Icons.camera_alt, color: Colors.white),
                  onPressed: () {
                    // Implementasi logika untuk mengubah gambar profil
                  },
                ),
              ],
            ),
            const SizedBox(height: 16),
            // Nama Pengguna
            const Text(
              'Nama Pengguna',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 4),
            const Text(
              '@username',
              style: TextStyle(color: Colors.grey),
            ),
            const SizedBox(height: 24),
            // Informasi Profil
            Container(
              padding: const EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(8),
              ),
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Bio',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Ini adalah bio pengguna. Anda dapat menambahkan informasi tambahan di sini.',
                    style: TextStyle(color: Colors.black54),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),
            // Daftar Item Favorit
            const Text(
              'Favorit',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            Expanded(
              child: ListView(
                children: [
                  _favoriteItem('Nike Air Max Plus Premium', 'Rp 2.849.000', 'assets/image/otp and payment/nike_air_max.png'),
                  _favoriteItem('Air Jordan 1 Low', 'Rp 1.729.000', 'assets/image/otp and payment/nike_air_jordan_low.png'),
                  // Tambahkan item favorit lainnya di sini
                ],
              ),
            ),
            // Spacer untuk memberikan ruang antara daftar dan tombol
            const SizedBox(height: 16),
            // Tombol Log Out
            _buildActionButton(
              context,
              icon: Icons.logout,
              label: 'Log Out',
              color: Colors.red,
              onPressed: () {
                // Implementasi logika untuk log out
                _showConfirmationDialog(context, 'Log Out', 'Apakah Anda yakin ingin log out?', isLogout: true);
              },
            ),
            const SizedBox(height: 16),
            // Tombol Delete Account
            _buildActionButton(
              context,
              icon: Icons.delete,
              label: 'Delete Account',
              color: Colors.redAccent,
              onPressed: () {
                // Implementasi logika untuk menghapus akun
                _showConfirmationDialog(context, 'Delete Account', 'Apakah Anda yakin ingin menghapus akun ini?');
              },
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.shopping_cart), label: 'Cart'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
        currentIndex: 2, // Profil adalah halaman aktif
        onTap: (index) {
          if (index == 0) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const HomeScreen()), // Ganti dengan halaman Home Anda
            );
          } else if (index == 1) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const ShoppingCartPage()), // Ganti dengan halaman Keranjang Belanja Anda
            );
          }
          // Jika index == 2, tidak perlu melakukan apa-apa karena sudah di halaman ini
        },
      ),
    );
  }

  Widget _favoriteItem(String title, String price, String imagePath) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            Image.asset(
              imagePath,
              height: 60,
              width: 60,
              fit: BoxFit.cover,
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
                  Text(price, style: const TextStyle(color: Colors.black54)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildActionButton(BuildContext context, {required IconData icon, required String label, required Color color, required VoidCallback onPressed}) {
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      child: ElevatedButton.icon(
        onPressed: onPressed,
        icon: Icon(icon, color: Colors.white),
        label: Text(label, style: const TextStyle(color: Colors.white)),
        style: ElevatedButton.styleFrom(
          backgroundColor: color, // Ganti 'primary' menjadi 'backgroundColor'
          padding: const EdgeInsets.symmetric(vertical: 12),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        ),
      ),
    );
  }

  void _showConfirmationDialog(BuildContext context, String title, String message, {bool isLogout = false}) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(title),
          content: Text(message),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Tutup dialog
              },
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Tutup dialog
                // Navigasi ke LoginOrRegisterScreen
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const LoginOrRegisterScreen()),
                );
                // Implementasi logika untuk log out atau hapus akun di sini
                if (isLogout) {
                  // Logika untuk log out
                } else {
                  // Logika untuk hapus akun
                }
              },
              child: const Text('Confirm'),
            ),
          ],
        );
      },
    );
  }
}
