// lib/recommended_content_page.dart

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';

class RecommendedContentPage extends StatefulWidget {
  RecommendedContentPage({Key? key}) : super(key: key);

  @override
  _RecommendedContentPageState createState() => _RecommendedContentPageState();
}

class _RecommendedContentPageState extends State<RecommendedContentPage> {
  final FirebaseRemoteConfig _remoteConfig = FirebaseRemoteConfig.instance;
  List<Map<String, dynamic>> _contents = [];
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _initializeAndFetchConfig();
  }

  Future<void> _initializeAndFetchConfig() async {
    setState(() {
      _isLoading = true;
    });
    try {
      await _remoteConfig.setConfigSettings(RemoteConfigSettings(
        fetchTimeout: const Duration(seconds: 10),
        minimumFetchInterval: const Duration(minutes: 5),
      ));
      await _remoteConfig.fetchAndActivate();
      String contentsJsonString = _remoteConfig
          .getString('onerilen_icerikler'); // PARAMETRE ADINI KONTROL ET

      print(
          "DEBUG: Ham JSON String for Recommended Content: $contentsJsonString");

      if (contentsJsonString.isNotEmpty) {
        final List<dynamic> decodedJson = jsonDecode(contentsJsonString);
        _contents = decodedJson.cast<Map<String, dynamic>>();
      } else {
        _contents = [];
        print(
            "Remote Config'den 'onerilen_icerikler' için boş veya geçersiz veri geldi.");
      }
    } catch (e) {
      print('Remote Config (Önerilen İçerikler) hatası: $e');
      _contents = [
        {
          "title": "İçerikler yüklenirken bir sorun oluştu",
          "content": e.toString()
        }
      ];
    } finally {
      if (mounted) {
        setState(() {
          _isLoading = false;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(
          0xFFFFE8E0), // Arka plan rengini projenize göre ayarlayabilirsiniz
      appBar: AppBar(
        title: Text("Önerilen İçerikler"),
        backgroundColor: Color(
            0xFF76A47F), // AppBar rengini projenize göre ayarlayabilirsiniz
      ),
      body: _isLoading
          ? Center(child: CircularProgressIndicator())
          : _contents.isEmpty
              ? Center(
                  child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    "Şu anda gösterilecek önerilen içerik bulunamadı.",
                    textAlign: TextAlign.center,
                  ),
                ))
              : ListView.builder(
                  itemCount: _contents.length,
                  padding: EdgeInsets.all(16),
                  itemBuilder: (context, index) {
                    final contentItem = _contents[index];
                    String title =
                        contentItem['title']?.toString() ?? 'Başlık Yok';
                    String content =
                        contentItem['content']?.toString() ?? 'İçerik Yok';
                    List<dynamic> tagsRaw = contentItem['tags'] ?? [];
                    List<String> tags =
                        tagsRaw.map((tag) => tag.toString()).toList();

                    return Card(
                      color: Colors.white,
                      margin: EdgeInsets.symmetric(vertical: 8),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: ListTile(
                        // İkonu içeriğin türüne göre değiştirebilirsiniz
                        leading: Icon(
                            _getIconForType(contentItem['type']?.toString()),
                            color: Color(0xFF76A47F)),
                        title: Text(
                          title,
                          style: TextStyle(
                              fontSize: 17, fontWeight: FontWeight.bold),
                        ),
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(height: 4),
                            Text(content, style: TextStyle(fontSize: 14)),
                            SizedBox(height: 8),
                            if (tags.isNotEmpty)
                              Wrap(
                                spacing: 6.0,
                                runSpacing: 4.0,
                                children: tags
                                    .map((tag) => Chip(
                                          label: Text(tag,
                                              style: TextStyle(fontSize: 10)),
                                          backgroundColor: Colors.grey.shade200,
                                        ))
                                    .toList(),
                              ),
                          ],
                        ),
                        isThreeLine: tags
                            .isNotEmpty, // Etiketler varsa yüksekliği ayarla
                        onTap: () {
                          // İleride detaya gitme işlevi eklenebilir
                          ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text('$title tıklandı!')));
                        },
                      ),
                    );
                  },
                ),
    );
  }

  IconData _getIconForType(String? type) {
    switch (type) {
      case 'makale':
        return Icons.article_outlined;
      case 'pratik':
        return Icons.directions_run_outlined;
      case 'alıntı':
        return Icons.format_quote_outlined;
      case 'meditasyon':
        return Icons.self_improvement_outlined;
      default:
        return Icons.lightbulb_outline;
    }
  }
}
