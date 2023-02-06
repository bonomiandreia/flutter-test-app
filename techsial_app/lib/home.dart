import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class HomeNews extends StatefulWidget {
  @override
  State<HomeNews> createState() => _HomeState();
}

class _HomeState extends State<HomeNews> {
  Map listOfArrays = {};
  var listArticles = [];

  @override
  void initState() {
    super.initState();
    _getDataListNews();
  }

  void _getDataListNews() async {
    final response = await http.get(Uri.parse(
        'https://newsapi.org/v2/top-headlines?country=us&category=health&apiKey=a275424604ae48368a0cb5a90f2bdeb7'));
    if (response.statusCode == 200) {
      setState(() {
        listOfArrays = json.decode(response.body);
      });
    } else {
      throw Exception('Failed to load data');
    }
  }

  @override
  Widget build(BuildContext context) {
    listArticles = listOfArrays['articles'];
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
      ),
      child: Column(children: [
        SingleChildScrollView(
          child: Column(
            children: [
              ...listArticles.map<Widget>((array) {
                var index = listArticles.indexOf(array);
                if (index == 0) {
                  return Row(
                    children: [
                      Expanded(
                          flex: 1,
                          child: Container(
                            decoration: BoxDecoration(
                                color: Color.fromARGB(255, 23, 38, 31),
                                border: Border(
                                    bottom: BorderSide(
                                        width: 1,
                                        color: Colors.greenbrand.shade50))),
                            child: Column(children: [
                              Container(
                                child: Image(
                                  image: NetworkImage(
                                      array['urlToImage'].toString()),
                                  fit: BoxFit.fill,
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.all(25.0),
                                child: Text(
                                  array['title'],
                                  style: TextStyle(
                                    fontSize: 25,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                              )
                            ]),
                          )),
                    ],
                  );
                }

                return Row(
                  children: [
                    Expanded(
                        flex: 1,
                        child: Container(
                          padding: const EdgeInsets.all(15),
                          child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Image(
                                  image: NetworkImage(
                                      array['urlToImage'].toString()),
                                  fit: BoxFit.fill,
                                  height: 70,
                                ),
                              ]),
                        )),
                    Expanded(
                      flex: 3,
                      child: Container(
                        padding: const EdgeInsets.all(10),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text(
                              array['title'],
                              style: TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                );
              }),
            ],
          ),
        )
      ]),
    );
  }
}
