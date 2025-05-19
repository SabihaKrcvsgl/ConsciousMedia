import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/content_suggestion.dart';

class ContentSuggestionService {
  static const String baseUrl = 'YOUR_API_BASE_URL'; // API URL'nizi buraya ekleyin

  Future<List<ContentSuggestion>> getSuggestions() async {
    try {
      final response = await http.get(Uri.parse('$baseUrl/suggestions'));
      
      if (response.statusCode == 200) {
        final List<dynamic> data = json.decode(response.body);
        return data.map((json) => ContentSuggestion.fromJson(json)).toList();
      } else {
        throw Exception('İçerik önerileri yüklenirken bir hata oluştu');
      }
    } catch (e) {
      throw Exception('Bağlantı hatası: $e');
    }
  }

  Future<void> addSuggestion(ContentSuggestion suggestion) async {
    try {
      final response = await http.post(
        Uri.parse('$baseUrl/suggestions'),
        headers: {'Content-Type': 'application/json'},
        body: json.encode(suggestion.toJson()),
      );

      if (response.statusCode != 201) {
        throw Exception('İçerik önerisi eklenirken bir hata oluştu');
      }
    } catch (e) {
      throw Exception('Bağlantı hatası: $e');
    }
  }
} 