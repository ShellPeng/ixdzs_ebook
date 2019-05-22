import '../app/application.dart';
import '../models/recommend_model.dart';
import '../models/hotauthors_model.dart';

class RecommendProvide with ChangeNotifier{
  RecNovelListModel _readNowModel = RecNovelListModel();
  RecNovelListModel _hotRecModel = RecNovelListModel();
  HotAuthorModel _hotAuthorModel = HotAuthorModel();

  RecNovelListModel get readNowModel => _readNowModel;
  RecNovelListModel get hotRecModel => _hotRecModel;
  HotAuthorModel get hotAuthorModel => _hotAuthorModel;

  reloadData() async {
    _readNowModel = await _getReadNowData();
    _hotRecModel = await _getHotRecData();
    _hotAuthorModel = await _getHotAuthors();
    _readNowModel.recommendType = '大家正在看';
    _hotRecModel.recommendType = '热门推荐';
    notifyListeners();
  }

  Future<RecNovelListModel> _getReadNowData() async {
    var response = await request(EbookApi.readnow,params: {'limit': 3});
    return RecNovelListModel.fromMap(response.data);
  }

  Future<RecNovelListModel> _getHotRecData() async {
    var response = await request(EbookApi.recommend,params: {'limit': 3});
    return RecNovelListModel.fromMap(response.data);
  }

  Future<HotAuthorModel> _getHotAuthors() async{
    var response = await request(EbookApi.hotauthor,params: {'limit': 30});
    return HotAuthorModel.fromMap(response.data);
  }
}