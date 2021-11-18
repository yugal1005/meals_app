import 'package:flutter/material.dart';

import 'main_drawer.dart';

class FilterScreen extends StatefulWidget {
  static const String routeName = "/filter-screen";
  final Function saveFilters;
  final Map<String, bool> currentFilters;
  FilterScreen(this.currentFilters, this.saveFilters);

  @override
  _FilterScreenState createState() => _FilterScreenState();
}

bool isGluetonFree = false;
bool isVegan = false;
bool isVegetarian = false;
bool isLactosFree = false;

Widget _buildSwitchListTile(
    String title, String description, bool currentValue, Function updateValue) {
  return SwitchListTile(
    title: Text(title),
    subtitle: Text(description),
    value: currentValue,
    onChanged: updateValue,
  );
}

class _FilterScreenState extends State<FilterScreen> {
  @override
  initState() {
    isGluetonFree = widget.currentFilters["glueton"];
    isVegan = widget.currentFilters["vegan"];
    isVegetarian = widget.currentFilters["vegetarian"];
    isLactosFree = widget.currentFilters["lactose"];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MainDrawer(),
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              final selectedFilters = {
                "glueton": isGluetonFree,
                "lactose": isLactosFree,
                "vegan": isVegan,
                "vegetarian": isVegetarian,
              };
              widget.saveFilters(selectedFilters);
            },
            icon: Icon(Icons.save),
          ),
        ],
        title: Text("Filters"),
      ),
      body: Center(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(20),
              child: Text(
                "Adjust you meals here",
                style: Theme.of(context).textTheme.title,
              ),
            ),
            Expanded(
              child: ListView(
                children: [
                  _buildSwitchListTile(
                    "Glueton Free",
                    "Only shows glueton free meals",
                    isGluetonFree,
                    (newValue) {
                      setState(() {
                        isGluetonFree = newValue;
                      });
                    },
                  ),
                  _buildSwitchListTile(
                      "Vegan Meals", "Only includes vegan meals", isVegan,
                      (newValue) {
                    setState(() {
                      isVegan = newValue;
                    });
                  }),
                  _buildSwitchListTile(
                      "Vegetarian Meals",
                      "Only includes Vegetarian Meals",
                      isVegetarian, (newValue) {
                    setState(() {
                      isVegetarian = newValue;
                    });
                  }),
                  _buildSwitchListTile(
                      "Lactos Free Meals",
                      "Only includes lactos free meals",
                      isLactosFree, (newValue) {
                    setState(() {
                      isLactosFree = newValue;
                    });
                  })
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
