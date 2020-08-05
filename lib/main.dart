import 'package:flutter/material.dart';

void main() {
  runApp(FlutNews());
}

class FlutNews extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter News',
        theme: ThemeData(
          // This is the theme of your application.
          //
          // Try running your application with "flutter run". You'll see the
          // application has a blue toolbar. Then, without quitting the app, try
          // changing the primarySwatch below to Colors.green and then invoke
          // "hot reload" (press "r" in the console where you ran "flutter run",
          // or simply save your changes to "hot reload" in a Flutter IDE).
          // Notice that the counter didn't reset back to zero; the application
          // is not restarted.
            primaryColor: Colors.white,
            // This makes the visual density adapt to the platform that you run
            // the app on. For desktop platforms, the controls will be smaller and
            // closer together (more dense) than on mobile platforms.
            visualDensity: VisualDensity.adaptivePlatformDensity,
            accentColor: Colors.white,
            brightness: Brightness.light,
            scaffoldBackgroundColor: Colors.white,
        ),
        home: newsTab());
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
