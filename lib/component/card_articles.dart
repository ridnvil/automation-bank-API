import 'package:automationdoc/model/articles.dart';
import 'package:flutter/material.dart';

class CardArticles extends StatefulWidget {
  final Articles articles;

  CardArticles({this.articles});

  @override
  _CardArticlesState createState() => _CardArticlesState();
}

class _CardArticlesState extends State<CardArticles>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;
  Articles articles;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this);
    articles = widget.articles;
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 10,
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(articles.title, style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold), overflow: TextOverflow.ellipsis),
            Text("Last updated ${articles.date}", style: TextStyle(fontSize: 12), overflow: TextOverflow.ellipsis,),
            SizedBox(height: 10,),
            Text(articles.article, style: TextStyle(fontSize: 15), overflow: TextOverflow.ellipsis),
          ],
        ),
      ),
    );
  }
}