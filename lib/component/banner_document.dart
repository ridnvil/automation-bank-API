import 'package:automationdoc/component/html_code.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';

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
        padding: EdgeInsets.only(right: 400),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 5,),
            Html(
              data: MyHtmlCode().transfer(),
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
              data: MyHtmlCode().mutasi(),
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