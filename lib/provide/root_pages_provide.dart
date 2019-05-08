import 'package:flutter/material.dart';

class RootPagesProvide with ChangeNotifier{
  int _page = 0;

  int get page => _page;

  changePage(int page){
    _page = page;
    notifyListeners();
  }
}