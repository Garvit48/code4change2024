import "dart:convert";
import "dart:io";
import "package:flutter/material.dart";
import "package:http/http.dart" as http;
import "package:chat_bubbles/chat_bubbles.dart";

class Chat extends StatefulWidget {
  Map theme;
  Chat( { super.key, required this.theme } );
  State<Chat> createState() => _ChatState();
}

class _ChatState extends State<Chat> {
  List<Map<String, dynamic>> texts = [{"text": "Hello HelloHelloHelloHelloHelloHelloHelloHelloHelloHelloHelloHelloHelloHelloHelloHelloHelloHelloHelloHelloHelloHelloHelloHelloHelloHelloHelloHelloHelloHelloHelloHelloHelloHelloHelloHelloHelloHelloHelloHelloHelloHelloHelloHelloHelloHelloHelloHelloHelloHelloHelloHelloHelloHelloHelloHelloHelloHelloHelloHelloHelloHelloHelloHelloHelloHelloHelloHelloHelloHelloHelloHelloHelloHelloHelloHelloHelloHelloHelloHelloHelloHelloHelloHelloHelloHelloHelloHelloHelloHelloHelloHelloHelloHelloHelloHelloHelloHelloHelloHelloHelloHelloHelloHelloHelloHelloHelloHelloHelloHelloHelloHelloHelloHelloHelloHelloHelloHelloHelloHelloHelloHelloHelloHelloHelloHelloHelloHelloHelloHelloHelloHelloHelloHelloHelloHelloHelloHelloHelloHelloHelloHelloHelloHelloHelloHelloHelloHelloHelloHelloHelloHelloHelloHelloHelloHelloHelloHelloHelloHelloHelloHelloHelloHelloHelloHelloHelloHelloHello", "isSender": false},{"text": "Hello", "isSender": false},{"text": "Hello", "isSender": false},{"text": "Hello", "isSender": true},{"text": "Hello", "isSender": false},{"text": "Hello", "isSender": true},{"text": "Hello", "isSender": false},{"text": "Hello", "isSender": false},{"text": "Hello", "isSender": false},{"text": "Hello", "isSender": true},{"text": "Hello", "isSender": false},{"text": "Hello", "isSender": false},{"text": "Hello", "isSender": true},{"text": "Hello", "isSender": false},{"text": "Hello", "isSender": false},{"text": "Hello", "isSender": false},{"text": "Hello", "isSender": false},{"text": "Hello", "isSender": false},{"text": "Hello", "isSender": true},{"text": "Hello", "isSender": false},{"text": "Hello", "isSender": true},{"text": "Hello", "isSender": false},{"text": "Hello", "isSender": false},];

  final TextEditingController _controller = TextEditingController();
  Future<String> getResponse(String text) async {
   
    http.Response res = await http.post(Uri.parse("http://localhost:8080/chat"), body: jsonEncode({
      "apiKey": "SOME_KEY",
      "text": text
    }));

    setState(() {texts.add(
      {
        "text": res.body,
        "isSender": false
      });});
    return "test";

  }

  List<BubbleSpecialThree> renderMessages() {

    List<BubbleSpecialThree> temp = [];

    for (int i = 0; i < texts.length; i++) {
      temp.add(BubbleSpecialThree(text: texts[i]["text"], color: texts[i]["isSender"] ? Color.fromARGB(255, 231, 231, 231) : widget.theme["accentColor"], isSender: texts[i]["isSender"]));
    }

    return temp;
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: <Widget>[


        Container(decoration: const BoxDecoration(gradient: LinearGradient(begin: Alignment.topCenter, end: Alignment.bottomCenter, colors: <Color>[Color.fromARGB(255, 254, 194, 206), Color.fromARGB(255, 255, 255, 255)])),height: MediaQuery.of(context).size.height, width: MediaQuery.of(context).size.width,), 
        

        Column(children: <Widget>[
          Row(children: <Widget>[
            IconButton(onPressed: () {
              Navigator.of(context).pop();
            }, icon: Icon(Icons.arrow_back_ios, size: 20),)
          ]),
        Container(height: MediaQuery.of(context).size.height - 160, width: MediaQuery.of(context).size.width,
      child: SingleChildScrollView(
        child: Column(children:  (texts.isNotEmpty) ? renderMessages() : <Widget>[])
        ), 

      ), Column(children: <Widget>[
        TextField(controller: _controller),
        OutlinedButton(onPressed: () {
          
          getResponse(_controller.text);
              setState(() {texts.add(
      {
        "text": _controller.text,
        "isSender": true
      });});
        }, child: const Text("Send"))
      ])])])
    );
  }
}