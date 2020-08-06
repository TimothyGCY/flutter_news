import 'package:flutter/material.dart';
import 'package:flutter_news/models/article.dart';
import 'package:flutter_news/constants.dart';

class SecondaryCard extends StatelessWidget {
  final Article article;
  SecondaryCard({this.article});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.0),
        border: Border.all(color: Colors.grey, width: 1.0),
      ),
      child: Row(
        children: [
          Container(
            width: 90.0,
            height: 135.0,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12.0),
              image: DecorationImage(
                image: NetworkImage(article.img),
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(width: 12.0),
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 5.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    article.title,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                    style: titleTxt,
                  ),
                  SizedBox(height: 4.0),
                  Text(
                    article.desc,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                    style: contentTxt,
                  ),
                  Spacer(),
                  Row(
                    children: [
                      Text(article.time.toString(), style: contentTxt),
//                      SizedBox(width: 10.0),
//                      CircleAvatar(
//                        radius: 5.0,
//                        backgroundColor: Colors.grey,
//                      ),
//                      SizedBox(width: 10.0),
//                      Text(
//                        "${art.estimate} min read",
//                        style: kDetailContent,
//                      )
                    ],
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}