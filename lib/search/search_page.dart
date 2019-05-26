import 'package:flutter/material.dart';
import 'package:floating_search_bar/floating_search_bar.dart';
import 'package:ixdzs_ebook/app/application.dart';
import 'ebook_sarchbar.dart';
import 'search_header.dart';
import '../common/section_title.dart';

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
          SearchHeader(),
          SectionTitle('搜索历史', '清空', onTap: (){

          }),
          Container(
            height: 40,
            child: Row(children: <Widget>[
                SizedBox(width: 15),
                Icon(Icons.timer,color: AppColor.gray),
                SizedBox(width: 10),
                Text('三体',style: TextStyle(color: AppColor.gray,fontSize: 14),)
              ])
              // leading: Icon(Icons.timer),
              // title: Text('三体',style: TextStyle(color: AppColor.gray,fontSize: 14),),            // decoration: bo,
            
          )
          
        ],
        // sectionOne: SliverToBoxAdapter(
        //   child: SearchHeader(),
        // ),
        // sectionTwo: SliverList(),
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



