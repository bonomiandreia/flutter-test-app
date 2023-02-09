import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import './tools/transform-list.dart' as transform_list;

import 'package:techsial_app/recipe.dart';

class RecipesWidget extends StatefulWidget {
  @override
  State<RecipesWidget> createState() => _RecipesWidget();
}

class _RecipesWidget extends State<RecipesWidget> {
  var test = 0;
  void _firstLoad() async {
    setState(() {
      _isFirstLoadRunning = false;
    });
    try {
      final res = await http.get(Uri.parse(
          "https://api.spoonacular.com/recipes/complexSearch?cuisine=healthy&maxFat=25&number=$addMoreItems&apiKey=1c7ac727518846feb8b4fb66a0992d1b&includeNutrition=true"));
      setState(() {
        var fetchedPosts = json.decode(res.body);
        _posts.addAll(fetchedPosts['results']);
      });
    } catch (err) {
      print('Something went wrong');
    }

    setState(() {
      _isFirstLoadRunning = false;
    });
  }

  Future yourFuture() async {
    if (_hasNextPage == true &&
        _isFirstLoadRunning == false &&
        _isLoadMoreRunning == false) {
      setState(() {
        _isLoadMoreRunning = true;
      });
      print(addMoreItems);
      test += 1;
      try {
        final res = await http.get(Uri.parse(
            "https://api.spoonacular.com/recipes/complexSearch?cuisine=healthy&maxFat=25&number=$addMoreItems&apiKey=1c7ac727518846feb8b4fb66a0992d1b&includeNutrition=true&sortt=calories"));

        var fetchedPosts = json.decode(res.body);
        if (fetchedPosts.isNotEmpty) {
          setState(() {
            var len = fetchedPosts['results']?.length ?? 0;
            if (len != 0) {
              _posts.addAll(fetchedPosts['results']);
            }
          });
        } else {
          setState(() {
            _posts = [];
            _hasNextPage = false;
          });
        }
      } catch (err) {
        print(err);
        _posts = [];
      }

      setState(() {
        _isLoadMoreRunning = false;
      });
    }
  }

  void onScroll() {
    var position = scroll.position.pixels;
    if (position >= scroll.position.maxScrollExtent) {
      if (!preventCall) {
        addMoreItems += 5;
        if (test < 1) {
          yourFuture().then((_) => preventCall = false);
        }

        preventCall = true;
      }
    } else {
      addMoreItems = 10;
    }
  }

  // The controller for the ListView
  var scroll = ScrollController();
  var preventCall = false;

  @override
  void initState() {
    scroll.addListener(onScroll);

    super.initState();
    _firstLoad();
  }

  @override
  void dispose() {
    scroll.removeListener(onScroll);
    super.dispose();
  }

  List _posts = [];
  var listArticles = [];

  int addMoreItems = 10;
  final int _limit = 20;
  bool _hasNextPage = true;
  bool _isFirstLoadRunning = false;
  bool _isLoadMoreRunning = false;

