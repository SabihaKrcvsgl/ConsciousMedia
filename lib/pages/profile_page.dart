import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Profil Sayfası")),
      body: const Center(
        child: Text("Hoş geldin, kullanıcı!", style: TextStyle(fontSize: 24)),
      ),
    );
  }
}
