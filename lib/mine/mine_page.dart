import 'package:flutter/material.dart';
import '../common/list_cell.dart';
import '../app/application.dart';
import 'mine_header.dart';

class MinePage extends StatelessWidget {

  Widget buildCells(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          ListCell(
            title: '钱包',
            iconName: 'img/me_wallet.png',
            onPressed: () {},
          ),
          ListCell(
            title: '消费充值记录',
            iconName: 'img/me_record.png',
            onPressed: () {},
          ),
          ListCell(
            title: '购买的书',
            iconName: 'img/me_buy.png',
            onPressed: () {},
          ),
          ListCell(
            title: '我的会员',
            iconName: 'img/me_vip.png',
            onPressed: () {},
          ),
          ListCell(
            title: '绑兑换码',
            iconName: 'img/me_coupon.png',
            onPressed: () {},
          ),
          ListCell(
            title: '阅读之约',
            iconName: 'img/me_date.png',
            onPressed: () {},
          ),
          ListCell(
            title: '公益行动',
            iconName: 'img/me_action.png',
            onPressed: () {},
          ),
          ListCell(
            title: '我的收藏',
            iconName: 'img/me_favorite.png',
            onPressed: () {},
          ),
          ListCell(
            title: '打赏记录',
            iconName: 'img/me_record.png',
            onPressed: () {},
          ),
          ListCell(
            title: '我的书评',
            iconName: 'img/me_comment.png',
            onPressed: () {},
          ),
          ListCell(
            title: '个性换肤',
            iconName: 'img/me_theme.png',
            onPressed: () {},
          ),
          ListCell(
            title: '设置',
            iconName: 'img/me_setting.png',
            onPressed: () {
              // Navigator.push(context, MaterialPageRoute(builder: (context) {
              //   return SettingScene();
              // }));
            },
          ),
          ListCell(
            title: 'Github',
            iconName: 'img/me_feedback.png',
            onPressed: () {},
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(title: Text('我的',style: TextStyle(color: Colors.white))),
      appBar: PreferredSize(
        child: Container(),
        preferredSize: Size(Screen.width, 0),
      ),
      body: Container(child: ListView(
        children: <Widget>[
          MineHeader(),
          buildCells(context)
        ],
      ),),
    );
  }
}