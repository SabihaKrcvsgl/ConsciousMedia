import 'package:flutter/material.dart';

class UsefulContentPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFFE8E0), // Pembemsi ten rengi
      appBar: AppBar(
        title: Text("Faydalı İçerikler"),
        backgroundColor: Color(0xFF76A47F), // Açık yeşil
      ),
      body: ListView(
        padding: EdgeInsets.all(10),
        children: [
          _buildCard(
            icon: Icons.book,
            iconColor: Color(0xFF6495ED), // Mavi
            title: 'Dijital Detoks Rehberi',
            onTap: () {},
          ),
          _buildDivider(),
          _buildCard(
            icon: Icons.book, // İkonu kitap olarak değiştirdik
            iconColor: Color(0xFFA084CA), // Mor
            title: 'Bilgilendirici ve Eğitici İçerikler',
            onTap: () {},
          ),
          _buildDivider(),
          _buildCard(
            icon: Icons.public,
            iconColor: Color(0xFFF76D6D), // Mercan kırmızı
            title: 'Sosyal Medya Farkındalığı',
            onTap: () {},
          ),
          _buildDivider(),
          _buildCard(
            icon: Icons.visibility,
            iconColor: Color(0xFF8AAE92), // Zeytin yeşili
            title: 'Odaklanmayı Artıran Teknikler',
            onTap: () {},
          ),
        ],
      ),
    );
  }

  Widget _buildCard({
    required IconData icon,
    required Color iconColor,
    required String title,
    required VoidCallback onTap,
  }) {
    return Card(
      color:
          Colors
              .white, // Kartın kendisi beyaz kalabilir, kontrast için iyi olur
      margin: EdgeInsets.symmetric(vertical: 10),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      elevation: 5,
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: Colors.white, // İkon arka planını beyaz yapıyoruz
          child: Icon(
            icon,
            color: iconColor, // İkon rengini parametre olarak alıyoruz
          ),
        ),
        title: Text(
          title,
          style: TextStyle(
            color: Color(0xFF3E3E3E),
            fontWeight: FontWeight.bold,
            fontSize: 14, // Yazıyı biraz daha küçültüyoruz
          ),
        ),
        trailing: Icon(Icons.arrow_forward_ios, color: Color(0xFFF1E1B0)),
        onTap: onTap,
      ),
    );
  }

  Widget _buildDivider() {
    return Divider(color: Color(0xFF76A47F), thickness: 2);
  }
}
