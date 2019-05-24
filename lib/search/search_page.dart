import 'package:flutter/material.dart';

class SearchPage extends StatelessWidget {
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('搜索', style: TextStyle(color: Colors.white))),
      body: Container(
        child: ListView(
          children: <Widget>[
            SearchInput()
          ],
        ),
      ),
    );
  }
}


///搜索框
class SearchInput extends StatelessWidget {
  // final getResults;

  // final ValueChanged<String> onSubmitted;

  // final VoidCallback onSubmitPressed;

  // SearchInput(this.getResults, this.onSubmitted, this.onSubmitPressed);

  @override
  Widget build(BuildContext context) {
    return new Container(
      height: 40.0,
      decoration: BoxDecoration(
          color: Theme.of(context).backgroundColor,
          borderRadius: BorderRadius.circular(4.0)),
      child: new Row(
        children: <Widget>[
          new Padding(
            padding: new EdgeInsets.only(right: 10.0, top: 3.0, left: 10.0),
            child: new Icon(Icons.search,
                size: 24.0, color: Theme.of(context).accentColor),
          ),
          new Expanded(
            child: new TextField(
              // placeholder: '搜索 flutter 组件',
              // getResults: getResults,
            ),
          ),
        ],
      ),
    );
  }
}
// wigdet干掉.=> componets

