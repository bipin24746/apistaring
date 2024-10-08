import 'dart:convert';

import 'package:apistaring/model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Sample> samplepost = [];
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: getData(),
        builder: (context, snapshop) {
          if (snapshop.hasData) {
            return ListView.builder(
              itemCount: samplepost.length,
              itemBuilder: (context, index) {
                return Container(
                  height: 150,
                  color: Colors.green,
                  padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                  margin: EdgeInsets.all(10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "user id: ${samplepost[index].userId}",
                        style: TextStyle(fontSize: 18),
                      ),
                      Text(
                        "id: ${samplepost[index].id}",
                        style: TextStyle(fontSize: 18),
                      ),
                      Text(
                        "title: ${samplepost[index].title}",
                        style: TextStyle(fontSize: 18),
                      ),
                      Text(
                        "body: ${samplepost[index].body}",
                        maxLines: 1,
                        style: TextStyle(fontSize: 18),
                      ),
                    ],
                  ),
                );
              },
            );
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        });
  }

  Future<List<Sample>> getData() async {
    final response =
        await http.get(Uri.parse('https://jsonplaceholder.typicode.com/posts'));
    var data = jsonDecode(response.body.toString());

    if (response.statusCode == 200) {
      for (Map<String, dynamic> index in data) {
        samplepost.add(Sample.fromJson(index));
      }
      return samplepost;
    } else {
      return samplepost;
    }
  }
}
