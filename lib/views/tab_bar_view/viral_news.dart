import 'package:flutter/material.dart';
import 'package:flutter_news/common/fetch_news.dart';


import 'package:flutter_news/widgets/news_card.dart';class ViralNews extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      child: ListView(
        children: [
          Container(
            width: double.infinity,
            height: 300,
            padding: EdgeInsets.only(left: 10),
            child: ListView.builder(
              itemCount: viralnews.length,
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                var article = viralnews[index];
                return InkWell(
                  onTap: (){},
                  child: Container(
                    margin: EdgeInsets.only(right: 12),
                    child: PrimaryCard(article: article),
                  ),
                );
              },
            )
          )
        ],
      ),
    );
  }
}