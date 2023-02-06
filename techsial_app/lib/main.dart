import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:techsial_app/home.dart';
import 'package:techsial_app/recipes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Healthy Food',
      theme: ThemeData(
        primarySwatch: Colors.greenbrand,
      ),
      home: const MyHomePage(title: 'HEALTHY FOOD'),
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
  @override
  int _counter = 0;
  int _selectedIndex = 0;

  Widget build(BuildContext context) {
    void initState() {
      super.initState();
    }

    final menuScreens = [
      HomeNews(),
      const RecipesWidget(title: 'RECIPES'),
    ];

    return Scaffold(
        appBar: AppBar(
          title: Text(
            widget.title,
            style: TextStyle(color: Colors.greenbrand.shade900),
          ),
          backgroundColor: Colors.transparent,
          elevation: 0.0,
        ),
        bottomNavigationBar: GNav(
          padding: EdgeInsets.symmetric(horizontal: 30, vertical: 30),
          gap: 8,
          iconSize: 50,
          activeColor: Colors.greenbrand,
          tabs: [
            GButton(icon: Icons.newspaper, text: 'News'),
            GButton(icon: Icons.food_bank, text: 'Recipes'),
          ],
          selectedIndex: _selectedIndex,
          onTabChange: (index) {
            setState(() {
              _selectedIndex = index;
            });
          },
        ),
        body: SingleChildScrollView(
            child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Colors.white, Colors.greenbrand.shade100],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                ),
                padding: const EdgeInsets.all(15),
                child: Expanded(
                  child: menuScreens[_selectedIndex],
                ))));
  }
}
