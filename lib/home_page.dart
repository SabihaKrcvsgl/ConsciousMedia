import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF76A47F),
        title: Text('ConsciousMedia', style: TextStyle(color: Colors.white)),
        actions: [
          TextButton(
            onPressed: () {
              ScaffoldMessenger.of(
                context,
              ).showSnackBar(SnackBar(content: Text('Zaten anasayfadasın!')));
            },
            child: Text('Anasayfa', style: TextStyle(color: Colors.white)),
          ),
          TextButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => FeaturesPage()),
              );
            },
            child: Text('Özellikler', style: TextStyle(color: Colors.white)),
          ),
          TextButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => LoginPage()),
              );
            },
            child: Text('Giriş Yap', style: TextStyle(color: Colors.white)),
          ),
        ],
      ),
      backgroundColor: Color.fromARGB(255, 239, 216, 197),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Başlık
              Row(
                children: [
                  CircleAvatar(
                    radius: 30,
                    backgroundColor: Color(0xFF76A47F),
                    child: Icon(Icons.person, color: Colors.white, size: 30),
                  ),
                  SizedBox(width: 15),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'ConsciousMedia',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF3D6B4E),
                        ),
                      ),
                      Text(
                        'Hoş geldin, Sabiha!',
                        style: TextStyle(
                          fontSize: 18,
                          color: Color(0xFF3D6B4E),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 10),

              // Motivasyon
              Center(
                child: Text(
                  'Bugün daha bilinçli bir gün!',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFFB45F04),
                  ),
                ),
              ),
              SizedBox(height: 20),

              // Kullanım süresi kartı
              _buildCard(
                child: ListTile(
                  leading: CircularProgressIndicator(
                    value: 0.5,
                    backgroundColor: Colors.grey.shade300,
                    valueColor: AlwaysStoppedAnimation<Color>(
                      Color(0xFF76A47F),
                    ),
                  ),
                  title: Text('Bugün 1s 25d'),
                  trailing: Icon(Icons.arrow_forward_ios),
                  onTap: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('Kullanım detayları gösterilecek'),
                      ),
                    );
                  },
                ),
              ),
              SizedBox(height: 20),

              // Zaman Yönetimi kartı
              _buildCard(
                child: ListTile(
                  leading: Icon(Icons.access_time, color: Color(0xFFB45F04)),
                  title: Text('Zaman Yönetimi'),
                  onTap: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('Zaman yönetimi sayfası açılacak'),
                      ),
                    );
                  },
                ),
              ),
              SizedBox(height: 20),

              // Faydalı İçerik kartı
              _buildCard(
                child: ListTile(
                  leading: Icon(
                    Icons.menu_book,
                    color: Color.fromARGB(255, 210, 223, 215),
                  ),
                  title: Text('Faydalı İçerik Önerisi'),
                  trailing: Chip(
                    label: Text('Açık', style: TextStyle(color: Colors.white)),
                    backgroundColor: Color(0xFF76A47F),
                  ),
                  onTap: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Faydalı içerik gösterilecek')),
                    );
                  },
                ),
              ),
              SizedBox(height: 20),

              // Zararlı İçerik kartı
              _buildColoredCard(
                title: 'Zararlı İçerik Filtreleme',
                icon: Icons.filter_alt,
                onTap: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('Zararlı içerik filtreleme açılacak'),
                    ),
                  );
                },
              ),
              SizedBox(height: 20),

              // Ebeveyn Kontrolü kartı
              _buildColoredCard(
                title: 'Ebeveyn Kontrolü',
                icon: Icons.shield,
                onTap: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Ebeveyn kontrolü açılacak')),
                  );
                },
              ),
              Spacer(),

              // Sosyal medya kullanımı grafiği
              Text(
                'Sosyal Medya Kullanımı',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF3D6B4E),
                ),
              ),
              SizedBox(height: 10),
              Container(
                height: 200,
                padding: EdgeInsets.symmetric(vertical: 20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: Offset(0, 3),
                    ),
                  ],
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    _buildSocialMediaBar('Instagram', 0.8, Colors.purple),
                    _buildSocialMediaBar('Facebook', 0.4, Colors.blue),
                    _buildSocialMediaBar('Twitter', 0.6, Colors.black),
                    _buildSocialMediaBar('TikTok', 0.7, Colors.pinkAccent),
                  ],
                ),
              ),
              SizedBox(height: 20),

              Center(
                child: Text(
                  '© 2025 ConsciousMedia',
                  style: TextStyle(color: Colors.grey, fontSize: 12),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Ortak Card
  Widget _buildCard({required Widget child}) {
    return Card(
      color: Color(0xFFE6F2E6),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: child,
    );
  }

  // Renkli Card
  Widget _buildColoredCard({
    required String title,
    required IconData icon,
    required VoidCallback onTap,
  }) {
    return Card(
      color: Color(0xFF76A47F),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: ListTile(
        leading: Icon(icon, color: Colors.white),
        title: Text(title, style: TextStyle(color: Colors.white)),
        onTap: onTap,
      ),
    );
  }

  // Sosyal Medya Barı
  Widget _buildSocialMediaBar(String platform, double value, Color color) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Text(
          platform,
          style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 8),
        Container(
          width: 20,
          height: 100,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.grey.shade300,
          ),
          child: Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              width: 20,
              height: 100 * value,
              decoration: BoxDecoration(
                color: color,
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
        ),
        SizedBox(height: 8),
        Text('${(value * 100).toInt()}%'),
      ],
    );
  }
}

