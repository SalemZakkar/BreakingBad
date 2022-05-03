/// quote_id : 9
/// quote : "Funyuns are awesome."
/// author : "Jesse Pinkman"

class Quote {
  Quote({
    int? quoteId,
    String? quote,
    String? author,
  }) {
    _quoteId = quoteId;
    _quote = quote;
    _author = author;
  }

  Quote.fromJson(dynamic json) {
    _quoteId = json['quote_id'];
    _quote = json['quote'];
    _author = json['author'];
  }

  int? _quoteId;
  String? _quote;
  String? _author;

  Quote copyWith({
    int? quoteId,
    String? quote,
    String? author,
  }) =>
      Quote(
        quoteId: quoteId ?? _quoteId,
        quote: quote ?? _quote,
        author: author ?? _author,
      );

  int? get quoteId => _quoteId;

  String? get quote => _quote;

  String? get author => _author;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['quote_id'] = _quoteId;
    map['quote'] = _quote;
    map['author'] = _author;
    return map;
  }
}
