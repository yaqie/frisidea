import 'package:flutter/material.dart';
// import 'package:news/colors.dart';
// import 'package:news/pages/tab_berita/classDetail.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
import 'package:job/pages/profile.dart';

class Detail extends StatefulWidget {
  final DetailUrl value;
  Detail({Key key, this.value}) : super(key: key);
  @override
  _DetailState createState() => _DetailState();
}

class _DetailState extends State<Detail> {
  // String url;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // geturl();
  }

  // geturl() {
  //   setState(() {
  //     url = widget.value.url;
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: new WebviewScaffold(
        url: widget.value.url,
        appBar: new AppBar(
          centerTitle: false,
          // iconTheme: IconThemeData(
          //   color: PrimaryColor, //change your color here
          // ),
          // backgroundColor: Color,
          title: Text(
            widget.value.url,
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
    // return new MaterialApp(
    //   routes: {
    //     "/": (_) => new WebviewScaffold(
    //           url: "https://www.google.com",
    //           appBar: new AppBar(
    //             title: new Text("Widget webview"),
    //           ),
    //         ),
    //   },
    // );
  }
}
