import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("ConsciousMedia"),
        backgroundColor: Colors.teal.shade700,
        actions: [IconButton(icon: const Icon(Icons.person), onPressed: () {})],
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.teal,
        unselectedItemColor: Colors.grey,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Ana Sayfa'),
          BottomNavigationBarItem(icon: Icon(Icons.explore), label: 'Keşfet'),
          BottomNavigationBarItem(icon: Icon(Icons.add), label: 'Ekle'),
          BottomNavigationBarItem(icon: Icon(Icons.bar_chart), label: 'Takip'),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle),
            label: 'Profil',
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: ListView(
          children: [
            const Text(
              "Merhaba Sabiha 👋",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            const Text("Bugün sosyal medyada 1 saat 15 dakika geçirdin."),
            const SizedBox(height: 10),
            LinearProgressIndicator(
              value: 0.6,
              color: Colors.teal,
              backgroundColor: Colors.teal.shade100,
            ),
            const SizedBox(height: 20),

            _featureCard(
              Icons.access_time,
              "Kullanım Takibi",
              "Günlük süre analizi ve hedef takibi",
            ),
            _featureCard(
              Icons.block,
              "Zararlı İçerik Filtreleme",
              "Güvenli içerik filtresi",
            ),
            _featureCard(
              Icons.lightbulb,
              "Faydalı İçerik Önerileri",
              "AI destekli içerik önerileri",
            ),
            _featureCard(
              Icons.schedule,
              "Zaman Yönetimi",
              "Süre sınırlayıcılar ve planlama",
            ),
            _featureCard(
              Icons.family_restroom,
              "Ebeveyn Kontrolü",
              "Çocuk profili ve sınırlamalar",
            ),
          ],
        ),
      ),
    );
  }

  Widget _featureCard(IconData icon, String title, String subtitle) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      margin: const EdgeInsets.symmetric(vertical: 8),
      elevation: 3,
      child: ListTile(
        leading: Icon(icon, color: Colors.teal, size: 32),
        title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text(subtitle),
        trailing: const Icon(Icons.arrow_forward_ios, size: 16),
        onTap: () {
          // ilgili sayfaya yönlendirme
        },
      ),
    );
  }
}
