import 'dart:ui';

import 'package:automationdoc/component/banner_document.dart';
import 'package:automationdoc/component/card_articles.dart';
import 'package:automationdoc/model/articles.dart';
import 'package:flutter/material.dart';
import 'dart:js' as js;

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
    data = [
      {'title': 'Transfer', 'article': 'Transfer Documentation', 'date': DateTime.now().toString()}, 
      {'title': 'Mutasi', 'article': 'Mutasi Documentation', 'date': DateTime.now().toString()}, 
      {'title': 'Devices', 'article': 'Devices Monitoring', 'date': DateTime.now().toString()}
    ];

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
        title: Text(widget.title, style: TextStyle(color: Colors.black, fontSize: MediaQuery.of(context).size.width <= 500 ? 15:30),),
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
                    SizedBox(height: 10,),
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
              child: Text("How to use!", style: TextStyle(fontSize: 30),),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20.0, right: 20.0),
              child: Card(
                elevation: 10,
                child: Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 20.0),
                        child: Row(
                          children: [
                            Text("To Access all the API please use OpenVPN, and please download OpenVPN config file:", style: TextStyle(fontSize: 15),),
                            FlatButton(
                              child: Text("Download Here!", style: TextStyle(fontSize: 15, color: Colors.blue),),
                              onPressed: (){
                                js.context.callMethod("open", ["https://drive.google.com/file/d/13RsN0g4r3bttswdu7UEgdfIB_Xlrdr24/view?usp=sharing"]);
                              },
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 20.0),
                        child: Text("To login on VPN the auth.txt already inside on zip file"),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 20.0),
                        child: Row(
                          children: [
                            Text("For Windows User Documentation: "),
                            FlatButton(
                              child: Text("Read Here!", style: TextStyle(color: Colors.blue)),
                              onPressed: (){
                                js.context.callMethod("open", ["https://openvpn.net/vpn-server-resources/connecting-to-access-server-with-windows/#OpenVPN_Connect_v2"]);
                              },
                            ),
                            Text("For Download VPN Client Program: "),
                            FlatButton(
                              child: Text("Download Here!", style: TextStyle(color: Colors.blue)),
                              onPressed: () {
                                js.context.callMethod("open", ["https://swupdate.openvpn.org/community/releases/openvpn-install-2.4.9-I601-Win10.exe"]);
                              },
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 20.0),
                        child: Row(
                          children: [
                            Text("For Mac User Documentation: "),
                            FlatButton(
                              child: Text("Read Here!", style: TextStyle(color: Colors.blue)),
                              onPressed: (){
                                js.context.callMethod("open", ["https://openvpn.net/vpn-server-resources/connecting-to-access-server-with-macos/"]);
                              },
                            ),
                            Text("Dowload VPN CLient Program: "),
                            FlatButton(
                              child: Text("Download Here!", style: TextStyle(color: Colors.blue)),
                              onPressed: (){
                                js.context.callMethod("open", ["https://openvpn.net/downloads/openvpn-connect-v3-macos.dmg"]);
                              },
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 20.0),
                        child: Row(
                          children: [
                            Text("For Linux User Documentation: "),
                            FlatButton(
                              child: Text("Read Here!", style: TextStyle(color: Colors.blue)),
                              onPressed: (){
                                js.context.callMethod("open", ["https://openvpn.net/vpn-server-resources/connecting-to-access-server-with-linux/"]);
                              },
                            ),
                            Text("Dowload VPN CLient Program: "),
                            FlatButton(
                              child: Text("Download Here!", style: TextStyle(color: Colors.blue)),
                              onPressed: (){
                                js.context.callMethod("open", ["https://openvpn.net/openvpn-client-for-linux/"]);
                              },
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 20.0),
                        child: Row(
                          children: [
                            Text("Use Insomnia API Client to test the API, Documentation: "),
                            FlatButton(
                              child: Text("Read Here!", style: TextStyle(color: Colors.blue)),
                              onPressed: (){
                                js.context.callMethod("open", ["https://support.insomnia.rest/article/11-getting-started"]);
                              },
                            ),
                            Text("Dowload API CLient Program: "),
                            FlatButton(
                              child: Text("Download for Windows!", style: TextStyle(color: Colors.blue)),
                              onPressed: (){
                                js.context.callMethod("open", ["https://updates.insomnia.rest/downloads/windows/latest?ref=https%3A%2F%2Fwww.google.com%2F&app=com.insomnia.app"]);
                              },
                            ),
                            FlatButton(
                              child: Text("Download for Linux!", style: TextStyle(color: Colors.blue)),
                              onPressed: (){
                                js.context.callMethod("open", ["https://updates.insomnia.rest/downloads/ubuntu/latest?ref=https%3A%2F%2Fwww.google.com%2F&app=com.insomnia.app"]);
                              },
                            ),
                            FlatButton(
                              child: Text("Download for Mac!", style: TextStyle(color: Colors.blue)),
                              onPressed: (){
                                js.context.callMethod("open", ["https://updates.insomnia.rest/downloads/mac/latest?ref=https%3A%2F%2Fwww.google.com%2F&app=com.insomnia.app"]);
                              },
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 10,)
                    ],
                  )
                ),
              ),
            ),
            SizedBox(height: 5,),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: showbanner(),
            ),
            SizedBox(height: 10,),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  Text("AZ Dev 2020")
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}