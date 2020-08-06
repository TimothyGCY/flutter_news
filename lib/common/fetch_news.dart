import 'package:http/http.dart' as http;
import 'package:flutter_news/models/article.dart';
import 'dart:convert';
import 'package:flutter_news/constants.dart';

class ViralNewsList {
  List<Article> viralNewsList = [];

  Future<void> getViralNews() async {
    String viralUrl = "https://newsapi.org/v2/top-headlines?sources=bbc-news&apiKey=$apiKey";
    var response = await http.get(viralUrl);
    var jsonData = jsonDecode(response.body);
    print("json data: $jsonData");

    if(jsonData['status'] == "ok"){
      jsonData["articles"].forEach((element){
        if(element['urlToImage'] != null && element['content'] != null){
          Article article = new Article(
              title: element['title'],
              content: element['content'],
              desc: element["description"],
              author: element['author'],
              source: element['source']['name'],
              img: element['urlToImage'],
              time: DateTime.parse(element['publishedAt']),
              url: element["url"],
              fav: false,
              seen: false
          );
          viralNewsList.add(article);
          print("viralNewsList: $viralNewsList");
        }
      });
    }
  }
}

class CovidNewsList {
  List<Article> covidNewsList = [];

  Future<void> getViralNews() async {
    final now = DateTime.now();
    final thisMonth = new DateTime(now.year, now.month, 1);
    String covidUrl = "https://newsapi.org/v2/top-headlines?q=COVID&from=$thisMonth&sortBy=publishedAt&apiKey=$apiKey";
    var response = await http.get(covidUrl);
    var jsonData = jsonDecode(response.body);
    print("json data: $jsonData");

    if(jsonData['status'] == "ok"){
      jsonData["articles"].forEach((element){
        if(element['urlToImage'] != null && element['content'] != null){
          Article article = new Article(
              title: element['title'],
              content: element['content'],
              desc: element['description'],
              author: element['author'],
              source: element['source']['name'],
              img: element['urlToImage'],
              time: DateTime.parse(element['publishedAt']),
              url: element["url"],
              fav: false,
              seen: false
          );
          covidNewsList.add(article);
          print("viralNewsList: $covidNewsList");
        }
      });
    }
  }
}

class GlobalNewsList {
  List<Article> news = [];
  String globalUrl = "https://newsapi.org/v2/everything?sources=bbc-news&apiKey=$apiKey";
}

class MsiaNewsList {
  List<Article> news = [];
  String msiaUrl = "https://newsapi.org/v2/top-headlines?country=my&apiKey=$apiKey";
}