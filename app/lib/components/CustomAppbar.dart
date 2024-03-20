import "package:flutter/material.dart";

class CustomAppbar extends StatelessWidget {
  TextEditingController searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Row(children: <Widget>[
      
      Container(margin: EdgeInsets.only(top: 25, left: 30), width: 40, height: 40, clipBehavior: Clip.antiAlias, decoration: BoxDecoration(shape: BoxShape.circle), child: Image.network("http://localhost:5050/images/a.jpg", fit: BoxFit.cover),),
      
      Container(margin: EdgeInsets.only(left: 40), width: MediaQuery.of(context).size.width - 160, height: 30, decoration: BoxDecoration(borderRadius: BorderRadius.circular(10.0)), 
      
      child: TextField(textAlign: TextAlign.center, textAlignVertical: TextAlignVertical.center,controller: searchController, decoration: InputDecoration(filled: true, enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(16.0), borderSide: BorderSide(color: Colors.black)), focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(16.0), borderSide: BorderSide(color: Colors.black)), hintText: "Search", fillColor: Colors.white)))]);
  }
}