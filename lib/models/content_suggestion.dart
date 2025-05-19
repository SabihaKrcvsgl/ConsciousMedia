class ContentSuggestion {
  final String title;
  final String description;
  final String imageUrl;
  final String category;
  final DateTime createdAt;

  ContentSuggestion({
    required this.title,
    required this.description,
    required this.imageUrl,
    required this.category,
    required this.createdAt,
  });

  factory ContentSuggestion.fromJson(Map<String, dynamic> json) {
    return ContentSuggestion(
      title: json['title'] as String,
      description: json['description'] as String,
      imageUrl: json['imageUrl'] as String,
      category: json['category'] as String,
      createdAt: DateTime.parse(json['createdAt'] as String),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'description': description,
      'imageUrl': imageUrl,
      'category': category,
      'createdAt': createdAt.toIso8601String(),
    };
  }
} 