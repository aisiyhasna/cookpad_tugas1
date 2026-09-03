import 'package:flutter/material.dart';
import 'package:flutter_application_1/property_color.dart';
import 'package:flutter_application_1/property_highandwight.dart';
import 'package:flutter_application_1/property_margin.dart';
import 'package:flutter_application_1/property_padding.dart';
import 'package:flutter_application_1/property_transfrom.dart';
import 'package:flutter_application_1/property_decoration.dart';
import 'package:flutter_application_1/column_widget.dart';
import 'package:flutter_application_1/row_widget.dart';
import 'package:flutter_application_1/stack.dart';
import 'package:flutter_application_1/listview.dart';
import 'package:flutter_application_1/grid.dart';
import 'package:flutter_application_1/cupertino.dart';
import 'package:flutter_application_1/aligment.dart';
import 'package:flutter_application_1/button.dart';
import 'package:flutter_application_1/date.dart';
import 'package:flutter_application_1/dialog.dart';
import 'package:flutter_application_1/materi_image.dart';
import 'package:flutter_application_1/materi_widget.dart';
import 'package:flutter_application_1/property_child.dart';
import 'package:flutter_application_1/scaffold.dart';
import 'package:flutter_application_1/seleksi_widget.dart';
import 'package:flutter_application_1/praktikum1.dart';
import 'package:flutter_application_1/praktikum2.dart';
import 'package:flutter_application_1/praktikum3.dart';
import 'package:flutter_application_1/kartu.dart';
  
void main() {
  runApp(const MyProfileCardPage(Nama: '', Kelas: '',));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Latihan Dart',
      home: const DartDemoPage(),
    );
  }
}
class DartDemoPage extends StatefulWidget {
  const DartDemoPage({super.key});

  @override 
  State<DartDemoPage> createState() => _DartDemoPageState();
}

class _DartDemoPageState extends State<DartDemoPage> {
  int angka = 5; // 1. nomor absen
  String? nama_lengkap = 'Aisyiah Hasna Fairuz';
  String? hasilData;
  bool sedangMemuat = false;

  String cekGanjilGenap(int nilai) {
    // 3. switch-case menggantikan ternary/if-else
    switch (nilai % 2) {
      case 0:
        return 'Genap';
      default:
        return 'Ganjil';
    }
  }

  Future<void> ambilDataAsync() async {
    setState(() {
      sedangMemuat = true;
    });
    await Future.delayed(const Duration(seconds: 4)); // 4. jadi 4 detik
    setState(() {
      hasilData = 'Data berhasil dimuat!';
      sedangMemuat = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Latihan Dasar Dart')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
             Text('Nama: ${nama_lengkap ?? "Nama belum diisi"}'), // 2.
            const SizedBox(height: 20),
            Text('Absen $angka adalah ${cekGanjilGenap(angka)}'), // 1. menampilkan hasil ganjil/genap
            const SizedBox(height: 20),
            sedangMemuat
                ? const CircularProgressIndicator()
                : Text(hasilData ?? 'Data belum dimuat'),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: sedangMemuat ? null : ambilDataAsync,
              child: const Text('Ambil Data'),
            ),
          ],
        ),
      ),
    );
  }
}