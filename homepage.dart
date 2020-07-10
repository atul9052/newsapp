import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:newsapp/model/newsmodel.dart';
import 'package:newsapp/network/network.dart';

import 'info.dart';
class Weatherforcast extends StatefulWidget {
  @override
  _WeatherforcastState createState() => _WeatherforcastState();
}
class _WeatherforcastState extends State<Weatherforcast> {
  Future<newsmodel> forecastObject;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    forecastObject = getWeather();

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Todays Headlines ",style: TextStyle(
          fontSize: 34,
          fontWeight: FontWeight.bold
        ),),
        centerTitle: true,
        backgroundColor: Colors.red,
        actions: <Widget>[

        ],
      ),
      body: FutureBuilder<newsmodel>(
              future: forecastObject,

              builder:(BuildContext context,AsyncSnapshot<newsmodel> snapshot) {

                if(snapshot.hasData){
                  return ListView.builder(
                    shrinkWrap: true,
                          scrollDirection: Axis.vertical,
                          itemCount: snapshot.data.articles.length,
                          itemBuilder: (context, index) =>
                             newscard(snapshot,index),
                      );


                }else{
                  return Container(
                    child: Center(child: CircularProgressIndicator(),),
                  );
                }

              }),


      );

  }
  Widget Textfieldview(){
    return ListTile(

      leading: TextField(
        decoration: InputDecoration(
            hintText: "Enter city name",
            prefixIcon: Icon(Icons.search),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10)),
            contentPadding: EdgeInsets.all(8)
        ),
        onSubmitted: (value){
          setState(() {

            forecastObject= getWeather();
          });
        },
      ),


    );

  }

  Future<newsmodel> getWeather() => new Network().getnewsforecast();

 Widget newscard(AsyncSnapshot<newsmodel> snapshot,int i) {
    var newlist = snapshot.data.articles[i];

   return InkWell(
      onTap: () {
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => newsdetails(
                title: newlist.source.name,
                description: newlist.description,
                imageurl: newlist.urlToImage,
                url: newlist.url,
                author: newlist.author,
                content:newlist.content
              )));
    },
     child: Column(
       children: <Widget>[
     Padding(
       padding: const EdgeInsets.only(left:8.0,top: 8.0),
       child: Text("${newlist.title}",style: TextStyle(
         fontSize: 30,
         fontWeight: FontWeight.bold
       ),),
     ),
         Padding(
           padding: const EdgeInsets.only(top:20.0),
           child: Container(
             height: 300,
             width: MediaQuery.of(context).size.width,
             decoration: BoxDecoration(
   borderRadius: BorderRadius.circular(20),
                 image:
             DecorationImage(fit: BoxFit.cover,image: NetworkImage(newlist.urlToImage))
             ),
           ),
         ),
Padding(
  padding: const EdgeInsets.all(8.0),
  child:   Divider(),
)

       ],
     ),
   );






 }
}
