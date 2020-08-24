import 'package:flutter/material.dart';

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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("This API for Bank", style: textStyle(20, null),),
            
          ],
        ),
      );
    }else{
      return Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Mutasi"),
          ],
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: show(),
      ),
    );
  }
}