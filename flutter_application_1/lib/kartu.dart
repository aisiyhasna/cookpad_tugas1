import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Widget Flutter",
      home: const ProfilePage(),
    );
  }
}

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Kartu Siswa')),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            children: const [
              Expanded(child: MyProfileCardPage(
                Nama: 'Aisyiah Hasna',
                Kelas: 'XI RPL',
              )),
              SizedBox(width: 13),
              Expanded(child: MyProfileCardPage(
                Nama: 'Azra Yasmine',
                Kelas: 'XI RPL',
              )),

            ],
          ),
        ),
      ),
    );
  }
}

class MyProfileCardPage extends StatefulWidget {
  final String Nama;
  final String Kelas;
  const MyProfileCardPage({required this.Nama, required this.Kelas});

  @override
  State<MyProfileCardPage> createState() => _MyProfileCardPageState();
}

class _MyProfileCardPageState extends State<MyProfileCardPage> {
  bool isFavorite = false;

  void toggleFavorite() {
    setState(() {
      isFavorite = !isFavorite;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.teal.shade50,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Stack(
        children: [
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: 60,
                height: 60,
                decoration: const BoxDecoration(
                  color: Colors.deepPurple,
                  shape: BoxShape.circle,
                ),
                child: const Icon(Icons.person, size: 40, color: Colors.white),
              ),
              const SizedBox(height: 12),
              Text(
                widget.Nama,
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              Text(
                widget.Kelas,
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 12),
              ),
              const Text(
                'Email : aisyiahhasna@gmail.com',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 11),
              ),
              const SizedBox(height: 12),
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: toggleFavorite,
                      child: Text(
                        isFavorite ? 'Hapus Favorit' : 'Tambah Favorit',
                        style: const TextStyle(fontSize: 11),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
          Positioned(
            top: 0,
            left: 0,
            child: Icon(
              isFavorite ? Icons.favorite : Icons.favorite_border,
              color: Colors.red,
            ),
          ),
          Positioned(
            top: 0,
            right: 0,
            child: Container(
              padding: const EdgeInsets.all(6),
              decoration: const BoxDecoration(
                color: Colors.blue,
                shape: BoxShape.circle,
              ),
              constraints: const BoxConstraints(minWidth: 24, minHeight: 24),
              child: const Center(
                child: Text('10', style: TextStyle(color: Colors.white)),
              ),
            ),
          ),
        ],
      ),
    );
  }
}