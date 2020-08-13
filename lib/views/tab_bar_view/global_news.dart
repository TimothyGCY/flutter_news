import 'package:flutter/material.dart';
import 'package:flutter_news/widgets/news_tile.dart';
import 'package:flutter_news/views/news_content_view.dart';
import 'package:flutter_news/constants.dart';
import 'package:flutter_news/views/news_webview.dart';

class GlobalNews extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView(
        children: [
          Container(
            margin: EdgeInsets.only(top: 16),
            child: ListView.builder(
                itemCount: globNews.length,
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                physics: ClampingScrollPhysics(),
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              ArticleWebView(postUrl: globNews[index].url,),
                        ),
                      );
                    },
                    child: Container(
                      margin: EdgeInsets.only(right: 12),
                      child: NewsTile(
                        id: globNews[index].id,
                        img: globNews[index].img ?? "",
                        title: globNews[index].title ?? "",
                        desc: globNews[index].desc ?? "",
                        url: globNews[index].url ?? "",
                      ),
                    ),
                  );
                }),
          ),
        ],
      ),
    );
  }
}