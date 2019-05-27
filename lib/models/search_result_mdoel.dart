class SearchResultsModel {
  List<SearchedBook> books;
  int total;
  bool ok;

  SearchResultsModel({this.books, this.total, this.ok});

  SearchResultsModel.fromJson(Map<String, dynamic> json) {
    if (json['books'] != null) {
      books = new List<SearchedBook>();
      json['books'].forEach((v) {
        books.add(new SearchedBook.fromJson(v));
      });
    }
    total = json['total'];
    ok = json['ok'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.books != null) {
      data['books'] = this.books.map((v) => v.toJson()).toList();
    }
    data['total'] = this.total;
    data['ok'] = this.ok;
    return data;
  }
}

class SearchedBook {
  String bId;
  String title;
  String author;
  String shortIntro;
  String cover;
  String cat;
  String followerCount;
  String zt;
  String updated;
  String lastchapter;

  SearchedBook(
      {this.bId,
      this.title,
      this.author,
      this.shortIntro,
      this.cover,
      this.cat,
      this.followerCount,
      this.zt,
      this.updated,
      this.lastchapter});

  SearchedBook.fromJson(Map<String, dynamic> json) {
    bId = json['_id'];
    title = json['title'];
    author = json['author'];
    shortIntro = json['shortIntro'];
    cover = json['cover'];
    cat = json['cat'];
    followerCount = json['followerCount'];
    zt = json['zt'];
    updated = json['updated'];
    lastchapter = json['lastchapter'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.bId;
    data['title'] = this.title;
    data['author'] = this.author;
    data['shortIntro'] = this.shortIntro;
    data['cover'] = this.cover;
    data['cat'] = this.cat;
    data['followerCount'] = this.followerCount;
    data['zt'] = this.zt;
    data['updated'] = this.updated;
    data['lastchapter'] = this.lastchapter;
    return data;
  }
}

