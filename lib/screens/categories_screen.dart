import 'package:flutter/material.dart';
import 'package:meal_application/dummy_data.dart';
import 'package:meal_application/widgets/category_item.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView(
        padding: EdgeInsets.all(25),
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 200,
          childAspectRatio: 3 / 2,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20,
        ),
        children: dummyCategories
            .map(
              (data) => CategoryItem(data.id, data.title, data.color),
            )
            .toList(),
      );
  }
}
