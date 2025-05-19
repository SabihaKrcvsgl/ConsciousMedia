import 'package:flutter/material.dart';
import 'recommended_content_page.dart'; // Yeni sayfamızın importu
import 'useful_content_page.dart'; // Bu hala kullanılıyor mu? Eğer RecommendedContentPage bunun yerini alıyorsa kaldırılabilir.
import 'time_management_tips_page.dart';

// Eğer FeaturesPage bu dosyada tanımlı değilse ve ayrı bir dosyadaysa, onu da import etmeniz gerekir.
// Örnek: import 'features_page.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF76A47F),
        title: Text('ConsciousMedia', style: TextStyle(color: Colors.white)),
        automaticallyImplyLeading: false,
        actions: [
          TextButton(
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Şu anda anasayfadasınız.')));
            },
            child: Text('Anasayfa', style: TextStyle(color: Colors.white)),
          ),
          TextButton(
            onPressed: () {
              // FeaturesPage'in bu dosyada veya doğru şekilde import edildiğinden emin olun
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => FeaturesPage()),
              );
            },
            child: Text('Özellikler', style: TextStyle(color: Colors.white)),
          ),
          // Çıkış Yap butonu için yer tutucu
          /*
          TextButton(
            onPressed: () {
              // Gerçek Firebase Auth eklendiğinde burası doldurulacak
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('Çıkış yapma işlevi eklenecek.')),
              );
            },
            child: Text('Çıkış Yap', style: TextStyle(color: Colors.white)),
          ),
          */
        ],
      ),
      backgroundColor:
          Color.fromARGB(255, 249, 231, 218), // Arka plan rengi güncellendi
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
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
                        'Sabiha_K', // Dinamik olacak
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF3D6B4E),
                        ),
                      ),
                      Text(
                        'Hoş geldin, Sabiha!', // Dinamik olacak
                        style: TextStyle(
                          fontSize: 18,
                          color: Color(0xFF3D6B4E),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 5),

              // Motivasyon
              Center(
                child: Text(
                  'Bugün daha bilinçli bir gün!',
                  style: TextStyle(
                    fontSize: 20, // Font boyutu güncellendi
                    fontWeight: FontWeight.bold,
                    color: Color(0xFFB45F04),
                  ),
                ),
              ),
              SizedBox(height: 5),

              // Kullanım süresi kartı
              _buildCard(
                child: ListTile(
                  leading: CircularProgressIndicator(
                    value: 0.5, // Dinamik olacak
                    backgroundColor: Colors.grey.shade300,
                    valueColor: AlwaysStoppedAnimation<Color>(
                      Color(0xFF76A47F),
                    ),
                  ),
                  title: Text('Bugün 1s 25dk'), // Dinamik olacak
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
              SizedBox(height: 5),

              // Zaman Yönetimi kartı
              _buildCard(
                child: ListTile(
                  leading: Icon(Icons.access_time, color: Color(0xFFB45F04)),
                  title: Text('Zaman Yönetimi'),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => TimeManagementTipsPage(),
                      ),
                    );
                  },
                ),
              ),
              SizedBox(height: 5),

              // ===== DEĞİŞİKLİK BURADA BAŞLIYOR =====
              // Önerilen İçerikler kartı (Eski Faydalı İçerik kartının yerine)
              _buildCard(
                child: ListTile(
                  leading: Icon(
                    Icons.auto_awesome_outlined, // Yeni ikon
                    color: Color(0xFF76A47F),
                  ),
                  title: Text('Önerilen İçerikler'), // Yeni başlık
                  // trailing: Chip(...) // Trailing kaldırıldı
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            RecommendedContentPage(), // YENİ SAYFAYA YÖNLENDİRME
                      ),
                    );
                  },
                ),
              ),
              // ===== DEĞİŞİKLİK BURADA BİTİYOR =====

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
              SizedBox(height: 5),

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
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF3D6B4E),
                ),
              ),
              SizedBox(height: 1),
              Container(
                height: 170,
                padding: EdgeInsets.symmetric(vertical: 5),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 2,
                      blurRadius: 5,
                      offset: Offset(0, 2),
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
              SizedBox(height: 10),

              Center(
                child: Text(
                  '© 2025 ConsciousMedia',
                  style: TextStyle(
                    color: const Color.fromARGB(255, 139, 138, 138),
                    fontSize: 14,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCard({required Widget child}) {
    return Card(
      color: Color(0xFFE6F2E6),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      elevation: 2,
      margin: EdgeInsets.symmetric(vertical: 4),
      child: child,
    );
  }

  Widget _buildColoredCard({
    required String title,
    required IconData icon,
    required VoidCallback onTap,
  }) {
    return Card(
      color: Color(0xFF76A47F),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      elevation: 2,
      margin: EdgeInsets.symmetric(vertical: 4),
      child: ListTile(
        leading: Icon(icon, color: Colors.white),
        title: Text(title,
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500)),
        onTap: onTap,
      ),
    );
  }

  Widget _buildSocialMediaBar(String platform, double value, Color color) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
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
        SizedBox(height: 4),
        Text(
          platform,
          style: TextStyle(fontSize: 11, fontWeight: FontWeight.w500),
        ),
      ],
    );
  }
}

