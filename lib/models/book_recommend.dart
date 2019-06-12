class DetailRecListModel {
  List<RecBookModel> booklists;
  int total;
  bool ok;

  DetailRecListModel({this.booklists, this.total, this.ok});

  DetailRecListModel.fromJson(Map<String, dynamic> json) {
    if (json['booklists'] != null) {
      booklists = new List<RecBookModel>();
      json['booklists'].forEach((v) {
        booklists.add(new RecBookModel.fromJson(v));
      });
    }
    total = json['total'];
    ok = json['ok'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.booklists != null) {
      data['booklists'] = this.booklists.map((v) => v.toJson()).toList();
    }
    data['total'] = this.total;
    data['ok'] = this.ok;
    return data;
  }
}

class RecBookModel {
  String bId;
  String title;
  String author;
  String shortIntro;
  String cover;
  Null cat;
  String followerCount;
  String zt;
  String updated;
  String lastchapter;

  RecBookModel(
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

  RecBookModel.fromJson(Map<String, dynamic> json) {
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

