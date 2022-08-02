import 'package:flutter/material.dart';
import 'package:meal_application/models/meal.dart';
import 'package:meal_application/widgets/meal_item.dart';

class CategoryMealScreen extends StatefulWidget {

  static const routeName = 'category_meals';

  final List<Meal> availableMeals;

  const CategoryMealScreen(this.availableMeals);

  @override
  _CategoryMealScreenState createState() => _CategoryMealScreenState();
}

class _CategoryMealScreenState extends State<CategoryMealScreen> {
  late String catTitle;
  late List<Meal> catMeals;
  @override

  @override
  void didChangeDependencies() {
    final routeArgs =
    ModalRoute.of(context)!.settings.arguments as Map<String, String>;
    final catId = routeArgs['id'];
    catTitle = routeArgs['title']!;
    catMeals = widget.availableMeals.where((meal) {
      return meal.categories.contains(catId);
    }).toList();
    super.didChangeDependencies();
  }

  void _removeMeal(String mealId) {
    setState(() {
      catMeals.removeWhere((element) => element.id == mealId);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("$catTitle"),
      ),
      body: ListView.builder(
        itemBuilder: (ctx, index) {
          return MealItem(
            imageUrl: catMeals[index].imageUrl,
            id: catMeals[index].id,
            categories: catMeals[index].categories,
            title: catMeals[index].title,
            ingredients: catMeals[index].ingredients,
            steps: catMeals[index].steps,
            duration: catMeals[index].duration,
            complexity: catMeals[index].complexity,
            affordability: catMeals[index].affordability,
            isGlutenFree: catMeals[index].isGlutenFree,
            isLactoseFree: catMeals[index].isLactoseFree,
            isVegan: catMeals[index].isVegan,
            isVegetarian: catMeals[index].isVegetarian,
          );
        },
        itemCount: catMeals.length,
      ),
    );
  }
}
