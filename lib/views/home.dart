import 'package:flutter/material.dart';

class Home extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return newsTab();
  }
}

DefaultTabController newsTab() {
  return DefaultTabController(
    length: 3,
    child: Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        bottom: TabBar(
          unselectedLabelColor: Colors.grey[400],
          labelColor: Colors.black,
          indicatorSize: TabBarIndicatorSize.tab,
          indicator: BoxDecoration(
            color: Colors.white,
          ),
          tabs: [
            Tab(
                child: Align(
                    alignment: Alignment.center,
                    child: Text("Viral News")
                )),
            Tab(
                child: Align(
                    alignment: Alignment.center,
                    child: Text("Global News")
                )),
            Tab(
                child: Align(
                    alignment: Alignment.center,
                    child: Text("Malaysia News")
                )),
          ],
        ),
        title: Align(
          alignment: Alignment.bottomLeft,
          child: Text("Flutter News"),
        ),
        elevation: 0.0,
      ),
      body: TabBarView(
        children: [
          Align(
            alignment: Alignment.center,
            child: Text("Let's go VIRAL"),
          ),
          Align(
            alignment: Alignment.center,
            child: Text("Around the world 80 days"),
          ),
          Align(
            alignment: Alignment.center,
            child: Text("Malu apa BOSSKU"),
          ),
        ],
      ),
    ),
  );
}