import 'package:flutter/material.dart';
import 'package:flutter_news/models/article.dart';
import 'package:flutter_news/constants.dart';

class PrimaryCard extends StatelessWidget {
  final Article article;
  PrimaryCard({this.article});
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      width: 300,
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.grey, width: 1)
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              CircleAvatar(
                radius: 5,
                backgroundColor: Colors.grey[200],
              ),
              SizedBox(width: 10),
              Text(article.author),
            ],
          ),
          SizedBox(height: 5),
        ],
      )
    );
  }
}