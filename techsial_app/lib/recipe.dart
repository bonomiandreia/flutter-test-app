import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class RecipeWidget extends StatefulWidget {
  const RecipeWidget({super.key, required this.id});

  final String id;

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
          child: Container(
        child: Text(widget.id),
      )),
    );
  }
}
