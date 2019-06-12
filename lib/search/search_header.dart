import 'package:flutter/material.dart';
import '../app/application.dart';
import 'dart:math';
import '../common/section_title.dart';
import '../models/hotwords_model.dart';

typedef Callback = void Function(dynamic params);


class SearchHeader extends StatelessWidget {
  final Callback selectBlock;
  final VoidCallback onTap;
  final HotWordsModel hotWords;
  
  SearchHeader(this.hotWords,{Key key,this.onTap,this.selectBlock}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Widget> childrenChips = [];

    if (hotWords.newHotWords != null) {
    for (var hotWord in hotWords.newHotWords) {
      childrenChips.add(Container(
        height: 30,
        child: ActionChip(
          label:
              Text(hotWord.word ==null ?'':hotWord.word, style: TextStyle(color: Colors.white, fontSize: 13)),
          // labelPadding: EdgeInsets.symmetric(vertical: -2),
          backgroundColor: Color.fromRGBO(Random().nextInt(255),
              Random().nextInt(255), Random().nextInt(255), 1),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(3)),
          onPressed: (){
            selectBlock(hotWord.word);
          }),
        // child: GestureDetector(
        //   child: Text(author,style:TextStyle(color: Colors.white),textAlign: TextAlign.center,),
        // ),
      )
          );
    }
    }

    return Container(
        child: Column(
      children: <Widget>[
        SectionTitle('大家都在搜', '换一批',onTap: onTap),
        Container(
            width: Screen.width-20,
            padding: EdgeInsets.symmetric(vertical: 20), 
            child: Wrap(
              alignment: WrapAlignment.start,
              spacing: 5,
              runSpacing: 3,
              children: childrenChips,
            ))
      ],
    ));
  }
}
