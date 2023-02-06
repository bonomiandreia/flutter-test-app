import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Healthy Food',
      theme: ThemeData(
        primarySwatch: Colors.greenbrand,
      ),
      home: const MyHomePage(title: 'NEWS'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
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
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.title,
          style: TextStyle(color: Colors.greenbrand.shade900),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0.0,
      ),
      body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.white, Colors.greenbrand.shade100],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                  child: Container(
                      color: Colors.white,
                      margin: const EdgeInsets.symmetric(
                          horizontal: 20.0, vertical: 16.0),
                      child: ListView(children: [
                        ...listArticles.map<Widget>((array) {
                          var index = listArticles.indexOf(array);
                          if (index == 0) {
                            return Row(
                              children: [
                                Expanded(
                                    flex: 1,
                                    child: Container(
                                      decoration: BoxDecoration(
                                          color:
                                              Color.fromARGB(255, 23, 38, 31),
                                          border: Border(
                                              bottom: BorderSide(
                                                  width: 1,
                                                  color: Colors
                                                      .greenbrand.shade50))),
                                      child: Column(
                                        children: [
                                          Container(
                                            child: Image(
                                              image: NetworkImage(
                                                  array['urlToImage']
                                                      .toString()),
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
                                        ],
                                      ),
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
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        Image(
                                          image: NetworkImage(
                                              array['urlToImage'].toString()),
                                          fit: BoxFit.fill,
                                          height: 70,
                                        ),
                                      ],
                                    ),
                                  )),
                              Expanded(
                                  flex: 3,
                                  child: Container(
                                    padding: const EdgeInsets.all(10),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        Text(
                                          array['title'],
                                          style: TextStyle(
                                              fontSize: 15,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ],
                                    ),
                                  ))
                            ],
                          );
                        }).toList()
                      ])))
            ],
          )),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
