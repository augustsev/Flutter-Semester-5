import 'package:flutter/material.dart';
import 'home_page.dart';
import 'account_page.dart';

class ShoppingCartPage extends StatelessWidget {
  const ShoppingCartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        elevation: 0,
        toolbarHeight: 100,
        title: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Shopping',
              style: TextStyle(color: Colors.black, fontSize: 26),
            ),
            Text(
              'Cart',
              style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 28),
            ),
          ],
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: Image.asset(
              'assets/image/otp and payment/logo_nike.png',
              width: 90,
              height: 90,
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 16),
            _cartItem('Nike Air Max Plus Premium', 'Men\'s Shoes', 'Rp 2.849.000', 'assets/image/otp and payment/nike_air_max.png'),
            const SizedBox(height: 16),
            _cartItem('Air Jordan 1 Low', 'Women\'s Shoes', 'Rp 1.729.000', 'assets/image/otp and payment/nike_air_jordan_low.png'),
            const Spacer(),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('2 Items', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                Text('Rp 4.578.000', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
              ],
            ),
            const SizedBox(height: 16),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  // Implementasi logika pembayaran
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.orange,
                ),
                child: const Text('Pay', style: TextStyle(color: Colors.white)),
              ),
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
        currentIndex: 1,
        onTap: (index) {
          if (index == 0) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const HomeScreen()),
            );
          } else if (index == 2) { // Jika tombol Profile ditekan
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const ProfilePage()), // Navigasi ke ProfilePage
            );
          }
        },
      ),
    );
  }

  Widget _cartItem(String title, String subtitle, String price, String imagePath) {
    return Row(
      children: [
        Image.asset(
          imagePath,
          height: 110,
          width: 150,
          fit: BoxFit.cover,
        ),
        const SizedBox(width: 16),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
              Text(subtitle),
              Text(price, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
            ],
          ),
        ),
      ],
    );
  }
}
