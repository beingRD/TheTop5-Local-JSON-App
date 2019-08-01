import 'package:flutter/material.dart';
import 'dart:convert';

void main() => runApp(
      MaterialApp(
        theme: ThemeData(
          primarySwatch: Colors.amber,
        ),
        home: HomePage(),
      ),
    );

class HomePage extends StatefulWidget {
  State createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  List data;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "THE TOP 5!",
            style: TextStyle(
              fontSize: 40.0,
              fontWeight: FontWeight.bold,
              fontStyle: FontStyle.italic,
              color: Colors.red,
              backgroundColor: Colors.amber,
            ),
          ),
        ),
        body: Container(
            color: Colors.amber,
            child: Center(
                child: FutureBuilder(
              future: DefaultAssetBundle.of(context)
                  .loadString('local_json/local_list.json'),
              builder: (context, snapshot) {
                var mydata = json.decode(snapshot.data.toString());

                return ListView.builder(
                  itemBuilder: (BuildContext context, int index) {
                    return Card(
                      margin: const EdgeInsets.all(18.0),
                      color: Colors.black87,
                      borderOnForeground: true,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            "Player:> " + mydata[index]["name"],
                            style: TextStyle(
                              fontSize: 24.0,
                              fontWeight: FontWeight.bold,
                              fontStyle: FontStyle.normal,
                              color: Colors.amber,
                              //backgroundColor: Colors.amber,
                            ),
                          ),
                          Text(
                            "Age:> " + mydata[index]["age"],
                            style: TextStyle(
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold,
                              fontStyle: FontStyle.normal,
                              color: Colors.amber,
                              //backgroundColor: Colors.amber,
                            ),
                          ),
                          Text(
                            "Jersey No:> " + mydata[index]["num"],
                            style: TextStyle(
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold,
                              fontStyle: FontStyle.normal,
                              color: Colors.amber,
                              //backgroundColor: Colors.amber,
                            ),
                          ),
                          Text(
                            "Rank:> " + mydata[index]["rank"],
                            style: TextStyle(
                              fontSize: 34.0,
                              fontWeight: FontWeight.bold,
                              fontStyle: FontStyle.normal,
                              color: Colors.red,
                              //backgroundColor: Colors.amber,
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                  itemCount: mydata == null ? 0 : mydata.length,
                );
              },
            ))));
  }
}
