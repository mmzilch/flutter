import 'package:flutter/material.dart';
import 'package:flutter_themealdb/categoryscreen.dart';
import 'package:flutter_themealdb/filterscreen.dart';
import 'package:flutter_themealdb/ingedrientscreen.dart';

class BottomNavigation extends StatefulWidget {
  @override
  _BottomNavigationState createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  int selectedIndex = 0;

  //static const TextStyle textStyle =TextStyle(fontSize: 30, fontWeight: FontWeight.bold);

  static List<Widget> options = [
    CategoryScreen(),
    FilterScreen(),
    IngedrientScreen()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: options.elementAt(selectedIndex)),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: Icon(Icons.category), title: Text('Category')),
          BottomNavigationBarItem(
              icon: Icon(Icons.filter), title: Text('Filter')),
          BottomNavigationBarItem(
              icon: Icon(Icons.format_shapes), title: Text('Ingredient')),
        ],
        currentIndex: selectedIndex,
        selectedItemColor: Colors.cyan,
        onTap: onItemtapped,
      ),
    );
  }

  void onItemtapped(int index) {
    setState(() {
      selectedIndex = index;
      print(selectedIndex);
    });
  }
}
