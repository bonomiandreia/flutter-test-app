import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import './tools/transform-list.dart' as transform_list;

class RecipeWidget extends StatefulWidget {
  const RecipeWidget({super.key, required this.recipeSelected});

  final Map recipeSelected;

  @override
  State<RecipeWidget> createState() => _RecipeWidgetState();
}

class _RecipeWidgetState extends State<RecipeWidget> {
  @override
  Widget build(BuildContext context) {
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
                    mainAxisAlignment: MainAxisAlignment.center,
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
                            Row(
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
                                      fontSize: 13,
                                      color: Colors.black,
                                    )),
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
                                      color: Colors.black,
                                    ))
                              ],
                            )
                          ])),
                    ],
                  ),
                ),
              ],
            ),
            Row(
              children: [Text('ok!')],
            )
          ],
        ),
      ),
    );
  }
}
