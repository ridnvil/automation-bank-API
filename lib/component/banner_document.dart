import 'package:automationdoc/component/html_code.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'dart:js' as js;


class BannerDocument extends StatefulWidget {
  final int banner;

  const BannerDocument({Key key, this.banner}) : super(key: key);

  @override
  _BannerDocumentState createState() => _BannerDocumentState();
}

class _BannerDocumentState extends State<BannerDocument>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;
  int banner = 0;
  String fileDownload = "https://drive.google.com/file/d/13RsN0g4r3bttswdu7UEgdfIB_Xlrdr24/view?usp=sharing";

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this);
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  TextStyle textStyle(double fontsize, FontWeight fontWeight){
    return TextStyle(fontSize: fontsize, fontWeight: fontWeight);
  }

  Widget show(){
    if(widget.banner == 0){
      return Container(
        padding: EdgeInsets.only(right: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 5,),
            Html(
              data: MyHtmlCode().transfer(),
              // onLinkTap: (url){
              //   js.context.callMethod("open", ["http://192.168.1.52:9002/transfer/list"]);
              // },
            ),
            Image.asset("assets/img/transfer_response.jpeg")
          ],
        ),
      );
    }else if(widget.banner == 1){
      return Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 5,),
            Html(
              data: MyHtmlCode().mutasi(),
              // onLinkTap: (url){
              //   js.context.callMethod("open", [url]);
              // },
            ),
          ],
        ),
      );
    }else{
      return Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 5,),
            Html(
              data: MyHtmlCode().devices(),
              // onLinkTap: (url){
              //   js.context.callMethod("open", ["http://192.168.1.52:8081/check"]);
              // },
            ),
          ],
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 10,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: show(),
      ),
    );
  }
}