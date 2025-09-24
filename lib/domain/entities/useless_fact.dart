class UselessFact {
  String? id;
  String? text;
  String? source;
  String? sourceUrl;
  String? language;

  UselessFact({
    this.id,
    this.text,
    this.source,
    this.sourceUrl,
    this.language,
  });

  UselessFact copyWith({
    String? id,
    String? text,
    String? source,
    String? sourceUrl,
    String? language,
  }) {
    return UselessFact(
      id: id ?? this.id,
      text: text ?? this.text,
      source: source ?? this.source,
      sourceUrl: sourceUrl ?? this.sourceUrl,
      language: language ?? this.language,
    );
  }
}
