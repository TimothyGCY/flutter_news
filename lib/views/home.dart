import 'package:flutter/material.dart';
import 'package:flutter_news/views/tab_bar_view/global_news.dart';
import 'package:flutter_news/views/tab_bar_view/msia_news.dart';
import 'package:flutter_news/views/tab_bar_view/viral_news.dart';

import '../constants.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return newsTab();
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
