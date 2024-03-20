import "package:code4change/components/ContentTile.dart";
import "package:code4change/routes/Chat.dart";
import "package:code4change/routes/HomePage.dart";
import "package:flutter/material.dart";




void main() async {
  
  runApp(App());
}

Map theme = {
  "dark": {
    "primaryColor": Color.fromARGB(255, 28, 28, 28),
    "secondaryColor": Color.fromARGB(255, 255, 255, 255),
    "accentColor": Color.fromARGB(255, 255, 150, 232)
  }
};

String currTheme = "dark";

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: HomePage(theme: theme[currTheme]));
  }
}