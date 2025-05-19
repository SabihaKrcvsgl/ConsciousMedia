// lib/auth_wrapper.dart
import 'package:firebase_auth/firebase_auth.dart'; // Gerçek Auth için şimdiden ekleyelim
import 'package:flutter/material.dart';
import 'login_page.dart'; // Sizin giriş sayfanızın importu
import 'home_page.dart'; // Sizin anasayfanızın importu

class AuthWrapper extends StatelessWidget {
  const AuthWrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // ŞİMDİLİK GERÇEK AUTH KONTROLÜ YOK, DİREKT LoginPage'E GİDECEK
    // AMA ALTYAPI HAZIR OLSUN
    // return StreamBuilder<User?>(
    //   stream: FirebaseAuth.instance.authStateChanges(),
    //   builder: (context, snapshot) {
    //     if (snapshot.connectionState == ConnectionState.waiting) {
    //       return Scaffold(body: Center(child: CircularProgressIndicator()));
    //     }
    //     if (snapshot.hasData && snapshot.data != null) {
    //       return HomePage();
    //     }
    //     return LoginPage();
    //   },
    // );

    // ŞİMDİLİK, ÖZELLİKLERİ TEST ETMEK İÇİN, HER ZAMAN LoginPage İLE BAŞLAYALIM
    // GERÇEK GİRİŞİ EKLEDİĞİMİZDE YUKARIDAKİ StreamBuilder'ı AÇACAĞIZ.
    return LoginPage();
  }
}
