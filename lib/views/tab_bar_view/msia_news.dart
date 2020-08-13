import 'package:flutter/material.dart';
import 'package:flutter_news/views/news_webview.dart';
import 'package:flutter_news/widgets/news_tile.dart';
import 'package:flutter_news/views/news_content_view.dart';
import 'package:flutter_news/constants.dart';

class MsiaNews extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView(
        children: [
          Container(
            margin: EdgeInsets.only(top: 16),
            child: ListView.builder(
                itemCount: msiaNews.length,
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
                              ArticleWebView(postUrl: msiaNews[index].url)
//                              NewsReaderView(article: msiaNews[index]),
                        ),
                      );
                    },
                    child: Container(
                      margin: EdgeInsets.only(right: 12),
                      child: NewsTile(
                        id: msiaNews[index].id,
                        img: msiaNews[index].img ?? "",
                        title: msiaNews[index].title ?? "",
                        desc: msiaNews[index].desc ?? "",
                        url: msiaNews[index].url ?? "",
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