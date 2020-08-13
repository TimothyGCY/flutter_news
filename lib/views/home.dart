import 'package:flutter/material.dart';
import 'package:flutter_news/common/fetch_news.dart';
import 'package:flutter_news/views/tab_bar_view/global_news.dart';
import 'package:flutter_news/views/tab_bar_view/msia_news.dart';
import 'package:flutter_news/views/tab_bar_view/viral_news.dart';
import 'package:flutter_news/constants.dart';

class Home extends StatefulWidget {
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool _isLoading = true;

  void populateNews() async{
    for(int i = 0; i < newsCategory.length; i++){
      switch(newsCategory[i]){
        case "covid":
          AllNews covid = AllNews();
          await covid.getNewsList(newsCategory[i]);
          covidNews = covid.news;
          break;
        case "viral":
          AllNews viral = AllNews();
          await viral.getNewsList(newsCategory[i]);
          viralNews = viral.news;
          break;
        case "msia":
          AllNews msia = AllNews();
          await msia.getNewsList(newsCategory[i]);
          msiaNews = msia.news;
          break;
        default:
          AllNews glob = AllNews();
          await glob.getNewsList(newsCategory[i]);
          globNews = glob.news;
          break;
      }
//      allnews.add(news.news);
    }
    this.setState(() {
      _isLoading = false;
    });
  }

  @override
  void initState() {
    _isLoading = true;
    super.initState();
    populateNews();
  }

  @override
  Widget build(BuildContext context) {
    return _isLoading ? Center(
      child: CircularProgressIndicator(),
    ) : newsTab();
  }
}

//DefaultTabController newsTab() {
//  return DefaultTabController(
//    length: 3,
//    child: Scaffold(
//      appBar: AppBar(
//        backgroundColor: Colors.white,
//        bottom: TabBar(
//          unselectedLabelColor: Colors.grey[400],
//          labelColor: Colors.black,
//          indicatorSize: TabBarIndicatorSize.tab,
//          indicator: BoxDecoration(
//            color: Colors.white,
//          ),
//          tabs: [
//            Tab(
//                child: Align(
//                    alignment: Alignment.center,
//                    child: Text("Viral News")
//                )),
//            Tab(
//                child: Align(
//                    alignment: Alignment.center,
//                    child: Text("Global News")
//                )),
//            Tab(
//                child: Align(
//                    alignment: Alignment.center,
//                    child: Text("Malaysia News")
//                )),
//          ],
//        ),
//        title: Align(
//          alignment: Alignment.bottomLeft,
//          child: Text("Flutter News"),
//        ),
//        elevation: 0.0,
//      ),
//      body: TabBarView(
//        children: [
//          Align(
//            alignment: Alignment.center,
//            child: Text("Let's go VIRAL"),
//          ),
//          Align(
//            alignment: Alignment.center,
//            child: Text("Around the world 80 days"),
//          ),
//          Align(
//            alignment: Alignment.center,
//            child: Text("Malu apa BOSSKU"),
//          ),
//        ],
//      ),
//    ),
//  );
//}

DefaultTabController newsTab() {
  return DefaultTabController(
    length: 3, // might change to dynamic range
    child: Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(120),
        child: Column(
          children: [
            ListTile(
              title: Text(
                "Welcome",
                textAlign: TextAlign.end,
                style: inactiveTab,
              ),
              subtitle: Text(
                "Timothy Goh",
                textAlign: TextAlign.end,
                style: activeTab,
              ),
//            this part is to create profile picture / avatar that stick at top right
//            trailing: Container(
//              width: 50,
//              height: 50,
//              decoration: BoxDecoration(
//                borderRadius: BorderRadius.circular(10),
//                image: DecorationImage(
//                  image: AssetImage("someting here"),
//                  fit: BoxFit.cover,
//                ),
//              ),
//            ),
            ),
            Align(
              alignment: Alignment.topLeft,
              child: TabBar(
                  unselectedLabelStyle: inactiveTab,
                  labelStyle: activeTab.copyWith(fontSize: 24),
                  isScrollable: true,
                  tabs: [
                    Tab(
                        child: Align(
                            alignment: Alignment.center,
                            child: Text("Viral News"))),
                    Tab(
                        child: Align(
                            alignment: Alignment.center,
                            child: Text("Global News"))),
                    Tab(
                        child: Align(
                            alignment: Alignment.center,
                            child: Text("Malaysia News"))),
                  ]),
            )
          ],
        ),
      ),
      body: TabBarView(
        children: [
          ViralNews(),
          GlobalNews(),
          MsiaNews(),
        ],
      ),
    ),
  );
}
