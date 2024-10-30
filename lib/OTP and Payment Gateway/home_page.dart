import 'package:flutter/material.dart';
import 'cart_page.dart'; // Impor halaman ShoppingCartPage
import 'account_page.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String _currentCategory = 'All'; // Variabel untuk menyimpan kategori saat ini
  final List<int> _favoriteProductIndices = []; // Daftar untuk menyimpan indeks produk favorit

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          'JUST DO IT.',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
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
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'New Arrival',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              AspectRatio(
                aspectRatio: 20 / 16,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    image: const DecorationImage(
                      image: AssetImage('assets/image/otp and payment/gif_nike.gif'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _categoryButton('All', _currentCategory == 'All'),
                  _categoryButton('Man', _currentCategory == 'Man'),
                  _categoryButton('Women', _currentCategory == 'Women'),
                  _categoryButton('Kids', _currentCategory == 'Kids'),
                ],
              ),
              const SizedBox(height: 16),
              GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: 200,
                  mainAxisSpacing: 16,
                  crossAxisSpacing: 16,
                  childAspectRatio: 0.7,
                ),
                itemCount: _getProducts().length,
                itemBuilder: (context, index) {
                  final product = _getProducts()[index];
                  return _productItem(
                    product["title"]!,
                    product["subtitle"]!,
                    product["price"]!,
                    product["imagePath"]!,
                    index, // Kirim indeks produk
                  );
                },
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.shopping_cart), label: 'Cart'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
        currentIndex: 0,
        onTap: (index) {
          if (index == 1) { // Jika tombol Cart ditekan
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const ShoppingCartPage()), // Navigasi ke ShoppingCartPage
            );
          } else if (index == 2) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const ProfilePage()), // Navigasi ke ProfilePage
            );
          }
        },
      ),
    );
  }

  Widget _categoryButton(String text, bool isSelected) {
    return ElevatedButton(
      onPressed: () {
        setState(() {
          _currentCategory = text; // Set kategori saat tombol ditekan
        });
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: isSelected ? Colors.blue : Colors.grey[300],
        foregroundColor: isSelected ? Colors.white : Colors.black,
      ),
      child: Text(text),
    );
  }

  List<Map<String, String>> _getProducts() {
    final allProducts = [
      {
        "title": "Nike Air Max Plus Premium",
        "subtitle": "Men's Shoes",
        "price": "Rp 2.849.000",
        "imagePath": 'assets/image/otp and payment/nike_air_max.png',
      },
      {
        "title": "Air Jordan 1 Low",
        "subtitle": "Women's Shoes",
        "price": "Rp 1.729.000",
        "imagePath": 'assets/image/otp and payment/nike_air_jordan_low.png',
      },
      {
        "title": "Nike Force 1 Low EasyOn",
        "subtitle": "Kids' Shoes",
        "price": "Rp 999.000",
        "imagePath": 'assets/image/otp and payment/nike_force_1.png',
      },
      {
        "title": "Air Jordan Dub Zero",
        "subtitle": "Men's Shoes",
        "price": "Rp 2.569.000",
        "imagePath": 'assets/image/otp and payment/nike_air_jordan.png',
      },
    ];

    // Filter produk berdasarkan kategori
    if (_currentCategory == 'All') {
      return allProducts;
    } else if (_currentCategory == 'Man') {
      return allProducts.where((product) => product["subtitle"]!.contains("Men")).toList();
    } else if (_currentCategory == 'Women') {
      return allProducts.where((product) => product["subtitle"]!.contains("Women")).toList();
    } else if (_currentCategory == 'Kids') {
      return allProducts.where((product) => product["subtitle"]!.contains("Kids")).toList();
    }
    return []; // Kembalikan daftar kosong jika kategori tidak ditemukan
  }

  Widget _productItem(String title, String subtitle, String price, String imagePath, int index) {
    final isFavorite = _favoriteProductIndices.contains(index); // Cek apakah produk favorit

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: Colors.grey[200],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              Image.asset(
                imagePath,
                height: 120,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
              Positioned(
                top: 8,
                right: 8,
                child: IconButton(
                  icon: Icon(
                    isFavorite ? Icons.favorite : Icons.favorite_border,
                    color: isFavorite ? Colors.red : Colors.grey,
                  ),
                  onPressed: () {
                    setState(() {
                      if (isFavorite) {
                        _favoriteProductIndices.remove(index); // Hapus dari favorit
                      } else {
                        _favoriteProductIndices.add(index); // Tambah ke favorit
                      }
                    });
                  },
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
                Text(subtitle),
                const SizedBox(height: 8),
                Text(price, style: const TextStyle(fontWeight: FontWeight.bold)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
