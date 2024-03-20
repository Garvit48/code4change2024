import 'package:code4change/main.dart';
import 'package:code4change/routes/Chat.dart';
import 'package:code4change/routes/ChatPage.dart';
import 'package:code4change/routes/Content.dart';
import 'package:flutter/material.dart';


Map themeTemp = {
  "dark": {
    "primaryColor": Color.fromARGB(255, 255, 255, 255),
    "secondaryColor": Color.fromARGB(255, 28, 28, 28),
    "accentColor": Color.fromARGB(255, 239, 66, 111),
    "gradientColor": Color.fromARGB(255, 254, 194, 206),
    "subtextColor": Color.fromARGB(255, 136, 136, 136)
  }
};

class HomePage extends StatefulWidget {
  Map theme;
    HomePage({  super.key, required this.theme });
    State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selIndex = 0;
  Widget currWidget = Content(theme: themeTemp["dark"],);



  void _switchHandler(int index) {
    setState(() { 
      _selIndex = index;
      switch (index) {
        case 0:
          currWidget = Content(theme: themeTemp["dark"]);
          break;
          
        case 2:
          currWidget = ChatPage(theme: themeTemp["dark"]);
          break;

        default:
          print(index);
      }
  });
}




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: this.widget.theme["primaryColor"],
      body: Container(height: MediaQuery.of(context).size.height, child: currWidget),
      bottomNavigationBar: BottomNavigationBar(items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home", backgroundColor: this.widget.theme["primaryColor"]),
        BottomNavigationBarItem(icon: Icon(Icons.diversity_1), label: "Doctors", backgroundColor: this.widget.theme["primaryColor"] ),
        BottomNavigationBarItem(icon: Icon(Icons.chat), label: "Chat", backgroundColor: this.widget.theme["primaryColor"]),
        BottomNavigationBarItem(icon: Icon(Icons.spa), label: "Well-Being", backgroundColor: this.widget.theme["primaryColor"]),
        BottomNavigationBarItem(icon: Icon(Icons.task_alt), label: "Personal Profile", backgroundColor: this.widget.theme["primaryColor"])
      ], backgroundColor: this.widget.theme["primaryColor"], onTap: _switchHandler, currentIndex: _selIndex, selectedItemColor: this.widget.theme["accentColor"],),
    );
  }
}