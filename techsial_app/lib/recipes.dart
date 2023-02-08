import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:techsial_app/recipe.dart';

class RecipesWidget extends StatefulWidget {
  @override
  State<RecipesWidget> createState() => _RecipesWidget();
}

class _RecipesWidget extends State<RecipesWidget> {
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
  var listArticles = [];

  void initState() {
    super.initState();
    // _getDataListNews();
  }

  void _getDataListNews() async {
    final response = await http.get(Uri.parse(
        'https://api.spoonacular.com/recipes/complexSearch?cuisine=healthy&maxFat=25&number=10&apiKey=1c7ac727518846feb8b4fb66a0992d1b&includeNutrition=true&sort=calories'));
    if (response.statusCode == 200) {
      setState(() {
        listOfArrays = json.decode(response.body);
      });
    } else {
      throw Exception('Failed to load data');
    }
  }

  _transformList(word1, word2, word3) {
    return word1.toString() + ': ' + word2.toString() + word3.toString();
  }

  @override
  Widget build(BuildContext context) {
    listArticles = listOfArrays['results'] ?? [];
    return Container(
      child: Column(children: [
        SingleChildScrollView(
            child: Column(children: [
          ...listArticles.map((array) {
            return GestureDetector(
                onTap: () => {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => RecipeWidget(
                                  recipeSelected: array,
                                )),
                      )
                    },
                child: Row(
                  children: [
                    Expanded(
                        child: Container(
                            height: 200,
                            margin: const EdgeInsets.all(15),
                            padding: const EdgeInsets.all(25),
                            decoration: BoxDecoration(
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(25)),
                                image: DecorationImage(
                                    colorFilter: ColorFilter.mode(
                                        Colors.black.withOpacity(0.4),
                                        BlendMode.darken),
                                    image:
                                        NetworkImage(array['image'].toString()),
                                    fit: BoxFit.cover)),
                            child: Row(children: [
                              Flexible(
                                  child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(array['title'],
                                      style: const TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                      )),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 30),
                                    child: Text(
                                        _transformList(
                                            array['nutrition']['nutrients'][1]
                                                ['name'],
                                            array['nutrition']['nutrients'][1]
                                                ['amount'],
                                            array['nutrition']['nutrients'][1]
                                                ['unit']),
                                        style: const TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.normal,
                                          color: Colors.white,
                                        )),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 10),
                                    child: Text(
                                        _transformList(
                                            array['nutrition']['nutrients'][0]
                                                ['name'],
                                            array['nutrition']['nutrients'][0]
                                                ['amount'],
                                            array['nutrition']['nutrients'][0]
                                                ['unit']),
                                        style: const TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.normal,
                                          color: Colors.white,
                                        )),
                                  )
                                ],
                              ))
                            ])))
                  ],
                ));
          })
        ]))
      ]),
    );
  }
}
