import 'package:flutter/material.dart';
import 'package:flutter_news/common/fetch_news.dart';
import 'package:flutter_news/widgets/news_tile.dart';
import '../news_content_view.dart';

class GlobalNews extends StatefulWidget {
  @override
  _GlobalNewsState createState() => _GlobalNewsState();
}

class _GlobalNewsState extends State<GlobalNews> {
  bool _isLoading = true;
  var globalNews;

  void getMsiaNews() async {
    AllNews news = AllNews();
    await news.getNewsList("global");
    globalNews = news.news;
    this.setState(() {
      _isLoading = false;
    });
  }

  @override
  void initState() {
    _isLoading = true;
    super.initState();
    getMsiaNews();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: _isLoading ? Center(
        child: CircularProgressIndicator(),
      ) : ListView(
        children: [
          Container(
            margin: EdgeInsets.only(top: 16),
            child: ListView.builder(
                itemCount: globalNews.length,
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
                              NewsReaderView(article: globalNews[index]),
                        ),
                      );
                    },
                    child: Container(
                      margin: EdgeInsets.only(right: 12),
                      child: NewsTile(
                        img: globalNews[index].img ?? "",
                        title: globalNews[index].title ?? "",
                        desc: globalNews[index].desc ?? "",
                        url: globalNews[index].url ?? "",
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