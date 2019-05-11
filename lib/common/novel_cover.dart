import 'package:flutter/material.dart';
import '../app/app_color.dart';
import 'package:cached_network_image/cached_network_image.dart';

class NovelCover extends StatelessWidget {
  final String imgUrl;
  final double width;
  final double height;

  NovelCover(this.imgUrl,this.width,this.height);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Image(
        image: CachedNetworkImageProvider(imgUrl),
        fit: BoxFit.cover,
        width: width,
        height: height
      ),
      decoration: BoxDecoration(border: Border.all(color: AppColor.paper,width: 1))
    );
  }
}