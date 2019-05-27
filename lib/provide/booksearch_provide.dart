import 'package:shared_preferences/shared_preferences.dart';
import '../app/application.dart';
import '../models/search_result_mdoel.dart';
import '../models/hotwords_model.dart';

class BookSearchProvide with ChangeNotifier{
  /*搜索关键字*/
  String keyWords = '';
  HotWordsModel _hotWords = HotWordsModel();
  SearchResultsModel _resultsModel = SearchResultsModel();
  List<String> _searchList = [];

  HotWordsModel get hotWords => _hotWords;
  SearchResultsModel get resultsModel => _resultsModel;
  List<String> get searchList => _searchList;

  reloadData() async {
    _hotWords = await _getHotWords();

    notifyListeners();
  }

  searchBooks(String keyWord) async {
    keyWords = keyWord;
    if (keyWord!= ''){
      _resultsModel = await _getSearchResults(keyWord);
      notifyListeners();
    }
  }
  

  saveSearchRecord(String keyword) async{
    preferences = await SharedPreferences.getInstance();
    _searchList = preferences.getStringList('SearchRecord').toList();
    if (_searchList == null){
      _searchList = [];
    }else{
      _searchList.add(keyword);
    }
    preferences.setStringList('SearchRecord', _searchList);
    notifyListeners();
  }

  getSearchRecord() async{
    preferences = await SharedPreferences.getInstance();
    _searchList = preferences.getStringList('SearchRecord').toList();
    notifyListeners();
  }

  clearSearchRecord() async {
    _searchList = [];
    preferences.setStringList('SearchRecord', _searchList);
    notifyListeners();
  }

  Future<HotWordsModel> _getHotWords() async {
    var response = await request(EbookApi.HotWords);
    return HotWordsModel.fromJson(response.data);
  }

  Future<SearchResultsModel> _getSearchResults(String keyWord) async {
    var response = await request(EbookApi.Search,params: {'limit': 100,'start':0,'query':keyWord});
    return SearchResultsModel.fromJson(response.data);
  }

}