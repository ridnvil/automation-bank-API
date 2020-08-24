import 'package:automationdoc/component/banner_document.dart';
import 'package:automationdoc/component/card_articles.dart';
import 'package:automationdoc/model/articles.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Automation Bank Documentations',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: HomePage(title: 'Automation Bank Documentations'),
    );
  }
}


class HomePage extends StatefulWidget {
  final String title;
  HomePage({this.title});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;
  List<Articles> articles = [];
  List<Map<String, String>> data = [];
  int showindex = 0;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this);
    data = [{'title': 'Transfer', 'article': 'Transfer Documentation', 'date': '01-01-2020'}, {'title': 'Mutasi', 'article': 'Mutasi Documentation', 'date': '01-01-2020'}];
    data.forEach((element) {
      articles.add(Articles.fromJson(element));
    });
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  Widget showbanner(){
    return BannerDocument(banner: showindex,);
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.white,
        title: Text(widget.title, style: TextStyle(color: Colors.black, fontSize: 30),),
      ),
      body: SafeArea(
        child: ListView(
          children: [
            SizedBox(height: 20,),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: Container(
                width: MediaQuery.of(context).size.width / 2,
                height: MediaQuery.of(context).size.height <= 568 || MediaQuery.of(context).size.height <= 736 ? 
                        MediaQuery.of(context).size.height / 5: 
                        MediaQuery.of(context).size.height / 7,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: articles.map((article) {
                        return InkWell(
                          child: CardArticles(articles: article,),
                          onTap: (){
                            print(article);
                            setState(() {
                              showindex = articles.indexOf(article);
                            });
                          },
                        );
                      }).toList(),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 10,),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: Text("How to use! (Local Only)", style: TextStyle(fontSize: 30),),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: showbanner(),
            ),
          ],
        ),
      ),
    );
  }
}