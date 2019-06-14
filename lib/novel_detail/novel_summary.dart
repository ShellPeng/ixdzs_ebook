import 'package:flutter/material.dart';

class NovelSummary extends StatelessWidget {

  final String summary;
  final bool isUnfold;
  final VoidCallback onPressed;

  NovelSummary(this.summary, this.isUnfold, this.onPressed);
  
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        color: Colors.white,
        padding: EdgeInsets.fromLTRB(15, 15, 15, 15),
        margin: EdgeInsets.only(bottom: 15),
        child: Stack(
          alignment: AlignmentDirectional.bottomEnd,
          children: <Widget>[
            Text(
              summary,
              maxLines: isUnfold ? null : 4,
              style: TextStyle(fontSize: 14),
            ),
            Image.asset(isUnfold ? 'img/detail_up.png' : 'img/detail_down.png'),
          ],
        ),
      ),
    );
  }
}