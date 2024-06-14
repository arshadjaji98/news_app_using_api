import 'dart:convert';

import 'package:api_new_app/Models/new_model.dart';
import 'package:http/http.dart' as http;

class NewsApi {
  List<Articles> dataStore = [];
  Future<void> getNews() async {
    Uri url = Uri.parse(
        "https://newsapi.org/v2/top-headlines?country=us&category=business&apiKey=ea8703b1f4034f658f3ac540d86fb686");
    var response = await http.get(url);
    var jsonData = jsonDecode(response.body);
    if (jsonData["status"] == 'ok') {
      jsonData["articles"].forEach((element) {
        if (element['urlToImage'] != null &&
            element['description'] != null &&
            element['author'] != null &&
            element['content'] != null) {
          Articles newsModel = Articles(
            title: element['title'],
            urlToImage: element['urlToImage'],
            description: element['description'],
            author: element['author'],
            content: element['content'],
          );
          dataStore.add(newsModel);
        }
      });
    } else {}
  }
}
class CategoryNews {
  List<Articles> dataStore = [];
  Future<void> getNews(String category) async {
    Uri url = Uri.parse(
        "https://newsapi.org/v2/top-headlines?country=us&category=$category&apiKey=ea8703b1f4034f658f3ac540d86fb686");
    var response = await http.get(url);
    var jsonData = jsonDecode(response.body);
    if (jsonData["status"] == 'ok') {
      jsonData["articles"].forEach((element) {
        if (element['urlToImage'] != null &&
            element['description'] != null &&
            element['author'] != null &&
            element['content'] != null) {
          Articles newsModel = Articles(
            title: element['title'],
            urlToImage: element['urlToImage'],
            description: element['description'],
            author: element['author'],
            content: element['content'],
          );
          dataStore.add(newsModel);
        }
      });
    } else {}
  }
}
