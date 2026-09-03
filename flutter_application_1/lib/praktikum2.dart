import 'package:flutter/material.dart';

class Praktikum2 extends StatelessWidget {
  const Praktikum2({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body:ListView(
          children: [
            Stack(
              children: [
                Container(
                  height: 200,
                  width: double.infinity,
                  color: Colors.blue,
                ),
                Positioned(
                  top: 50,
                  left: 20,
                  child: Text('Hello, Kimpul', style: TextStyle(fontSize: 24, color: Colors.white)),
                ),
                const Align (
                  alignment: Alignment.topCenter,
                  child: Text('Berada di tengah atas')
                )
              ]
            )
          
            Text('Baris atas'),
            SizedBox(height: 20, width: 20),
            Row(
              children: [
                Icon(Icons.star),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8.0),
                  child: Text('Berjajar ke kanan'),
                )
              ],
            ),
            
            
            Container(
              height: 49,
              width: 100,
              color: const Color.fromARGB(255, 88, 40, 96),
              child: Center(child: Text('Container', style: TextStyle(color: Colors.white))),
            )
          ],
        ),
      ),
    );
  }
}