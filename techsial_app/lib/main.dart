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
  Map listOfArrays = {
    "status": "ok",
    "totalResults": 5892,
    "articles": [
      {
        "source": {"id": null, "name": "Forbes"},
        "author":
            "Robin Gagnon, Forbes Councils Member, \n Robin Gagnon, Forbes Councils Member\n https://www.forbes.com/sites/forbesbusinesscouncil/people/robingagnon/",
        "c": "Comparing Franchise Vs. Independent Restaurants For 2023",
        "description":
            "Based on several key factors, will franchise or independent restaurants be better positioned in 2023? Here is a comparison.",
        "url":
            "https://www.forbes.com/sites/forbesbusinesscouncil/2023/02/06/comparing-franchise-vs-independent-restaurants-for-2023/",
        "urlToImage":
            "https://imageio.forbes.com/specials-images/imageserve/63dd1d4518a8e0add39afec6/0x0.jpg?format=jpg&width=1200",
        "publishedAt": "2023-02-06T13:30:00Z",
        "content":
            "Robin Gagnon is the CEO and Co-Founder of We Sell Restaurants, a business broker franchise focused on the sale of restaurants.\r\ngetty\r\nRestaurant industry sales are expected to reach 855 billion in … [+6557 chars]"
      },
      {
        "source": {"id": null, "name": "Yahoo Entertainment"},
        "author": "Future Market Insights Global and Consulting Pvt. Ltd.",
        "title":
            "Vodka Market Expected to Hit US 68.25 billion by 2033, & is predicted to occur at a CAGR of 5.5% by 2033 | Future Market Insights, Inc.",
        "description":
            "From 2023 to 2033, Asia Pacific Vodka Market is expected to grow at a CAGR of 6.4%. he category for flavored vodka is likely to grow more quickly, with a...",
        "url":
            "https://finance.yahoo.com/news/vodka-market-expected-hit-us-133000212.html",
        "urlToImage":
            "https://s.yimg.com/ny/api/res/1.2/qP4r51hLByRzlY33mD2ISw--/YXBwaWQ9aGlnaGxhbmRlcjt3PTEyMDA7aD03MzA-/https://media.zenfs.com/en/globenewswire.com/433e6507c3cf94b90d194380426a7629",
        "publishedAt": "2023-02-06T13:30:00Z",
        "content":
            "Future Market Insights Global and Consulting Pvt. Ltd.\r\nFrom 2023 to 2033, Asia Pacific Vodka Market is expected to grow at a CAGR of 6.4%. he category for flavored vodka is likely to grow more quick… [+8427 chars]"
      },
    ]
  };

  @override
  void initState() {
    super.initState();
    _getDataListNews();
  }

  void _getDataListNews() async {
    final response = await http.get(Uri.parse(''));
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
    var answers = listOfArrays['articles'] as List<Map<String, Object>>;

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
                        ...answers.map<Widget>((array) {
                          var index = answers.indexOf(array);
                          return Container(
                            child: Column(children: [
                              Image(
                                  image: NetworkImage(
                                      array['urlToImage'].toString())),
                              Text(array['title'].toString()),
                              Text(index.toString())
                            ]),
                          );
                        }).toList()
                      ])))
            ],
          )),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
