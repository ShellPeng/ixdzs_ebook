import 'package:flutter/material.dart';

class MineHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        padding: EdgeInsets.fromLTRB(20, 30, 15, 15),
        child: Row(
          children: <Widget>[
            CircleAvatar(
                radius: 40,
                backgroundImage: AssetImage('img/placeholder_avatar.png')),
            SizedBox(width: 25),
            Expanded(
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                  Text('登录', style: TextStyle(fontSize: 18)),
                  SizedBox(height: 10),
                  Container()
                ]))
          ],
        ),
      ),
    );
  }
}
