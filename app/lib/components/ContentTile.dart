import "package:flutter/material.dart";

class ContentTile extends StatefulWidget {
  Map theme;
  Map content;
  ContentTile( { super.key, required this.theme, required this.content } );
  State<ContentTile> createState() => _ContentTileState();
}

class _ContentTileState extends State<ContentTile> {
  bool liked = false;

  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[
      Row(children: <Widget>[
        Container(width: 40, height: 40, clipBehavior: Clip.antiAlias, decoration: BoxDecoration(shape: BoxShape.circle), child: Image.network(widget.content["profilePic"], fit: BoxFit.cover,), ),
        Text(widget.content["creator"], style: TextStyle(color: widget.theme["secondaryColor"], fontWeight: FontWeight.bold)),
        Text(" "),
        Text(widget.content["time"], style: TextStyle(color: widget.theme["subtextColor"], fontWeight: FontWeight.bold, fontSize: 10))
      ],),
      Row(children: <Widget>[
        Text(widget.content["caption"])
      ]),
      Row(children: <Widget>[
        Image(image: NetworkImage(widget.content["thumbnailUri"]), width: MediaQuery.of(context).size.width)
      ],),
      Row(children: <Widget>[
        IconButton(onPressed: () {setState(() {liked = !liked;});}, icon: Icon(liked ? Icons.favorite : Icons.favorite_border, color: liked ? Colors.pink : Colors.grey,)),
        IconButton(onPressed: () {setState(() {liked = !liked;});}, icon: Icon(Icons.chat_outlined)),
        IconButton(onPressed: () {setState(() {liked = !liked;});}, icon: Icon(Icons.share)),
        IconButton(onPressed: () {setState(() {liked = !liked;});}, icon: Icon(Icons.bookmark)),
      ],)
    ]);
  }
}