import 'package:flutter/material.dart';

class MyImageWidget extends StatelessWidget {
  const MyImageWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Image(
         image: NetworkImage('https://3.bp.blogspot.com/-ltUgXmWpmjs/VK2ChkmAUQI/AAAAAAAAIt4/WgijzdxY1h8/s1600/wallpaper%2Bgambar%2Bsinga%2Bmengaum.jpg'),
          )
        ),
      ),
    );
  }
}