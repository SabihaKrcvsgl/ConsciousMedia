import 'package:flutter/material.dart';

class TimeManagementTipsPage extends StatelessWidget {
  final List<String> tips = [
    "⏰ Önceliklerini Belirle ve Plan Yap",
    "📅 Günlük yapılacaklar listesi oluştur",
    "🧠 Derin çalışmaya zaman ayır",
    "📵 Bildirimleri sınırla",
    "😴 Yeterli uyku al ve molalar ver",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFFE8E0),
      appBar: AppBar(
        title: Text("Zaman Yönetimi İpuçları"),
        backgroundColor: Color(0xFF76A47F),
      ),
      body: ListView.builder(
        itemCount: tips.length,
        padding: EdgeInsets.all(16),
        itemBuilder: (context, index) {
          return Card(
            color: Colors.white,
            margin: EdgeInsets.symmetric(vertical: 8),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            child: ListTile(
              leading: Icon(Icons.check_circle, color: Color(0xFF76A47F)),
              title: Text(
                tips[index],
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              ),
            ),
          );
        },
      ),
    );
  }
}
