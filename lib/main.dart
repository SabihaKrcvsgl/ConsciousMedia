import 'package:flutter/material.dart';
import 'home_page.dart'; // Alttaki dosyayı da eklemen lazım

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ConsciousMedia',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.green, fontFamily: 'Roboto'),
      home: HomePage(),
    );
  }
}
