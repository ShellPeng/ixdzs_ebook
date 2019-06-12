import 'package:shared_preferences/shared_preferences.dart';
import '../app/application.dart';
import '../models/shelf_book_model.dart';

class BookshelfProvide with ChangeNotifier{
  List<ShelfBookModel> _shelfBookList = [];
  List<ShelfBookModel> get shelfBookList => _shelfBookList;

  reloadData() async {
    // _shelfBookList.clear();
    _shelfBookList = await _updateBookList();
  
    notifyListeners();
  }

Future<List<ShelfBookModel>> _updateBookList() async{
    preferences = await SharedPreferences.getInstance();
    preferences.setStringList('bids', ['151926','154223','200077','168481','195630','168708']);
    var bidArray = preferences.getStringList('bids');
    if (bidArray == null){
      print('数组为空');
    }else{
      print(bidArray); 
    }
    
    
    var bids = ''; 
    bidArray.forEach((String bid) {
      if (bids == ''){
        bids = bid;
      }else{
        bids = bids+','+bid;
      }
    });
    print(bids);
    var response = await request(EbookApi.Update,params: {'id': bids});
    return ShelfBookModel.fromMapList(response.data); 
  }
}