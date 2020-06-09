// import 'package:clone_ig/screen/login.dart';
import 'package:clone_ig/screen/menu.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Menu(),
      title: 'Instagram',
      debugShowCheckedModeBanner: false,
    );
  }
}