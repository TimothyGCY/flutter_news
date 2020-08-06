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
        margin: EdgeInsets.only(left: 10, right: 5, top: 10, bottom: 10),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Colors.grey[200], width: 1),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 3,
              blurRadius: 5,
              offset: Offset(0, 1), // changes position of shadow
            ),
          ],
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
                Text(
                  article.source,
                  style: titleTxt,
                ),
              ],
            ),
            SizedBox(height: 5.0),
            Expanded(
              child: Hero(
                tag: article.seen,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15.0),
                    image: DecorationImage(
                      image: NetworkImage(article.img),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Text(
              article.title,
              overflow: TextOverflow.clip,
              maxLines: 2,
              style: newsTitle,
            ),
          ],
        ));
  }
}
