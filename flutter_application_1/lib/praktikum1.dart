import 'package:flutter/material.dart';

class CookpadCloneApp extends StatelessWidget {
  const CookpadCloneApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Cookpad Clone',
      theme: ThemeData(
        fontFamily: 'Roboto',
        scaffoldBackgroundColor: Colors.white,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  // Data makanan untuk pencarian populer
  final List<Map<String, String>> popularSearches = const [
    {
      'title': 'ayam bakar',
      'color': 'orange',
      'image': 'https://images.unsplash.com/photo-1598515214211-89d3c73ae83b?w=400',
    },
    {
      'title': 'bolu pisang kukus',
      'color': 'pink',
      'image': 'https://...',
    },
    {
      'title': 'capcay',
      'color': 'green',
      'image': 'https://...',
    },
    {
      'title': 'sate ayam',
      'color': 'brown',
      'image': 'https://...',
    },
    {
      'title': 'soto ayam',
      'color': 'yellow',
      'image': 'https://...',
    },
  ];

  // Menentukan warna berdasarkan data makanan
  Color _getColor(String name) {
    switch (name) {
      case 'pink':
        return Colors.pink.shade100;
      case 'green':
        return Colors.green.shade200;
      case 'brown':
        return Colors.brown.shade200;
      case 'yellow':
        return Colors.yellow.shade200;
      case 'darkbrown':
        return Colors.brown.shade400;
      default:
        return Colors.grey.shade300;
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(

        // ListView digunakan agar seluruh halaman bisa di-scroll
        body: ListView(
          children: [

            // ---------- HEADER ----------
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 12,
              ),
              child: Row(
                mainAxisAlignment:
                    MainAxisAlignment.spaceBetween,
                children: [

                  // Logo Cookpad
                  Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(6),
                        decoration: BoxDecoration(
                          color: Colors.orange,
                          borderRadius:
                              BorderRadius.circular(30),
                        ),
                        child: const Icon(
                          Icons.restaurant_menu,
                          color: Colors.white,
                          size: 20,
                        ),
                      ),

                      const SizedBox(width: 8),

                      const Text(
                        'cookpad',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF7A2E2E),
                        ),
                      ),
                    ],
                  ),

                  // Profile dan notifikasi
                  Row(
                    children: [
                      const CircleAvatar(
                        radius: 18,
                        backgroundColor: Colors.pink,
                        child: Icon(
                          Icons.person,
                          color: Colors.white,
                          size: 20,
                        ),
                      ),
                      const SizedBox(width: 12),
                      const Icon(
                        Icons.notifications_none,
                        size: 26,
                      ),
                    ],
                  ),
                ],
              ),
            ),

            // ---------- SEARCH BAR ----------
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 16),
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 12),
                height: 44,
                decoration: BoxDecoration(
                  color: Colors.grey.shade100,
                  borderRadius: BorderRadius.circular(30),
                  border: Border.all(
                    color: Colors.grey.shade300,
                  ),
                ),
                child: Row(
                  children: [
                    Icon(
                      Icons.search,
                      color: Colors.grey.shade600,
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: 'Ketik bahan-bahan...',
                          hintStyle: TextStyle(
                            color: Colors.grey.shade600,
                            fontSize: 16,
                          ),
                          border: InputBorder.none,
                        ),

                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16),

            // ---------- JUDUL ----------
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 16),
              child: const Text(
                'Pencarian Populer',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

            const SizedBox(height: 12),

            // ---------- GRID MAKANAN ----------
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 16),
              child: GridView.builder(
                shrinkWrap: true,

                // Grid tidak scroll sendiri karena sudah ada ListView
                physics:
                    const NeverScrollableScrollPhysics(),

                itemCount: popularSearches.length,

                gridDelegate:
                    const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 12,
                  crossAxisSpacing: 12,
                  childAspectRatio: 1.4,
                ),

                itemBuilder: (context, index) {
                  final item = popularSearches[index];

                  return ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Container(
                      decoration: BoxDecoration(
                        color: _getColor(
                          item['color'] ?? '',
                        ),
                      ),
                      child: Stack(
                        fit: StackFit.expand,
                        children: [

                          // Gradasi agar teks lebih mudah dibaca
                          Positioned.fill(
                            child: Container(
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter,
                                  colors: [
                                    Colors.transparent,
                                    Colors.black.withOpacity(0.55),
                                  ],
                                ),
                              ),
                            ),
                          ),

                          // Nama makanan
                          Positioned(
                            left: 10,
                            bottom: 10,
                            right: 10,
                            child: Text(
                              item['title']!,
                              style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 15,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),

            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}