// Özellikler sayfası
// Özellikler sayfası
class FeaturesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFEFD8C5),
      appBar: AppBar(
        backgroundColor: Color(0xFF76A47F),
        title: Text('Özellikler', style: TextStyle(color: Colors.white)),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: ListView(
            children: [
              Text(
                'ConsciousMedia Özellikleri',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF3D6B4E),
                ),
              ),
              SizedBox(height: 20),
              _buildFeatureTile(
                icon: Icons.access_time,
                title: 'Zaman Yönetimi',
                description:
                    'Sosyal medya kullanım süreni takip et ve sınırla.',
              ),
              _buildFeatureTile(
                icon: Icons.filter_alt,
                title: 'Zararlı İçerik Filtreleme',
                description: 'Zararlı ve olumsuz içerikleri otomatik filtrele.',
              ),
              _buildFeatureTile(
                icon: Icons.menu_book,
                title: 'Faydalı İçerik Önerileri',
                description:
                    'Sana özel eğitici ve ilham verici içerikler sunar.',
              ),
              _buildFeatureTile(
                icon: Icons.shield,
                title: 'Ebeveyn Kontrolü',
                description:
                    'Çocuklar için güvenli sosyal medya deneyimi sağlar.',
              ),
              _buildFeatureTile(
                icon: Icons.bar_chart,
                title: 'Kullanım Analizleri',
                description: 'Detaylı sosyal medya kullanım raporları al.',
              ),
              _buildFeatureTile(
                icon: Icons.notifications_active,
                title: 'Bilinçli Kullanım Bildirimleri',
                description:
                    'Uzun süre kullanımda hatırlatma bildirimleri gönderir.',
              ),
              SizedBox(height: 20),
              Center(
                child: Text(
                  '© 2025 ConsciousMedia',
                  style: TextStyle(color: Colors.grey, fontSize: 12),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Özellik kutucuğu
  Widget _buildFeatureTile({
    required IconData icon,
    required String title,
    required String description,
  }) {
    return Card(
      color: Color(0xFFE6F2E6),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      margin: EdgeInsets.symmetric(vertical: 10),
      child: ListTile(
        leading: Icon(icon, color: Color(0xFF76A47F), size: 30),
        title: Text(
          title,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Color(0xFF3D6B4E),
          ),
        ),
        subtitle: Text(description, style: TextStyle(color: Color(0xFF3D6B4E))),
      ),
    );
  }
}

// Giriş Yap sayfası
class LoginPage extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFEFD8C5),
      appBar: AppBar(
        backgroundColor: Color(0xFF76A47F),
        title: Text('Giriş Yap', style: TextStyle(color: Colors.white)),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Tekrar Hoş Geldin!',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF3D6B4E),
                ),
              ),
              SizedBox(height: 10),
              Text(
                'Lütfen giriş yap:',
                style: TextStyle(fontSize: 16, color: Color(0xFF3D6B4E)),
              ),
              SizedBox(height: 30),

              // Email TextField
              TextField(
                controller: emailController,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  labelText: 'E-posta',
                  labelStyle: TextStyle(color: Color(0xFF3D6B4E)),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  prefixIcon: Icon(Icons.email, color: Color(0xFF76A47F)),
                ),
              ),
              SizedBox(height: 20),

              // Password TextField
              TextField(
                controller: passwordController,
                obscureText: true,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  labelText: 'Şifre',
                  labelStyle: TextStyle(color: Color(0xFF3D6B4E)),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  prefixIcon: Icon(Icons.lock, color: Color(0xFF76A47F)),
                ),
              ),
              SizedBox(height: 30),

              // Giriş Yap Butonu
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFF76A47F),
                    padding: EdgeInsets.symmetric(vertical: 15),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                  onPressed: () {
                    String email = emailController.text;
                    String password = passwordController.text;

                    if (email.isNotEmpty && password.isNotEmpty) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Giriş yapılıyor...')),
                      );
                      // Burada giriş işlemi yapılacak
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('Lütfen tüm alanları doldurun.'),
                        ),
                      );
                    }
                  },
                  child: Text(
                    'Giriş Yap',
                    style: TextStyle(fontSize: 16, color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
