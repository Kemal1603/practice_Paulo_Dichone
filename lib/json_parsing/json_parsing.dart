import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class JsonParsingSimple extends StatefulWidget {
  @override
  _JsonParserState createState() => _JsonParserState();
}

class _JsonParserState extends State<JsonParsingSimple> {
  Future data;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    data = Network('https://jsonplaceholder.typicode.com/todos').fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Json Parse page'),
        centerTitle: true,
      ),
      body: Center(
        child: Container(
          child: FutureBuilder(
            future: Network('https://jsonplaceholder.typicode.com/todos').fetchData(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return Text(snapshot.data[0]['title']);
                }
                return CircularProgressIndicator();
              }),
        ),
      ),
    );
  }
}

class Network {
  final String url;

  Network(this.url);

  Future fetchData() async {
    print('$url');
    http.Response response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      print(response.body);
      return json.decode(response.body);
    } else {
      print(response.body);
      return ('adsf');
    }
  }
}
