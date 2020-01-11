import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';

class JsonParsingSimpleState extends StatefulWidget {
  @override
  _JsonParsingSimpleStateState createState() => _JsonParsingSimpleStateState();
}

class _JsonParsingSimpleStateState extends State<JsonParsingSimpleState> {
  Future data;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    data = getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Parsing Json"),
      ),
      body: Center(
        child: Container(
          child: FutureBuilder(
            future: getData(),
            builder: (context, AsyncSnapshot snapsort) {
              if (snapsort.hasData) {
                return creatListView(snapsort.data, context);
              } else
                return CircularProgressIndicator();
            },
          ),
        ),
      ),
    );
  }

  Future getData() async {
    Future data;
    String url = "https://jsonplaceholder.typicode.com/posts";
    Network network = Network(url);
    data = network.fetchData();
//    data.then((value){
//    print(value[0]['title']);
//    });
    return data;
  }

  Widget creatListView(List data, BuildContext context) {
    return Container(
      child: ListView.builder(
          itemCount: data.length,
          itemBuilder: (context, int index) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Divider(
                  height: 5,
                ),
                ListTile(
                  title: Text("${data[index]["title"]}"),
                  subtitle: Text("${data[index]["body"]}"),
                  leading: Column(
                    children: <Widget>[
                      CircleAvatar(
                        backgroundColor: Colors.green,
                        radius: 23,
                        child: Text("${data[index]["id"]}"),
                      )
                    ],
                  ),
                )
              ],
            );
          }),
    );
  }
}

class Network {
  final String url;

  Network(this.url);

  Future fetchData() async {
    print("$url");
    Response response = await get(Uri.encodeFull(url));
    if (response.statusCode == 200) print(response.body);
    return json.decode(response.body);
    print(response.statusCode);
  }
}
