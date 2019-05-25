import 'package:flutter/material.dart';
import 'package:floating_search_bar/floating_search_bar.dart';
import 'ebook_sarchbar.dart';

class SearchPage extends StatelessWidget {
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(title: Text('搜索', style: TextStyle(color: Colors.white))),


      body: EbookSearchBar(
        leading: Icon(Icons.search),
        decoration:InputDecoration.collapsed(hintText: "搜索"),
        // onChanged: (keyword){
        //   print('搜索关键词：'+keyword);
        // },
        // onTap: (){
        //   print('被点击');
        // },
        children: <Widget>[
 
        ],
      ),


      // body: FloatingSearchBar.builder(
      //   leading: Icon(Icons.search),
      //   decoration:InputDecoration.collapsed(hintText: "搜索"),
      //   itemCount: 100,
      //   itemBuilder: (BuildContext context, int index) {
      //     return ListTile(title: Text('${index}'),);
      //   },
      //   onChanged: (keyword){
      //     print('搜索关键词：'+keyword);
      //   },
      //   onTap: (){
      //     print('被点击');
      //   },
      // ),


      // body: CustomScrollView(
      //   physics: NeverScrollableScrollPhysics(),
      //   slivers: <Widget>[
      //   SliverPadding(padding: EdgeInsets.only(top: 15),),
      //   SliverFloatingBar(
      //       leading: Icon(Icons.search),
      //       floating: false,
      //       title: TextField(
      //             decoration:InputDecoration.collapsed(hintText: "Search..."),
      //             autofocus: false,
      //             onTap: (){

      //             },
      //           ),
      //     ),
      // ],),

      
    );
  }

  
}



