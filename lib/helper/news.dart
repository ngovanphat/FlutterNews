import 'dart:convert';

import 'package:flutter_news/models/article_model.dart';
import 'package:http/http.dart';
class News{

  List<ArticalModel> news = [];

  Future<void> getNews() async {
    String url = "http://newsapi.org/v2/top-headlines?country=us&category=business&apiKey=fe217340699544bf88da6d5fd93b71c3";

    Response response = await get(url);

    Map data = jsonDecode(response.body);

    if(data['status'] == "ok") {
      data["articles"].forEach((elememt){
        if(elememt["urlToImage"] !=null && elememt['description'] != null) {
          ArticalModel articalModel = new ArticalModel(
            title: elememt['title'],
            author: elememt['author'],
            description: elememt['description'],
            url: elememt['url'],
            urlToImage: elememt['urlToImage'],
            content: elememt['content'],
          );
          news.add(articalModel);
        }
      });
    }
  }

}

class CategoryNewsClass{

  List<ArticalModel> categoryNews = [];

  Future<void> getCatNews(String category) async {
    String url = "http://newsapi.org/v2/top-headlines?country=us&category=$category&apiKey=fe217340699544bf88da6d5fd93b71c3";

    Response response = await get(url);

    Map data = jsonDecode(response.body);

    if(data['status'] == "ok") {
      data["articles"].forEach((elememt){
        if(elememt["urlToImage"] !=null && elememt['description'] != null) {
          ArticalModel articalModel = new ArticalModel(
            title: elememt['title'],
            author: elememt['author'],
            description: elememt['description'],
            url: elememt['url'],
            urlToImage: elememt['urlToImage'],
            content: elememt['content'],
          );
          categoryNews.add(articalModel);
        }
      });
    }
  }

}