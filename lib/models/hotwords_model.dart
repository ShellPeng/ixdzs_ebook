class HotWordsModel {
  List<String> hotWords;
  List<HotWord> newHotWords;
  bool ok;

  HotWordsModel({this.hotWords, this.newHotWords, this.ok});

  HotWordsModel.fromJson(Map<String, dynamic> json) {
    hotWords = json['hotWords'].cast<String>();
    if (json['newHotWords'] != null) {
      newHotWords = new List<HotWord>();
      json['newHotWords'].forEach((v) {
        newHotWords.add(new HotWord.fromJson(v));
      });
    }
    ok = json['ok'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['hotWords'] = this.hotWords;
    if (this.newHotWords != null) {
      data['newHotWords'] = this.newHotWords.map((v) => v.toJson()).toList();
    }
    data['ok'] = this.ok;
    return data;
  }
}

class HotWord {
  String word;
  String book;

  HotWord({this.word, this.book});

  HotWord.fromJson(Map<String, dynamic> json) {
    word = json['word'];
    book = json['book'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['word'] = this.word;
    data['book'] = this.book;
    return data;
  }
}

