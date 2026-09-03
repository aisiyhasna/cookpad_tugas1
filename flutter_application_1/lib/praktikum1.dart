
import'package:flutter/material.dart';

void main() => runApp(const CookpadApp());

class CookpadApp extends StatelessWidget {
  const CookpadApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  final foods = const [
    ['ayam bakar',
      'https://images.unsplash.com/photo-1598515214211-89d3c73ae83b?w=500'],
    ['bolu pisang kukus takaran sendok',
      'https://images.unsplash.com/photo-1606313564200-e75d5e30476b?w=500'],
    ['capcay',
      'https://images.unsplash.com/photo-1547592180-85f173990554?w=500'],
    ['bolu pisang',
      'https://images.unsplash.com/photo-1551024506-0bccd828d307?w=500'],
    ['soto ayam',
      'https://images.unsplash.com/photo-1547592166-23ac45744acd?w=500'],
    ['brownies kukus',
      'https://images.unsplash.com/photo-1606312619070-d48b4c652a52?w=500'],
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(20),
          children: [
            // HEADER
            Row(
              children: [
                CircleAvatar(
                  radius: 28,
                  backgroundColor: Colors.orange,
                  child: const Icon(Icons.restaurant, color: Colors.white),
                ),
                const SizedBox(width: 10),
                const Text(
                  'cookpad',
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Color(0xff671818),
                  ),
                ),
                const Spacer(),
                const CircleAvatar(
                  backgroundColor: Colors.pink,
                  child: Icon(Icons.person, color: Colors.white),
                ),
                const SizedBox(width: 15),
                const Icon(Icons.notifications_none, size: 30),
              ],
            ),

            const SizedBox(height: 25),

            // SEARCH
            TextField(
              decoration: InputDecoration(
                hintText: 'Ketik bahan-bahan...',
                prefixIcon: const Icon(Icons.search, size: 30),
                filled: true,
                fillColor: Colors.grey.shade100,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(35),
                  borderSide: BorderSide(color: Colors.grey.shade300),
                ),
              ),
            ),

            const SizedBox(height: 20),

            // BANNER
            Container(
              height: 220,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: const Color(0xfffff8e8),
                borderRadius: BorderRadius.circular(5),
              ),
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'cookpad',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 15),
                  Text(
                    'ANEKA GORENGAN',
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Color(0xffad7519),
                    ),
                  ),
                  Text(
                    '10–16 Agt 2026',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 8),
                  Text('#CookpadApron2026 #AnekaGorengan'),
                ],
              ),
            ),

            const SizedBox(height: 25),

            // TITLE
            Row(
              children: [
                const Text(
                  'Pencarian Populer',
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Spacer(),
                Text(
                  'Diperbarui 04.30',
                  style: TextStyle(color: Colors.grey.shade600),
                ),
              ],
            ),

            const SizedBox(height: 15),

            // GRID
            GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: foods.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 12,
                mainAxisSpacing: 12,
                childAspectRatio: 1.4,
              ),
              itemBuilder: (context, i) {
                return ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Stack(
                    fit: StackFit.expand,
                    children: [
                      Image.network(
                        foods[i][1],
                        fit: BoxFit.cover,
                      ),

                      Container(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                              Colors.transparent,
                              Colors.black.withOpacity(.7),
                            ],
                          ),
                        ),
                      ),

                      Positioned(
                        left: 12,
                        bottom: 10,
                        child: Text(
                          foods[i][0],
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 17,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
