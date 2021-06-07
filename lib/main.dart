import 'package:flutter/material.dart';
import 'package:third/screens/category_meals_screen.dart';
import 'package:third/screens/filter_screen.dart';
import 'package:third/screens/meal_detail_screen.dart';
import 'package:third/screens/tabs_screen.dart';
import 'dummy_data.dart';
import 'models/meal.dart';
import 'screens/categories_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<String, bool> _filters = {
    'gluten': false,
    'lactose': false,
    'vegan': false,
    'vegetarian': false,
  };
  List<Meal> _favoriteMeals = [];
  List<Meal> _availableMeals = DUMMY_MEALS;
  void _setFilters(Map<String, bool> filterData) {
    setState(() {
      _filters = filterData;
      _availableMeals = DUMMY_MEALS.where((meal){
        //...
      }).toList();
    });
  }
  void _toggleFavorite(String mealId) {
    final existingIndex =
        _favoriteMeals.indexWhere((meal) => meal.id == mealId);
    if (existingIndex >= 0) {
      setState(() {
        _favoriteMeals.removeAt(existingIndex);
      });
    } else {
      setState(() {
        _favoriteMeals.add(DUMMY_MEALS.firstWhere((meal) => meal.id == mealId));
      });
    }
  }

  bool _isMealFavorite(String id) {
    return _favoriteMeals.any((meal) => meal.id == id );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Layout Demo',
        theme: ThemeData(
          primarySwatch: Colors.purple,
          accentColor: Colors.transparent,
          canvasColor: Color.fromRGBO(255, 240, 240, 1),
          fontFamily: 'Raleway',
          textTheme: ThemeData.light().textTheme.copyWith(),
        ),
        routes: {
          '/': (ctx) => TabsScreen(_favoriteMeals),
          //ctx created by flutter it is a builder function (ctx)=>
          CategoryMealsScreen.routeName: (ctx) => CategoryMealsScreen(_availableMeals),
          MealDetailScreen.routeName: (ctx) =>
              MealDetailScreen(_toggleFavorite,_isMealFavorite),
          FiltersScreen.routeName: (ctx) => FiltersScreen(_setFilters),
        },
        //load this route for any route that not registered in route screen
        onGenerateRoute: (settings) {
          print(settings.arguments);
          return MaterialPageRoute(builder: (ctx) => CategoriesScreen());
        },
        onUnknownRoute: (settings) {
          return MaterialPageRoute(builder: (ctx) => CategoriesScreen());
        });
  }
}
