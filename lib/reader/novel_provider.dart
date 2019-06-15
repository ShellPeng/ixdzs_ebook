import '../app/api_service.dart';

class NovelProvider {
  static Future<Chapter> fetchChapter(int bId,int chapterId) async {
    var response = await request(EbookApi.Chapter(bId,chapterId));
    var chapter = Chapter.fromJson(response.data['chapter'])
                  ..novelId = bId
                  ..chapterId = chapterId
                  ..nextChapterId = chapterId +1
                  ..preChapterId = (chapterId -1 > 0)?chapterId -1:0
                  ..index = 0;
    return chapter;
  }
}




// class NovelChapter {
//   bool ok;
//   Chapter chapter;

//   NovelChapter({this.ok, this.chapter});

//   NovelChapter.fromJson(Map<String, dynamic> json) {
//     ok = json['ok'];
//     chapter =
//         json['chapter'] != null ? new Chapter.fromJson(json['chapter']) : null;
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['ok'] = this.ok;
//     if (this.chapter != null) {
//       data['chapter'] = this.chapter.toJson();
//     }
//     return data;
//   }
// }

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
    body = json['body'];
    index = 0;
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