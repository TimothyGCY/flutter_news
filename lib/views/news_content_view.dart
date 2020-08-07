import 'package:flutter/material.dart';
import 'package:flutter_news/constants.dart';
import 'package:flutter_news/models/article.dart';
import 'package:flutter_news/widgets/circle_button.dart';

class NewsReaderView extends StatelessWidget {
  final Article article;

  NewsReaderView({this.article});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(65.0),
        child: Center(
          child: SafeArea(
            child: Padding(
              padding: EdgeInsets.fromLTRB(18.0, 15.0, 18.0, 0),
              child: Row(
                children: [
                  CircleButton(
                    icon: Icons.arrow_back_ios,
                    onTap: () => Navigator.pop(context),
                  ),
                  Spacer(),
                  CircleButton(
                    icon: Icons.share,
                    onTap: () {},
                  ),
                  CircleButton(
                    icon: Icons.favorite_border,
                    onTap: () {},
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 18.0),
        child: ListView(
          children: [
            SizedBox(height: 12.0),
            Hero(
              tag: article.url,
              child: Container(
                height: 220.0,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15.0),
                  image: DecorationImage(
                    image: NetworkImage(article.img),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            ),
            SizedBox(height: 15.0),
            // Row(
            //   children: [
            //     Container(
            //       padding: EdgeInsets.symmetric(
            //         horizontal: 12.0,
            //         vertical: 15.0,
            //       ),
            //       decoration: BoxDecoration(
            //         border: Border.all(color: Colors.grey, width: 1.0),
            //         borderRadius: BorderRadius.circular(25.0),
            //       ),
            //       child: Row(
            //         children: [
            //           CircleAvatar(
            //             radius: 5.0,
            //             backgroundColor: Colors.grey,
            //           ),
            //           SizedBox(width: 6.0),
            //         ],
            //       ),
            //     ),
            //     Spacer(),
            //    Status(
            //      icon: Icons.remove_red_eye,
            //      total: article.seen,
            //    ),
            //    SizedBox(width: 15.0),
            //    Status(
            //      icon: Icons.favorite_border,
            //      total: article.fav,
            //    ),
            //   ],
            // ),
            SizedBox(height: 12.0),
            Text(article.title, style: newsTitle.copyWith(fontSize: 28.0)),
            SizedBox(height: 15.0),
            Row(
              children: [
                Text(postTime(article.time), style: contentTxt),
                SizedBox(width: 5.0),
                SizedBox(
                  width: 10.0,
                  child: Divider(
                    color: Colors.black,
                    height: 1.0,
                  ),
                ),
                SizedBox(width: 5.0),
                Text(
                  article.author,
                  style: contentTxt.copyWith(color: Colors.black),
                ),
              ],
            ),
            SizedBox(height: 15.0),
            Text(
              article.content,
              style: contentTxt,
            ),
            SizedBox(height: 25.0)
          ],
        ),
      ),
    );
  }
}

class Status extends StatelessWidget {
  final IconData icon;
  final String total;

  Status({this.icon, this.total});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, color: Colors.grey),
        SizedBox(width: 4.0),
        Text(total, style: contentTxt),
      ],
    );
  }
}

postTime(time) {
  var date =
      "${time.year}-${time.month >= 10 ? time.month : '0' + time.month.toString()}-${time.day >= 10 ? time.day : '0' + time.day.toString()}";
  var clock = "${time.hour >= 10 ? time.hour : '0' + time.hour.toString()}:${time.minute >= 10 ? time.minute : '0' + time.minute.toString()}:${time.second >= 10 ? time.second : '0' + time.second.toString()}";
  return date + " " + clock;
}
