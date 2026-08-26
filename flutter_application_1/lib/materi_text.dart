import 'package:flutter/material.dart';

class MyTextWidget extends StatelessWidget {
  const MyTextWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title : 'Flutter Demo',
      home : Scaffold (appBar: AppBar(
        title: const Center(
          child: Text('Aplikasi Saya'),
        ),
      ),
      body: const Center(
        child: Text('Hello, Kimpul'),
      ),
    ), 
    );
  }
}