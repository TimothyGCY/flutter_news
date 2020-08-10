import 'package:flutter/material.dart';
import 'package:flutter_news/common/fetch_news.dart';
import 'package:flutter_news/widgets/news_tile.dart';
import '../news_content_view.dart';

class MsiaNews extends StatefulWidget {
  @override
  _MsiaNewsState createState() => _MsiaNewsState();
}

class _MsiaNewsState extends State<MsiaNews> {
  bool _isLoading = true;
  var msiaNews;

  void getMsiaNews() async {
    AllNews news = AllNews();
    await news.getNewsList("msia");
    msiaNews = news.news;
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
                              NewsReaderView(article: msiaNews[index]),
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