// Özellikler sayfası (FeaturesPage)
// Bu sınıfın tanımı burada kalabilir veya ayrı bir dosyaya (features_page.dart) taşınabilir.
// Eğer ayrı bir dosyaya taşırsanız, HomePage'de en üste import 'features_page.dart'; eklemeyi unutmayın.
class FeaturesPage extends StatelessWidget {
  FeaturesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:
          Color.fromARGB(255, 253, 234, 218), // Arka plan rengi güncellendi
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
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 20),
              _buildFeatureTile(
                icon: Icons.access_time,
                title: 'Zaman Yönetimi',
                description:
                    'Sosyal medya kullanım sürenizi takip edin ve bilinçli sınırlar belirleyin.',
              ),
              _buildFeatureTile(
                icon: Icons.filter_alt_off,
                title: 'Zararlı İçerik Filtreleme',
                description:
                    'İstenmeyen ve olumsuz içerikleri otomatik olarak filtreleyin.',
              ),
              _buildFeatureTile(
                icon: Icons.lightbulb_outline,
                title: 'Faydalı İçerik Önerileri',
                description:
                    'Kişisel gelişiminize katkıda bulunacak eğitici ve ilham verici içerikler keşfedin.',
              ),
              _buildFeatureTile(
                icon: Icons.family_restroom,
                title: 'Ebeveyn Kontrolü',
                description:
                    'Çocuklarınız için güvenli ve yaşlarına uygun bir sosyal medya deneyimi sağlayın.',
              ),
              _buildFeatureTile(
                icon: Icons.analytics_outlined,
                title: 'Kullanım Analizleri',
                description:
                    'Sosyal medya alışkanlıklarınızı detaylı raporlarla analiz edin.',
              ),
              _buildFeatureTile(
                icon: Icons.notifications_paused_outlined,
                title: 'Bilinçli Kullanım Bildirimleri',
                description:
                    'Uzun süreli kullanımlarda mola vermeniz için nazik hatırlatıcılar alın.',
              ),
              SizedBox(height: 30),
              Center(
                child: Text(
                  '© 2025 ConsciousMedia',
                  style: TextStyle(
                      color: Color(0xFF3D6B4E).withOpacity(0.7), fontSize: 12),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildFeatureTile({
    required IconData icon,
    required String title,
    required String description,
  }) {
    return Card(
      color: Color(0xFFE6F2E6),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      margin: EdgeInsets.symmetric(vertical: 8),
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(icon, color: Color(0xFF76A47F), size: 36),
            SizedBox(width: 15),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF3D6B4E),
                    ),
                  ),
                  SizedBox(height: 4),
                  Text(description,
                      style: TextStyle(
                          color: Color(0xFF3D6B4E).withOpacity(0.9),
                          fontSize: 13)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// BU DOSYADAN LoginPage TANIMI SİLİNMİŞTİR.
