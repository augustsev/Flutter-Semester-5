import 'dart:developer'; // Mengimpor pustaka untuk logging
import 'package:flutter/material.dart'; // Mengimpor material design dari Flutter

class TextfieldPage extends StatefulWidget { // Membuat StatefulWidget untuk TextfieldPage
  const TextfieldPage({super.key}); // Konstruktor StatefulWidget

  @override
  State<TextfieldPage> createState() => _TextfieldPageState(); // Menghubungkan State
}

class _TextfieldPageState extends State<TextfieldPage> { // State untuk TextfieldPage
  @override
  Widget build(BuildContext context) { // Metode build untuk membangun widget
    return Scaffold( // Scaffold sebagai struktur dasar halaman
      appBar: AppBar( // AppBar untuk header halaman
        title: const Text( // Teks di dalam AppBar
          'TextField', // Judul AppBar
          style: TextStyle( // Gaya teks
            fontSize: 16.8, // Ukuran font
            fontWeight: FontWeight.w600, // Ketebalan font
          ),
        ),
      ),
      body: SafeArea( // SafeArea untuk memastikan konten tidak terpotong oleh status bar atau notch
        child: Center( // Widget Center untuk memusatkan konten
          child: Padding( // Padding untuk memberi jarak antar tepi layar dan konten
            padding: const EdgeInsets.symmetric(horizontal: 16.0), // Padding horizontal
            child: Column( // Column untuk menampilkan widget secara vertikal
              mainAxisAlignment: MainAxisAlignment.center, // Posisikan di tengah secara vertikal
              children: [
                const TextField( // TextField untuk nama lengkap
                  decoration: InputDecoration(
                    labelText: 'Full Name',
                    hintText: 'Enter full name',
                  ),
                  maxLength: 50, // Batas maksimal karakter 50
                ),
                const SizedBox(height: 16.0), // Jarak antar widget
                const TextField( // TextField untuk nomor telepon
                  decoration: InputDecoration(
                    labelText: 'Phone Number',
                    hintText: 'Enter phone number',
                    filled: true, // Warna latar belakang diaktifkan
                  ),
                  keyboardType: TextInputType.number, // Keyboard untuk input angka
                  maxLength: 13, // Batas maksimal karakter 13
                ),
                const SizedBox(height: 16.0), // Jarak antar widget
                const TextField( // TextField untuk email
                  decoration: InputDecoration(
                    labelText: 'Email',
                    hintText: 'Enter email address',
                    border: OutlineInputBorder(), // Batas pada TextField
                    prefixIcon: Icon(Icons.email_rounded), // Ikon sebelum teks
                  ),
                  keyboardType: TextInputType.emailAddress, // Keyboard khusus email
                  maxLength: 50, // Batas maksimal karakter 50
                ),
                const SizedBox(height: 16.0), // Jarak antar widget
                TextField( // TextField untuk password
                  obscureText: true, // Untuk menyembunyikan teks (password)
                  decoration: InputDecoration(
                    labelText: 'Password',
                    hintText: 'Enter password',
                    border: const OutlineInputBorder(), // Batas pada TextField
                    prefixIcon: const Icon(Icons.password_rounded), // Ikon sebelum teks
                    suffixIcon: IconButton( // Ikon setelah teks
                      icon: const Icon(Icons.visibility_off_rounded), // Ikon mata untuk visibilitas
                      onPressed: () => log('Update password visibility'), // Aksi ketika ikon diklik
                    ),
                  ),
                  maxLength: 20, // Batas maksimal karakter 20
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
