import 'package:flutter/material.dart';

class ListCell extends StatelessWidget {
  final VoidCallback onPressed;
  final String iconName;
  final String title;
  
  const ListCell({this.iconName,this.title,this.onPressed});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        child: Column(children: <Widget>[
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20),
            height: 60,
            child: Row(children: <Widget>[
              Image.asset(iconName),
              SizedBox(width: 20),
              Text(title,style: TextStyle(fontSize: 18)),
              Expanded(child: Container()),
              Image.asset('img/arrow_right.png')
            ],),
          ),
          Divider(height: 1,color: Colors.grey,indent: 15)
        ],),
      ),
    );
  }
}