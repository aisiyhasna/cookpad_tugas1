import 'package:flutter/material.dart';

void main() => runApp(const MyApp());
 
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flash Sale',
      theme: ThemeData(primarySwatch: Colors.red),
      home: const FlashSalePage(),
    );
  }
}

class Product {
  final String name;
  final String imageUrl;
  final int originalPrice;
  final int discountPrice;
  final int discountPercent;

  const Product({
    required this.name,
    required this.imageUrl,
    required this.originalPrice,
    required this.discountPrice,
    required this.discountPercent,
  });
}

const products = [
  Product(  
    name: 'Sepatu Sneaker',
    imageUrl: 'https://i0.wp.com/zaloraadmin.wpcomstaging.com/wp-content/uploads/2023/11/Skechers-DLites-5.webp?resize=709%2C1024&ssl=1',
    originalPrice: 150000,
    discountPrice: 75000,
    discountPercent: 50,
  ),
  Product(
    name: 'Jam Tangan Digital',
    imageUrl: 'https://swot.ng/wp-content/uploads/2023/12/277-1.jpg',
    originalPrice: 300000,
    discountPrice: 210000,
    discountPercent: 30,
  ),
];

// Format angka jadi "Rp 150.000"
String formatRupiah(int value) {
  final str = value.toString().replaceAllMapped(
        RegExp(r'\B(?=(\d{3})+(?!\d))'),
        (match) => '.',
      );
  return 'Rp $str';
}

class FlashSalePage extends StatefulWidget {
  const FlashSalePage({super.key});

  @override
  State<FlashSalePage> createState() => _FlashSalePageState();
}

class _FlashSalePageState extends State<FlashSalePage> {
  int cartCount = 3;
  
  void addToCart() => setState(() => cartCount++);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flash Sale'),
        actions: [
          IconButton(
            icon: Badge(
              label: Text('$cartCount'),
              isLabelVisible: cartCount > 0,
              child: const Icon(Icons.shopping_cart_outlined),
            ),
            onPressed: () {
              // Aksi ketika ikon keranjang ditekan
            },
          ),
        ],
      ),
      body: Column(
        children: [
          _buildCartIcon(),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Align
              alignment: Alignment.centerLeft,
              child: Text(
                'Produk Flash Sale',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
                      

  _buildCartIcon() {}