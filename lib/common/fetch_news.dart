import 'package:http/http.dart' as http;
import 'package:flutter_news/models/article.dart';
import 'dart:convert';
import 'package:flutter_news/constants.dart';

class AllNews {
  List<Article> news = [];

  Future<void> getNewsList(category) async {
    var now = DateTime.now();
    var thisMonth = new DateTime(now.year, now.month, 1);
    String url;
    switch (category) {
      case "covid":
        url =
            "https://newsapi.org/v2/top-headlines?q=COVID&from=$thisMonth&sortBy=publishedAt&language=en&apiKey=$apiKey";
        break;
      case "viral":
        url =
            "https://newsapi.org/v2/top-headlines?sources=bbc-news&apiKey=$apiKey";
        break;
      case "msia":
        url = "https://newsapi.org/v2/top-headlines?country=my&apiKey=$apiKey";
        break;
      default:
        url =
            "https://newsapi.org/v2/everything?sources=bbc-news&language=en&apiKey=$apiKey";
        break;
    }
    var response = await http.get(url);
    var jsonData = jsonDecode(response.body);

    if (jsonData['status'] == "ok") {
      jsonData["articles"].forEach((element) {
        if (element['url'] != null &&
            element['urlToImage'] != null &&
            element['content'] != null &&
            element['publishedAt'] != null) {
          Article article = new Article(
              id: DateTime.now().toString(),
              title: element['title'],
              content: element['content'],
              desc: element['description'],
              author: (element['author'] == null ||
                      element['author'].toString().contains("https"))
                  ? "Anonymous"
                  : element['author'],
              source: element['source']['name'],
              img: element['urlToImage'],
              time: DateTime.parse(element['publishedAt']),
              url: element["url"],
              fav: false,
              seen: false);
          news.add(article);
        }
      });
    }
  }
}
