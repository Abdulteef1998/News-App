import 'dart:convert';

class TopHeadlinesApiResponse {
  final String status;
  final int totalResults;
  final List<Article> articles;

  TopHeadlinesApiResponse({
    required this.status,
    required this.totalResults,
    required this.articles,
  });

  factory TopHeadlinesApiResponse.fromMap(Map<String, dynamic> map) {
    return TopHeadlinesApiResponse(
      status: map['status'] as String,
      totalResults: map['totalResults'] as int,
      articles: (map['articles'] as List)
          .map((e) => Article.fromMap(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'status': status,
      'totalResults': totalResults,
      'articles': articles.map((e) => e.toMap()).toList(),
    };
  }

  factory TopHeadlinesApiResponse.fromJson(String source) =>
      TopHeadlinesApiResponse.fromMap(json.decode(source));

  String toJson() => json.encode(toMap());
}

// --------------------------------------------------

class Article {
  final Source? source;
  final String? author;
  final String? title;
  final String? description;
  final String? url;
  final String? urlToImage;
  final DateTime? publishedAt;
  final String? content;

  Article({
    this.source,
    this.author,
    this.title,
    this.description,
    this.url,
    this.urlToImage,
    this.publishedAt,
    this.content,
  });

  factory Article.fromMap(Map<String, dynamic> map) {
    return Article(
      source: map['source'] != null ? Source.fromMap(map['source']) : null,
      author: map['author'] as String?,
      title: map['title'] as String?,
      description: map['description'] as String?,
      url: map['url'] as String?,
      urlToImage: map['urlToImage'] as String?,
      publishedAt: map['publishedAt'] != null
          ? DateTime.parse(map['publishedAt'])
          : null,
      content: map['content'] as String?,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'source': source?.toMap(),
      'author': author,
      'title': title,
      'description': description,
      'url': url,
      'urlToImage': urlToImage,
      'publishedAt': publishedAt?.toIso8601String(),
      'content': content,
    };
  }
}

// --------------------------------------------------

class Source {
  final String? id;
  final String? name;

  Source({this.id, this.name});

  factory Source.fromMap(Map<String, dynamic> map) {
    return Source(id: map['id'] as String?, name: map['name'] as String?);
  }

  Map<String, dynamic> toMap() {
    return {'id': id, 'name': name};
  }
}
