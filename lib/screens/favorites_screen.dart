import 'package:flutter/material.dart';
import 'package:meal_application/models/meal.dart';
import 'package:meal_application/widgets/meal_item.dart';

class FavoritesScreen extends StatelessWidget {
  final List<Meal> favouriteMeals;

  FavoritesScreen(this.favouriteMeals);

  @override
  Widget build(BuildContext context) {
    if (favouriteMeals.isEmpty){
      return const Center(
        child: Text("You have no favorites yet."),
      );
    }else{
      return ListView.builder(
        itemBuilder: (ctx, index) {
          return MealItem(
            imageUrl: favouriteMeals[index].imageUrl,
            id: favouriteMeals[index].id,
            categories: favouriteMeals[index].categories,
            title: favouriteMeals[index].title,
            ingredients: favouriteMeals[index].ingredients,
            steps: favouriteMeals[index].steps,
            duration: favouriteMeals[index].duration,
            complexity: favouriteMeals[index].complexity,
            affordability: favouriteMeals[index].affordability,
            isGlutenFree: favouriteMeals[index].isGlutenFree,
            isLactoseFree: favouriteMeals[index].isLactoseFree,
            isVegan: favouriteMeals[index].isVegan,
            isVegetarian: favouriteMeals[index].isVegetarian,

          );
        },
        itemCount: favouriteMeals.length,
      );
    }

  }
}

