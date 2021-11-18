import 'package:flutter/material.dart';
import 'main_drawer.dart';

class FilterScren extends StatelessWidget {
  static const String routeName = "/filter-screen";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MainDrawer(),
      appBar: AppBar(
        title: Text("Favorites"),
      ),
      body: Center(
        child: Text("Filters!"),
      ),
    );
  }
}
