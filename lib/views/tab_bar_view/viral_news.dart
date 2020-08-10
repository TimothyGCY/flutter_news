import 'package:flutter/material.dart';
import 'package:flutter_news/common/fetch_news.dart';
import 'package:flutter_news/views/news_content_view.dart';

//import 'package:flutter_news/common/fetch_news.dart';
//import 'package:flutter_news/models/article.dart';
import 'package:flutter_news/widgets/news_card.dart';
import 'package:flutter_news/widgets/news_tile.dart';
// import 'package:flutter_news/widgets/vertical_news_card_list.dart';

class ViralNews extends StatefulWidget {
  @override
  _ViralNewsState createState() => _ViralNewsState();
}

class _ViralNewsState extends State<ViralNews> {
  bool _isLoading = true;
  var covidlist;
  var newslist;

  void getViralNews() async {
    AllNews article = AllNews();
    await article.getNewsList("viral");
    newslist = article.news;
    AllNews covid = AllNews();
    await covid.getNewsList("covid");
    covidlist = covid.news;
    print("covidlist: $covidlist");
    setState(() {
      _isLoading = false;
    });
  }

  @override
  void initState() {
    _isLoading = true;
    super.initState();
    getViralNews();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: _isLoading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : ListView(
              children: [
                Container(
                    width: double.infinity,
                    height: 300,
                    padding: EdgeInsets.only(left: 10),
                    child: ListView.builder(
                      itemCount: this.covidlist.length,
                      scrollDirection: Axis.horizontal,
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => NewsReaderView(article: covidlist[index]),
                              ),
                            );
                          },
                          child: Container(
                            margin: EdgeInsets.only(right: 12),
                            child: PrimaryCard(article: covidlist[index]),
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
                     itemCount: newslist.length,
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
                                   NewsReaderView(article: newslist[index]),
                             ),
                           );
                         },
                         child: Container(
                            margin: EdgeInsets.only(right: 12),
                            child: NewsTile(
                              id: newslist[index].id,
                           img: newslist[index].img ?? "",
                           title: newslist[index].title ?? "",
                           desc: newslist[index].desc ?? "",
                           url: newslist[index].url ?? "",
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
