import 'package:flutter/material.dart';

import './screens/filters_screen.dart';
import './screens/tabs.dart';
import './screens/meal_detail_screen.dart';
import './screens/category_meals_screen.dart';
import './dummy_data.dart';
import './models/meal.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<String, bool> _filters = {
    "glueton": false,
    "lactose": false,
    "vegan": false,
    "vegetarian": false,
  };

  List<Meal> _availableMeal = DUMMY_MEALS;
  List<Meal> _favoriteMeals = [];

  void _toggleFavorite(String mealId) {
    final existingMeal = _favoriteMeals.indexWhere((meal) => meal.id == mealId);
    if (existingMeal >= 0) {
      setState(() {
        _favoriteMeals.removeAt(existingMeal);
      });
    } else {
      setState(() {
        _favoriteMeals.add(DUMMY_MEALS.firstWhere((meal) => mealId == meal.id));
      });
    }
  }

  bool _isMealFavorite(String id) {
    return _favoriteMeals.any((meal) => meal.id == id);
  }

  void _setFilters(Map<String, bool> filterData) {
    setState(() {
      _filters = filterData;

      _availableMeal = DUMMY_MEALS.where((meal) {
        if (!meal.isGlutenFree && _filters["glueton"]) {
          return false;
        }
        if (!meal.isLactoseFree && _filters["lactose"]) {
          return false;
        }
        if (!meal.isVegan && _filters["vegan"]) {
          return false;
        }
        if (!meal.isVegetarian && _filters["vegetarian"]) {
          return false;
        }
        return true;
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Meals App',
      theme: ThemeData(
        primarySwatch: Colors.pink,
        accentColor: Colors.amber,
        canvasColor: Color.fromRGBO(225, 254, 229, 1),
        fontFamily: "Raleway",
        textTheme: ThemeData.light().textTheme.copyWith(
              body1: TextStyle(
                color: Color.fromRGBO(20, 51, 51, 1),
              ),
              body2: TextStyle(
                color: Color.fromRGBO(20, 51, 51, 1),
                fontSize: 20,
              ),
              title: TextStyle(
                  fontSize: 20,
                  fontFamily: "RobotoCondensed",
                  fontWeight: FontWeight.bold),
            ),
      ),
      // home: CategoryScreen(),
      initialRoute: "/",
      routes: {
        "/": (ctx) => TabsScreen(_favoriteMeals),
        CategoryMealScreen.routeName: (ctx) =>
            CategoryMealScreen(_availableMeal),
        MealsDetailScreen.routeName: (ctx) =>
            MealsDetailScreen(_isMealFavorite, _toggleFavorite),
        FilterScreen.routeName: (ctx) => FilterScreen(_filters, _setFilters),
      },
    );
  }
}
