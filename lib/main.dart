import 'package:flutter/material.dart';
import 'package:meal_application/dummy_data.dart';
import 'package:meal_application/models/meal.dart';
import 'package:meal_application/screens/categories_meal_screen.dart';
import 'package:meal_application/screens/categories_screen.dart';
import 'package:meal_application/screens/filters_screen.dart';
import 'package:meal_application/screens/meal_detail_screen.dart';
import 'package:meal_application/screens/tabs_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<String, bool> _filters = {
    'gluten': false,
    'lactose': false,
    'vegetarian': false,
    'vegan': false,
  };

  List<Meal> _availableMeals = dummyMeals;
  List<Meal> _favouriteMeals = [];

  void _setFilters(Map<String, bool> _filtersData) {
    setState(() {
      this._filters = _filtersData;

      _availableMeals = dummyMeals.where((meal) {
        if (_filters['gluten']==true && meal.isGlutenFree == false) {
          return false;
        }
        if (_filters['lactose']==true && meal.isLactoseFree == false) {
          return false;
        }
        if (_filters['vegetarian']==true && meal.isVegetarian == false) {
          return false;
        }
        if (_filters['vegan']==true && meal.isVegan == false) {
          return false;
        }
        return true;
      }).toList();
    });
  }

  void _toggleFavorite(String mealId){
    final _existingIndex = _favouriteMeals.indexWhere((meal) => meal.id == mealId);

    if (_existingIndex>=0){
      setState(() {
        _favouriteMeals.removeAt(_existingIndex);
      });
    }else{
      setState(() {
        _favouriteMeals.add(dummyMeals.firstWhere((meal) => meal.id == mealId));
      });
    }
  }

  bool _isMealFavorite(String mealId){
    return _favouriteMeals.any((meal) => meal.id == mealId);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        canvasColor: const Color.fromRGBO(255, 254, 229, 1),
        textTheme: ThemeData.light().textTheme.copyWith(
              bodyText1: const TextStyle(
                color: Color.fromRGBO(20, 50, 50, 1),
              ),
              bodyText2: const TextStyle(
                color: Color.fromRGBO(20, 50, 50, 1),
              ),
              caption: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'RobotoCondensed'),
            ),
        colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.pink)
            .copyWith(secondary: Colors.amber),
      ),
      //home:  const CategoriesScreen(),
      routes: {
        '/': (context) => TabsScreen(_favouriteMeals),
        CategoryMealScreen.routeName: (context) =>
            CategoryMealScreen(_availableMeals),
        MealDetailScreen.routeName: (context) => MealDetailScreen(_toggleFavorite, _isMealFavorite),
        FiltersScreen.routeName: (context) => FiltersScreen(_filters, _setFilters),
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Meal App"),
      ),
      body: const CategoriesScreen(),
    );
  }
}
