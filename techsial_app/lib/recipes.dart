import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class RecipesWidget extends StatefulWidget {
  const RecipesWidget({super.key});

  @override
  State<RecipesWidget> createState() => _RecipesWidget();
}

class _RecipesWidget extends State<RecipesWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [Text('Recipes ok!')],
    );
  }
}
