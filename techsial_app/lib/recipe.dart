import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import './tools/transform-list.dart' as transform_list;
import 'dart:convert';

class ScreenArguments {
  final String id;

  ScreenArguments(this.id);
}

class RecipeWidget extends StatefulWidget {
  const RecipeWidget({super.key, required this.recipeSelected});

  final Map recipeSelected;

  @override
  State<RecipeWidget> createState() => _RecipeWidgetState();
}

class _RecipeWidgetState extends State<RecipeWidget> {
  List<dynamic> modePrepare = [];

  var listSteps = [];

  void initState() {
    super.initState();
    _getDataListRecipe(widget.recipeSelected['id']);
  }

  void _getDataListRecipe(id) async {
    final response = await http.get(Uri.parse(
        'https://api.spoonacular.com/recipes/$id/analyzedInstructions?apiKey=1c7ac727518846feb8b4fb66a0992d1b&stepBreakdown=false'));
    if (response.statusCode == 200) {
      setState(() {
        modePrepare = json.decode(response.body);
      });
    } else {
      throw Exception('Failed to load data');
    }
  }

  @override
  Widget build(BuildContext context) {
    if (modePrepare != null && modePrepare.length > 0) {
      listSteps = modePrepare[0]['steps'] ?? [];
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Recipe',
          style: TextStyle(color: Colors.greenbrand.shade900),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0.0,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: NetworkImage(
                              widget.recipeSelected['image'].toString()),
                          fit: BoxFit.cover)),
                  height: 300,
                  width: double.infinity,
                ),
                Container(
                  padding: const EdgeInsets.only(top: 5, left: 15, right: 15),
                  decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(Radius.circular(25)),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.2),
                          spreadRadius: 3,
                          blurRadius: 10,
                          offset: Offset(0, 3), // changes position of shadow
                        ),
                      ]),
                  margin: const EdgeInsets.only(top: 200, left: 30, right: 30),
                  height: 150,
                  width: double.infinity,
                  child: Row(
                    children: [
                      Flexible(
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                            Text(widget.recipeSelected['title'],
                                style: const TextStyle(
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                )),
                            Container(
                              width: double.infinity,
                              height: 30,
                              padding: const EdgeInsets.only(
                                  top: 5, left: 15, right: 15),
                              decoration: BoxDecoration(
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(25)),
                                  color: Colors.greenbrand,
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.withOpacity(0.2),
                                      spreadRadius: 3,
                                      blurRadius: 10,
                                      offset: Offset(
                                          0, 3), // changes position of shadow
                                    ),
                                  ]),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                      transform_list.Transform_Data()
                                          .transformList(
                                              widget.recipeSelected['nutrition']
                                                  ['nutrients'][0]['name'],
                                              widget.recipeSelected['nutrition']
                                                  ['nutrients'][0]['amount'],
                                              widget.recipeSelected['nutrition']
                                                  ['nutrients'][0]['unit']),
                                      style: const TextStyle(
                                        fontSize: 15,
                                        color: Colors.white,
                                      )),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                      transform_list.Transform_Data()
                                          .transformList(
                                              widget.recipeSelected['nutrition']
                                                  ['nutrients'][1]['name'],
                                              widget.recipeSelected['nutrition']
                                                  ['nutrients'][1]['amount'],
                                              widget.recipeSelected['nutrition']
                                                  ['nutrients'][1]['unit']),
                                      style: const TextStyle(
                                        fontSize: 15,
                                        color: Colors.white,
                                      )),
                                ],
                              ),
                            ),
                          ])),
                    ],
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Container(
                  margin: const EdgeInsets.only(top: 20, left: 30, right: 30),
                  child: Row(children: [
                    Text('Mode of preparing',
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        )),
                  ]),
                ),
              ],
            ),
            Row(
              children: [
                Flexible(
                  child: Container(
                    margin: const EdgeInsets.only(
                        top: 20, left: 30, right: 30, bottom: 30),
                    child: Column(
                      children: [
                        if (listSteps.isEmpty) ...[
                          Container(
                              margin: EdgeInsets.symmetric(
                                  vertical: 4, horizontal: 14),
                              child: Text(
                                  'ERROR! we cant display this information now ):'))
                        ],
                        ...listSteps.map((array) {
                          return Row(
                            children: [
                              Expanded(
                                flex: 1,
                                child: Container(
                                  decoration: BoxDecoration(
                                      borderRadius: const BorderRadius.all(
                                          Radius.circular(60)),
                                      color: Colors.white,
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.grey.withOpacity(0.2),
                                          spreadRadius: 3,
                                          blurRadius: 10,
                                          offset: Offset(0,
                                              3), // changes position of shadow
                                        ),
                                      ]),
                                  width: 40,
                                  height: 40,
                                  child: Align(
                                    alignment: Alignment.center,
                                    child: Text(
                                      array['number'].toString(),
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.greenbrand),
                                    ),
                                  ),
                                ),
                              ),
                              Expanded(
                                flex: 8,
                                child: Container(
                                  margin: EdgeInsets.symmetric(
                                      vertical: 4, horizontal: 14),
                                  padding: EdgeInsets.symmetric(
                                      vertical: 10, horizontal: 10),
                                  child: Text(array['step'].toString(),
                                      style: TextStyle(fontSize: 15)),
                                ),
                              )
                            ],
                          );
                        })
                      ],
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
