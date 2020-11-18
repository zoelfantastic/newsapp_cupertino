import 'package:newsapp_cuppertino/data/model/article.dart';
import 'package:newsapp_cuppertino/ui/article_web_view.dart';
import 'package:flutter/material.dart';

class ArticleDetailPage extends StatelessWidget {
  static const routeName = '/article_detail';

  final Article article;

  const ArticleDetailPage({@required this.article});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(article.title),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Image.network(article.urlToImage),
              Padding(
                padding: EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(article.description),
                    Divider(color: Colors.grey),
                    Text(
                      article.title,
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 24),
                    ),
                    Divider(color: Colors.grey),
                    Text('Date: ${article.publishedAt}'),
                    SizedBox(
                      height: 10,
                    ),
                    Text('Author: ${article.author}'),
                    Divider(color: Colors.grey),
                    Text(
                      article.content,
                      style: TextStyle(fontSize: 16),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    RaisedButton(
                        child: Text('Read Mode'),
                        onPressed: () {
                          Navigator.pushNamed(context, ArticleWebView.routeName,
                              arguments: article.url);
                        })
                  ],
                ),
              )
            ],
          ),
        ));
  }
}
