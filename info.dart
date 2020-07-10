import 'package:flutter/material.dart';

class newsdetails extends StatefulWidget {
  String title;
  String imageurl;
  String url;
  String description;
  String author;
  String content;
  newsdetails({this.title, this.imageurl, this.url, this.description,this.author,this.content});

  @override
  _newsdetailsState createState() => _newsdetailsState();
}

class _newsdetailsState extends State<newsdetails> {
  @override
  Future<void> _launched;

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
         backgroundColor: Colors.red,
        title: Text("${widget.title}"),
        centerTitle: true,
      ),
      body:
      ListView(
        children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(top:8.0),
          child: Container(
          height: 300,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(

              image:
              DecorationImage(fit: BoxFit.cover,image: NetworkImage(widget.imageurl))
          ),
          ),
        ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
      Text("${widget.description}",style: TextStyle(
          fontSize: 20,

      ),),

      Text("- ${widget.author}",style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,

      ),),
      Text("FOR MORE INFO:- ",style: TextStyle(
        fontSize: 25,
        fontWeight: FontWeight.bold,
color: Colors.red
      ),),
    Text(widget.content)
    ],
    )





          ),
          FlatButton(
            color: Colors.red,
            onPressed: (){},
            child:  Text("${widget.url}",style: TextStyle(
              color: Colors.white
            ),),
          )
        ],
      ),
    );
  }


}
