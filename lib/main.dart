import 'package:flutter/material.dart';
import 'login_page.dart'; // Eğer LoginPage başka bir dosyadaysa burayı düzenle

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Giriş Uygulaması',
      theme: ThemeData(primarySwatch: Colors.green),
      home: LoginPage(), // İlk açılacak ekran
    );
  }
}
