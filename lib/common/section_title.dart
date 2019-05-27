import 'package:flutter/material.dart';
import '../app/app_color.dart';

class SectionTitle extends StatelessWidget {

  final VoidCallback onTap;

  final String leadingTitle;

  final String trailingTitle;

  const SectionTitle(this.leadingTitle,this.trailingTitle,{Key key,this.onTap,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColor.paper,
      padding: EdgeInsets.fromLTRB(10, 15, 0, 10),
      child: Row(
        children: <Widget>[
          Image.asset(
            'img/home_tip.png',
            color: Colors.red,
          ),
          SizedBox(width: 10),
          Text(
            leadingTitle,
            style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
          ),
          Expanded(child: Container(),),
          Container(
            height: 24,
            child: FlatButton.icon(
              icon: Icon(Icons.refresh,color: AppColor.gray,),
              label: Text(trailingTitle,style: TextStyle(fontSize: 15,color: AppColor.gray),),
              color: AppColor.paper,
              onPressed: onTap,
            ),
          )
        ],
      ),
    );
  }
}