import 'dart:convert';

import 'package:news_app_api/models/article_model.dart';
import 'package:http/http.dart' as http;

class News {

  List<ArticleModel> news = []; //Stores data from the API

  Future<void> getNews() async{
    String url = 
      "https://newsapi.org/v2/top-headlines?sources=techcrunch&apiKey=9b87f5388ccd4977b50c012ec4478488";

    var response = await http.get(Uri.parse(url));

    var jsonData = jsonDecode(response.body);

    if(jsonData['status'] == 'ok'){
      jsonData['articles'].forEach((element){
        //Do not get all news where image/description is not available
        if(element['urlToImage'] != null && element['description'] != null){
          ArticleModel articleModel = ArticleModel(
            urlToImage: element["urlToImage"],
            description: element["description"],
            title: element['title'],
            url: element['url'],
            content: element['content'],
            author: element['author'],
          );
          news.add(articleModel);
        }
      });
    }
  }


}