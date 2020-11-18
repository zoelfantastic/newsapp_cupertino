import 'package:newsapp_cuppertino/ui/home_page.dart';
import 'package:newsapp_cuppertino/ui/detail_page.dart';
import 'package:newsapp_cuppertino/ui/article_web.dart';
import 'package:newsapp_cuppertino/styles.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            primaryColor: primaryColor,
            accentColor: secondaryColor,
            scaffoldBackgroundColor: Colors.white,
            textTheme: myTextTheme,
            appBarTheme: AppBarTheme(
                textTheme: myTextTheme.apply(bodyColor: Colors.black))),
        initialRoute: HomePage.routeName,
        routes: {
          HomePage.routeName: (context) => HomePage(),
          ArticleDetailPage.routeName: (context) => ArticleDetailPage(
              article: ModalRoute.of(context).settings.arguments),
          ArticleWebView.routeName: (context) =>
              ArticleWebView(url: ModalRoute.of(context).settings.arguments),
        });
  }
}
