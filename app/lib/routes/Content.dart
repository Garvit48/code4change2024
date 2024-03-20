import "package:http/http.dart" as http;
import "package:code4change/components/ContentTile.dart";
import "package:flutter/material.dart";
import "dart:convert";
// {
//    "id": String
//    "creator": String,
//    "profilePic": String,
//    "time": String,
//    "caption": String,
//    "thumbnailUri": String,
//    "imageUris": <String>[],
//    "textContent": "String"
//    
// }


class Content extends StatefulWidget {
  Map theme;
  Content({ super.key, required this.theme });
  State<Content> createState() => _ContentState();
}

class _ContentState extends State<Content> {

  _ContentState() {
    http.get(Uri.parse("http://localhost:8080/content")).then((value) {
        List data = jsonDecode(value.body).toList();
        setState(() { data.forEach((e) { content.add(e); }); });
      });
  }

  List<Map> content = [];

  List<ContentTile> _renderContent() {
    List<ContentTile> temp = [];
    content.forEach((element) {
      temp.add(
        ContentTile(theme: widget.theme, content: element)
      );
    });
    return temp;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(height: MediaQuery.of(context).size.height , width: MediaQuery.of(context).size.width, child: SingleChildScrollView(child: Column(children: _renderContent())))
    );
  }
}