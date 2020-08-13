import 'package:flutter/material.dart';
import 'package:flutter_news/views/news_content_view.dart';
import 'package:flutter_news/views/news_webview.dart';
import 'package:flutter_news/widgets/news_card.dart';
import 'package:flutter_news/widgets/news_tile.dart';
import 'package:flutter_news/constants.dart';

class ViralNews extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView(
        children: [
          Container(
              width: double.infinity,
              height: 300,
              padding: EdgeInsets.only(left: 10),
              child: ListView.builder(
                itemCount: covidNews.length,
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              ArticleWebView(postUrl: covidNews[index].url),
                        ),
                      );
                    },
                    child: Container(
                      margin: EdgeInsets.only(right: 12),
                      child: PrimaryCard(article: covidNews[index]),
                    ),
                  );
                },
              )),
//                ListView.builder(
//                  itemCount: newslist.length,
//                  scrollDirection: Axis.vertical,
//                  shrinkWrap: true,
//                  physics: ScrollPhysics(),
//                  itemBuilder: (context, index) {
//                    var recent = newslist[index];
//                    return InkWell(
//                      onTap: () {
//                        Navigator.push(
//                          context,
//                          MaterialPageRoute(
//                            builder: (context) => NewsReaderView(article: newslist[index]),
//                          ),
//                        );
//                      },
//                      child: Container(
//                        width: double.infinity,
//                        height: 135.0,
//                        margin: EdgeInsets.symmetric(horizontal: 18.0, vertical: 8.0),
//                        child: SecondaryCard(article: newslist[index]),
//                      ),
//                    );
//                  },
//                )
          Container(
            margin: EdgeInsets.only(top: 16),
            child: ListView.builder(
                itemCount: viralNews.length,
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
                              ArticleWebView(postUrl: viralNews[index].url),
                        ),
                      );
                    },
                    child: Container(
                      margin: EdgeInsets.only(right: 12),
                      child: NewsTile(
                        id: viralNews[index].id,
                        img: viralNews[index].img ?? "",
                        title: viralNews[index].title ?? "",
                        desc: viralNews[index].desc ?? "",
                        url: viralNews[index].url ?? "",
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
