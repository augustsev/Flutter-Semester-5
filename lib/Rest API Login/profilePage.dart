import 'package:flutter/material.dart';
import 'homeScreen.dart'; // Import halaman HomePage
import 'loginPage.dart'; // Import halaman LoginPage
import 'package:http/http.dart' as http; // Import package http
import 'dart:convert'; // Import json
import 'ubahPasswordPage.dart';

class ProfilePage extends StatelessWidget {
  final String username;
  const ProfilePage({super.key, required this.username});

  Future<void> deleteAccount(BuildContext context) async {
    final response = await http.post(
      Uri.parse('http://localhost/flutter_api_materi5/profile_page_hapus_akun.php'), // Ganti dengan URL endpoint penghapusan
      body: {'username': username},
    );

    if (response.statusCode == 200) {
      final result = json.decode(response.body);
      if (result['message'] == 'Akun berhasil dihapus!') {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(result['message'])),
        );

        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => LoginPage()),
          (Route<dynamic> route) => false,
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(result['message'])),
        );
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Terjadi kesalahan saat menghapus akun.')),
      );
    }
  }

  Future<void> changePassword(BuildContext context) async {
    // Logika penggantian password dapat ditambahkan di sini
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Fitur Ubah Password sedang dalam pengembangan')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Account'),
        backgroundColor: Colors.deepPurple,
        automaticallyImplyLeading: false,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const CircleAvatar(
              radius: 50,
              backgroundColor: Colors.grey,
              child: Icon(
                Icons.person,
                size: 50,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 16),
            Text(
              username,
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            ElevatedButton.icon(
              onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => ChangePasswordPage(username:username)
                ),
                );
              }, // Tombol Ubah Password
              icon: const Icon(Icons.lock),
              label: const Text('Ubah Password'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                foregroundColor: Colors.white,
                minimumSize: const Size(200, 50),
              ),
            ),
            const SizedBox(height: 8),
            ElevatedButton.icon(
              onPressed: () => deleteAccount(context),
              icon: const Icon(Icons.delete),
              label: const Text('Hapus Akun'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
                foregroundColor: Colors.white,
                minimumSize: const Size(200, 50),
              ),
            ),
            const SizedBox(height: 8),
            ElevatedButton.icon(
              onPressed: () {
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => LoginPage()),
                  (Route<dynamic> route) => false,
                );
              },
              icon: const Icon(Icons.logout),
              label: const Text('Logout'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
                foregroundColor: Colors.white,
                minimumSize: const Size(200, 50),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
        currentIndex: 1,
        onTap: (index) {
          if (index == 0) {
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
