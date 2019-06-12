class NovelDetailModel {
  String bId;
  String author;
  String cover;
  String longIntro;
  String title;
  String zt;
  String cat;
  String wordCount;
  String retentionRatio;
  String followerCount;
  String updated;
  String chaptersCount;
  String lastChapter;

  NovelDetailModel(
      {this.bId,
      this.author,
      this.cover,
      this.longIntro,
      this.title,
      this.zt,
      this.cat,
      this.wordCount,
      this.retentionRatio,
      this.followerCount,
      this.updated,
      this.chaptersCount,
      this.lastChapter});

  NovelDetailModel.fromJson(Map<String, dynamic> json) {
    bId = json['_id'];
    author = json['author'];
    cover = json['cover'];
    longIntro = json['longIntro'];
    title = json['title'];
    zt = json['zt'];
    cat = json['cat'];
    wordCount = json['wordCount'];
    retentionRatio = json['retentionRatio'];
    followerCount = json['followerCount'];
    updated = json['updated'];
    chaptersCount = json['chaptersCount'];
    lastChapter = json['lastChapter'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.bId;
    data['author'] = this.author;
    data['cover'] = this.cover;
    data['longIntro'] = this.longIntro;
    data['title'] = this.title;
    data['zt'] = this.zt;
    data['cat'] = this.cat;
    data['wordCount'] = this.wordCount;
    data['retentionRatio'] = this.retentionRatio;
    data['followerCount'] = this.followerCount;
    data['updated'] = this.updated;
    data['chaptersCount'] = this.chaptersCount;
    data['lastChapter'] = this.lastChapter;
    return data;
  }
}