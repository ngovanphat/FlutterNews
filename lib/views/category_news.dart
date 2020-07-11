import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_news/models/article_model.dart';
import 'package:flutter_news/helper/news.dart';
import 'package:flutter_news/Object/BlogTile.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class CategoryNews extends StatefulWidget {

  final String category;
  CategoryNews({this.category});

  @override
  _CategoryNewsState createState() => _CategoryNewsState();
}

class _CategoryNewsState extends State<CategoryNews> {

  List<ArticalModel> articles = new List<ArticalModel>();
  bool _loading=true;

  void initState(){
    super.initState();
    getCatNews();
  }

  getCatNews() async {
    CategoryNewsClass newsClass = CategoryNewsClass();
    await newsClass.getCatNews(widget.category);
    articles = newsClass.categoryNews;
    setState(() {
      _loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text("Flutter"),
            Text("News",
              style: TextStyle(
                  color: Colors.blue
              ),
            ),

          ],
        ),
        actions: <Widget>[
          Opacity(
          opacity: 0,
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Icon(Icons.save),
          ),
        ),
        ],
        elevation: 0.0,
      ),
      body: _loading ? Container(
        child: Center(
          child: Container(
              child: SpinKitFoldingCube(
                color: Colors.blue,
                size: 50.0,
              )
          ),
        ),
      ) :SingleChildScrollView(
         child: Container(
           padding: EdgeInsets.all(10),
          margin: EdgeInsets.symmetric(horizontal: 10,vertical: 5),
          child: Column(
            children: <Widget>[
              //Blog
              Container(
                padding: EdgeInsets.only(top:16),
                child: ListView.builder(
                  itemCount: articles.length,
                  shrinkWrap: true,
                  physics: ClampingScrollPhysics(),
                  itemBuilder: (context, index){
                    return BlogTile(
                      imageUrl: articles[index].urlToImage,
                      title: articles[index].title,
                      desc: articles[index].description,
                      url: articles[index].url,
                    );
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

