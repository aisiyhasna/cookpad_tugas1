import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Cupertino extends StatelessWidget {
  const Cupertino({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Container(
          color: Colors.white,
             child: Column(
                children: <Widget>[
                  AppBar(title:Text('Contoh Cupertino')),
                  CupertinoButton(
                   child: const Text('Contoh button'),
                   onPressed: () {},
              ),
              CupertinoActivityIndicator(),
            ],
          ),
        ),
      );
    }
  }