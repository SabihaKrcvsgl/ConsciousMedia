// lib/time_management_tips_page.dart

import 'dart:convert'; // JSON decode için gerekli
import 'package:flutter/material.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';

class TimeManagementTipsPage extends StatefulWidget {
  // StatelessWidget'tan StatefulWidget'a çevrildi
  TimeManagementTipsPage({Key? key}) : super(key: key);

  @override
  _TimeManagementTipsPageState createState() => _TimeManagementTipsPageState();
}

class _TimeManagementTipsPageState extends State<TimeManagementTipsPage> {
  final FirebaseRemoteConfig _remoteConfig = FirebaseRemoteConfig.instance;
  List<Map<String, dynamic>> _tips = []; // İpuçlarını saklayacağımız liste
  bool _isLoading = true; // Yüklenme durumunu takip etmek için

  @override
  void initState() {
    super.initState();
    _initializeAndFetchConfig(); // Veri çekme işlemini başlat
  }

  Future<void> _initializeAndFetchConfig() async {
    setState(() {
      _isLoading = true;
    });
    try {
      // Remote Config ayarları (opsiyonel ama önerilir)
      await _remoteConfig.setConfigSettings(RemoteConfigSettings(
        fetchTimeout: const Duration(seconds: 10),
        minimumFetchInterval: const Duration(minutes: 5),
      ));

      // Verileri çek ve aktif et
      await _remoteConfig.fetchAndActivate();
      String tipsJsonString = _remoteConfig.getString(
          'zaman_yonetimi_ipuclari'); // Firebase'deki parametre adıyla aynı olmalı

      print(
          "DEBUG: Ham JSON String from Remote Config: $tipsJsonString"); // DEBUG İÇİN EKLENDİ

      if (tipsJsonString.isNotEmpty) {
        final List<dynamic> decodedJson = jsonDecode(tipsJsonString);
        _tips = decodedJson.cast<Map<String, dynamic>>();
      } else {
        _tips = [];
        print(
            "Remote Config'den 'zaman_yonetimi_ipuclari' için boş veya geçersiz veri geldi.");
      }
    } catch (e) {
      print('Remote Config hatası: $e');
      _tips = [
        {"text": "İpuçları yüklenirken bir sorun oluştu: ${e.toString()}"}
      ]; // Hata mesajını kullanıcıya göster
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
      backgroundColor: Color(0xFFFFE8E0),
      appBar: AppBar(
        title: Text("Zaman Yönetimi İpuçları"),
        backgroundColor: Color(0xFF76A47F),
      ),
      body: _isLoading
          ? Center(child: CircularProgressIndicator())
          : _tips.isEmpty
              ? Center(
                  child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    "Şu anda gösterilecek zaman yönetimi ipucu bulunamadı.",
                    textAlign: TextAlign.center,
                  ),
                ))
              : ListView.builder(
                  itemCount: _tips.length,
                  padding: EdgeInsets.all(16),
                  itemBuilder: (context, index) {
                    final tip = _tips[index];
                    // Firebase'den gelen 'text' alanını kullanıyoruz
                    String tipText =
                        tip['text']?.toString() ?? 'İpucu metni bulunamadı';

                    return Card(
                      color: Colors.white,
                      margin: EdgeInsets.symmetric(vertical: 8),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: ListTile(
                        leading:
                            Icon(Icons.check_circle, color: Color(0xFF76A47F)),
                        title: Text(
                          tipText,
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w500),
                        ),
                      ),
                    );
                  },
                ),
    );
  }
}