  @override
  Widget build(BuildContext context) {
    Map listOfArrays = {
      "results": [
        {
          "id": 637923,
          "title": "Chicken and Penne Pasta With Garlic Rosemary Sauce",
          "image": "https://spoonacular.com/recipeImages/637923-312x231.jpg",
          "imageType": "jpg",
          "nutrition": {
            "nutrients": [
              {"name": "Fat", "amount": 17.7995, "unit": "g"},
              {"name": "Calories", "amount": 884.268, "unit": "kcal"}
            ]
          }
        },
        {
          "id": 1095802,
          "title": "Fettuccine with shrimp, mussels and cherry tomatoes",
          "image": "https://spoonacular.com/recipeImages/1095802-312x231.jpg",
          "imageType": "jpg",
          "nutrition": {
            "nutrients": [
              {"name": "Fat", "amount": 17.7026, "unit": "g"},
              {"name": "Calories", "amount": 814.73, "unit": "kcal"}
            ]
          }
        },
        {
          "id": 1098240,
          "title": "Lemon Fresh Spaghetti with Garden Sauce & Pumpkin Flowers",
          "image": "https://spoonacular.com/recipeImages/1098240-312x231.jpg",
          "imageType": "jpg",
          "nutrition": {
            "nutrients": [
              {"name": "Fat", "amount": 24.1583, "unit": "g"},
              {"name": "Calories", "amount": 812.401, "unit": "kcal"}
            ]
          }
        },
        {
          "id": 637326,
          "title": "Cavatelli with Chicken Sausage and Kale",
          "image": "https://spoonacular.com/recipeImages/637326-312x231.jpg",
          "imageType": "jpg",
          "nutrition": {
            "nutrients": [
              {"name": "Fat", "amount": 23.0044, "unit": "g"},
              {"name": "Calories", "amount": 809.113, "unit": "kcal"}
            ]
          }
        },
        {
          "id": 1096241,
          "title": "Spaghetti with Peas, Mushrooms, and Tomato Sauce",
          "image": "https://spoonacular.com/recipeImages/1096241-312x231.jpg",
          "imageType": "jpg",
          "nutrition": {
            "nutrients": [
              {"name": "Fat", "amount": 21.0347, "unit": "g"},
              {"name": "Calories", "amount": 804.226, "unit": "kcal"}
            ]
          }
        },
        {
          "id": 650397,
          "title": "Low Fat Fettuccine Alfredo With Fiddleheads",
          "image": "https://spoonacular.com/recipeImages/650397-312x231.jpg",
          "imageType": "jpg",
          "nutrition": {
            "nutrients": [
              {"name": "Fat", "amount": 14.8432, "unit": "g"},
              {"name": "Calories", "amount": 803.821, "unit": "kcal"}
            ]
          }
        },
        {
          "id": 662075,
          "title": "Stuffed Pork Tenderloin with Marsala-Port Sauce",
          "image": "https://spoonacular.com/recipeImages/662075-312x231.jpg",
          "imageType": "jpg",
          "nutrition": {
            "nutrients": [
              {"name": "Fat", "amount": 22.3432, "unit": "g"},
              {"name": "Calories", "amount": 783.697, "unit": "kcal"}
            ]
          }
        },
        {
          "id": 663051,
          "title": "Tex-Mex Tilapia Bowl",
          "image": "https://spoonacular.com/recipeImages/663051-312x231.jpg",
          "imageType": "jpg",
          "nutrition": {
            "nutrients": [
              {"name": "Fat", "amount": 11.5368, "unit": "g"},
              {"name": "Calories", "amount": 783.406, "unit": "kcal"}
            ]
          }
        },
        {
          "id": 645646,
          "title": "Grilled Chicken Gyros With Tzatziki",
          "image": "https://spoonacular.com/recipeImages/645646-312x231.jpg",
          "imageType": "jpg",
          "nutrition": {
            "nutrients": [
              {"name": "Fat", "amount": 22.4637, "unit": "g"},
              {"name": "Calories", "amount": 777.911, "unit": "kcal"}
            ]
          }
        },
        {
          "id": 643634,
          "title": "Macaroni with Fresh Tomatoes and Beans",
          "image": "https://spoonacular.com/recipeImages/643634-312x231.jpg",
          "imageType": "jpg",
          "nutrition": {
            "nutrients": [
              {"name": "Fat", "amount": 24.1392, "unit": "g"},
              {"name": "Calories", "amount": 773.762, "unit": "kcal"}
            ]
          }
        }
      ],
      "offset": 0,
      "number": 10,
      "totalResults": 3574
    };
    _posts = listOfArrays['results'] ?? [];
    return Container(
        child: Column(children: [
      SingleChildScrollView(
          child: Column(children: [
        _isFirstLoadRunning
            ? const Center(
                child: const CircularProgressIndicator(),
              )
            : Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Expanded(
                      child: SizedBox(
                    height: MediaQuery.of(context).size.height - 250,
                    child: ListView.builder(
                        controller: scroll,
                        itemCount: _posts.length,
                        itemBuilder: (_, index) => GestureDetector(
                            onTap: () => {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => RecipeWidget(
                                              recipeSelected: _posts[index],
                                            )),
                                  )
                                },
                            child: Row(
                              children: [
                                Expanded(
                                  child: Container(
                                    height: 250,
                                    margin: const EdgeInsets.all(15),
                                    padding: const EdgeInsets.all(25),
                                    decoration: BoxDecoration(
                                        borderRadius: const BorderRadius.all(
                                            Radius.circular(25)),
                                        image: DecorationImage(
                                            colorFilter: ColorFilter.mode(
                                                Colors.black.withOpacity(0.4),
                                                BlendMode.darken),
                                            image: NetworkImage(_posts[index]
                                                    ['image']
                                                .toString()),
                                            fit: BoxFit.cover)),
                                    child: Row(children: [
                                      Flexible(
                                        child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(_posts[index]['title'],
                                                  style: const TextStyle(
                                                    fontSize: 20,
                                                    fontWeight: FontWeight.bold,
                                                    color: Colors.white,
                                                  )),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    top: 30),
                                                child: Text(
                                                    transform_list.Transform_Data().transformList(
                                                        _posts[index]['nutrition']
                                                                ['nutrients']![
                                                            0]['name'],
                                                        _posts[index]['nutrition']
                                                                ['nutrients']![
                                                            0]['amount'],
                                                        _posts[index]['nutrition']
                                                                    ['nutrients']
                                                                [0]!['unit'] ??
                                                            ''),
                                                    style: const TextStyle(
                                                      fontSize: 15,
                                                      fontWeight:
                                                          FontWeight.normal,
                                                      color: Colors.white,
                                                    )),
                                              ),
                                            ]),
                                      )
                                    ]),
                                  ),
                                )
                              ],
                            ))),
                  )),
                ],
              ),
        if (_isLoadMoreRunning == true)
          const Padding(
            padding: EdgeInsets.only(top: 10, bottom: 40),
            child: Center(
              child: CircularProgressIndicator(),
            ),
          ),
      ]))
    ]));
  }
}
