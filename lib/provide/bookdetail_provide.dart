import 'package:shared_preferences/shared_preferences.dart';
import '../app/application.dart';
import '../models/book_recommend.dart';
import '../models/book_detail_model.dart';


class BookDetailProvide with ChangeNotifier{
  /*搜索关键字*/
  bool _isUnfold = false;
  NovelDetailModel _detailModel = NovelDetailModel()
                                  ..title = ''
                                  ..author = ''
                                  ..cat = ''
                                  ..longIntro = ''
                                  ;
  DetailRecListModel _recListModel = DetailRecListModel();

  bool get isUnfold => _isUnfold;
  NovelDetailModel get detailModel => _detailModel;
  DetailRecListModel get recListModel => _recListModel;

  reloadData(String bid) async {
    _detailModel = await _getNovelDetail(bid);
    _recListModel = await _getRecNevelList(bid);
    notifyListeners();
  }

  changeUnfoldState(){
    _isUnfold = !_isUnfold;
    notifyListeners();
  }

  Future<NovelDetailModel> _getNovelDetail(String bid) async {
    var response = await request(EbookApi.BookDetail(bid));
    return NovelDetailModel.fromJson(response.data);
  }

  Future<DetailRecListModel> _getRecNevelList(String bid) async {
    var response = await request(EbookApi.BookRecommend(bid));
    return DetailRecListModel.fromJson(response.data);
  }

}