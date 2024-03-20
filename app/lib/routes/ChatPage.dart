import "package:code4change/components/CustomAppbar.dart";
import "package:flutter/material.dart";
import "Chat.dart";
class ChatPage extends StatelessWidget {
  Map theme;
  ChatPage({ required this.theme });
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: <Widget>[Container(width: MediaQuery.of(context).size.width, height: MediaQuery.of(context).size.height, decoration: BoxDecoration(gradient: LinearGradient(begin: Alignment.topCenter, end: Alignment.bottomCenter, colors: <Color>[theme["gradientColor"], theme["primaryColor"]])),), Column(children: <Widget>[
        CustomAppbar(),
        OutlinedButton(onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) => Chat(theme: theme)));
        }, child: Text("Chat", textAlign: TextAlign.center,), style: ButtonStyle(backgroundColor: theme["color"]))
      ]) ])
    );
  }
}