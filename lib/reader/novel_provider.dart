import '../app/api_service.dart';

class NovelProvider {
  static Future<Chapter> fetchChapter(int bId,int chapterId) async {
    var response = await request(EbookApi.Chapter(bId,chapterId));
    var chapter = Chapter.fromJson(response.data['chapter'])
                  ..novelId = bId
                  ..chapterId = chapterId
                  ..nextChapterId = chapterId +1
                  ..preChapterId = (chapterId > 1)?chapterId -1:0
                  ..index = chapterId;
    
    if (chapter == null){
      chapter = Chapter()
                ..title = '暂无'
                ..body = '暂无'
                ..novelId = bId
                ..chapterId = chapterId
                ..nextChapterId = chapterId +1
                ..preChapterId = (chapterId > 1)?chapterId -1:0
                ..index = chapterId;
    }
    return chapter;
  }

  static Future<ChaptersList> fetchChapters(int novelId) async {
    var response = await request(EbookApi.ChapterList(novelId));
    var chapters = ChaptersList.fromJson(response.data);
    return chapters;
  }

}




class ChaptersList {
  String sId;
  int chaptercount;
  String chaptersUpdated;
  List<ChapterListItem> chapters;
  String updated;
  bool ok;

  ChaptersList(
      {this.sId,
      this.chaptercount,
      this.chaptersUpdated,
      this.chapters,
      this.updated,
      this.ok});

  ChaptersList.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    chaptercount = json['chaptercount'];
    chaptersUpdated = json['chaptersUpdated'];
    if (json['chapters'] != null) {
      chapters = new List<ChapterListItem>();
      json['chapters'].forEach((v) {
        chapters.add(new ChapterListItem.fromJson(v));
      });
    }
    updated = json['updated'];
    ok = json['ok'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['chaptercount'] = this.chaptercount;
    data['chaptersUpdated'] = this.chaptersUpdated;
    if (this.chapters != null) {
      data['chapters'] = this.chapters.map((v) => v.toJson()).toList();
    }
    data['updated'] = this.updated;
    data['ok'] = this.ok;
    return data;
  }
}

class ChapterListItem {
  String title;
  String link;
  bool unreadble;
  int index;

  ChapterListItem({this.title, this.link, this.unreadble});

  ChapterListItem.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    link = json['link'];
    unreadble = json['unreadble'];
    if (link!=null) {
      var linkArray = link.split('/');
      index = int.parse(linkArray.last);
    } else {
      index = 1;
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    data['link'] = this.link;
    data['unreadble'] = this.unreadble;
    return data;
  }
}



class Chapter {
  int novelId;
  int chapterId;
  String title;
  String body;
  int index;
  int nextChapterId;
  int preChapterId;
  List<Map<String, int>> pageOffsets;

  Chapter({this.title, this.body});

  Chapter.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    body = '　　' +json['body'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    data['body'] = this.body;
    return data;
  }

  String stringAtPageIndex(int index) {
    var offset = pageOffsets[index];
    return this.body.substring(offset['start'], offset['end']);
  }

  int get pageCount {
    return pageOffsets.length;
  }
}