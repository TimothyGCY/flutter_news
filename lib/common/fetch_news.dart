import 'package:http/http.dart' as http;
import 'package:flutter_news/models/article.dart';
import 'dart:convert';
import 'package:flutter_news/constants.dart';

List<Article> viralnews = [];

class ViralNewsList {
  Future<void> getViralNews() async {
    String viralUrl = "https://newsapi.org/v2/top-headlines?sources=bbc-news&apiKey=${apiKey}";

    var response = await http.get(viralUrl);
    var jsonData = jsonDecode(response.body);

    if(jsonData['status'] == "ok"){
      jsonData["articles"].forEach((element){

        if(element['urlToImage'] != null && element['content'] != null){
          Article article = Article(
            title: element['title'],
            content: element['description'],
            author: element['author'],
            source: element['name'],
            img: element['urlToImage'],
            time: DateTime.parse(element['publishedAt']),
            url: element["url"],
            fav: "false",
            seen: "false"
          );
          viralnews.add(article);
        }
      });
    }
  }
}

class GlobalNewsList {
  List<Article> news = [];
  String globalUrl = "https://newsapi.org/v2/everything?sources=bbc-news&apiKey=${apiKey}";
}

class MsiaNewsList {
  List<Article> news = [];
  String msiaUrl = "https://newsapi.org/v2/top-headlines?country=my&apiKey=${apiKey}";
}