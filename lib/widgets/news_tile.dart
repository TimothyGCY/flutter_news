import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_news/views/news_webview.dart';

class NewsTile extends StatelessWidget {
  final String img, title, content, desc, url, id;

  NewsTile({this.img, this.content, this.desc, this.title, this.url, @required this.id});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      // onTap: (){
      //   Navigator.push(context, MaterialPageRoute(
      //       builder: (context) => ArticleWebView(
      //         postUrl: url,
      //       )
      //   ));
      // },
      child: Container(
          margin: EdgeInsets.only(bottom: 24),
          width: MediaQuery.of(context).size.width,
          child: Container(
            child: Container(
              padding: EdgeInsets.only(left: 12, top: 12),
              alignment: Alignment.bottomCenter,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(bottomRight: Radius.circular(6),bottomLeft:  Radius.circular(6))
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Hero(tag: id, child: Image.network(
                    img,
                    height: 200,
                    width: MediaQuery.of(context).size.width,
                    fit: BoxFit.cover,
                  )),
                  SizedBox(height: 12,),
                  Text(
                    title,
                    maxLines: 2,
                    style: TextStyle(
                        color: Colors.black87,
                        fontSize: 20,
                        fontWeight: FontWeight.w500),
                  ),
                  SizedBox(
                    height: 4,
                  ),
                  Text(
                    desc,
                    maxLines: 2,
                    style: TextStyle(color: Colors.black54, fontSize: 14),
                  )
                ],
              ),
            ),
          )),
    );
  }
}