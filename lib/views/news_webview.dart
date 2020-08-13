import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:flutter_news/widgets/circle_button.dart';

class ArticleWebView extends StatefulWidget {
  final String postUrl;
  ArticleWebView({@required this.postUrl});

  @override
  _ArticleViewState createState() => _ArticleViewState();
}

class _ArticleViewState extends State<ArticleWebView> {
   InAppWebViewController webView;

   @override
   Widget build(BuildContext context) {
     return Scaffold(
       appBar: PreferredSize(
         preferredSize: Size.fromHeight(65.0),
         child: Center(
           child: SafeArea(
             child: Padding(
               padding: EdgeInsets.fromLTRB(18.0, 6.0, 18.0, 6.0),
               child: Row(
                 children: [
                   CircleButton(
                     icon: Icons.arrow_back_ios,
                     onTap: () => Navigator.pop(context),
                   ),
                   Spacer(),
                   CircleButton(
                     icon: Icons.share,
                     onTap: () {},
                   ),
                   CircleButton(
                     icon: Icons.favorite_border,
                     onTap: () {},
                   ),
                 ],
               ),
             ),
           ),
         ),
       ),
       body: Container(
         height: MediaQuery.of(context).size.height,
         width: MediaQuery.of(context).size.width,
         child: InAppWebView(
           initialUrl:  widget.postUrl,
           initialHeaders: {},
           onWebViewCreated: (InAppWebViewController webViewController){
             webView = webViewController;
           },
           onLoadStart: (InAppWebViewController controller, String url){},
           onLoadStop: (InAppWebViewController controller, String url){},
         ),
       ),
     );
   }
}
