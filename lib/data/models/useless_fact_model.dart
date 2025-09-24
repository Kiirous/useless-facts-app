import '../../domain/entities/useless_fact.dart';

class UselessFactModel extends UselessFact {
  UselessFactModel({
    required super.id,
    required super.text,
    required super.source,
    required super.sourceUrl,
    required super.language,
  });

  factory UselessFactModel.fromJson(Map<String, dynamic> json) {
    return UselessFactModel(
      id: json['id'],
      text: json['text'],
      source: json['source'],
      sourceUrl: json['source_url'],
      language: json['language'],
    );
  }
}
