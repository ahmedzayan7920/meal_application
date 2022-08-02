import 'package:flutter/material.dart';
import 'package:meal_application/screens/filters_screen.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({Key? key}) : super(key: key);
  
  Widget createDarawerItem(String title, IconData icon, VoidCallback handler){
    return ListTile(
      onTap: handler,
      leading: Icon(icon, size: 26),
      title: Text(
        title,
        style: const TextStyle(
          fontSize: 24,
          fontFamily: 'RobotoCondensed',
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            height: 120,
            width: double.infinity,
            color: Theme.of(context).colorScheme.secondary,
            padding: EdgeInsets.all(20),
            alignment: Alignment.centerLeft,
            child: Text(
              "Cooking App",
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.w900,
                color: Theme.of(context).colorScheme.primary,
              ),
            ),
          ),
          SizedBox(height: 20),
           createDarawerItem("Meal", Icons.restaurant, (){Navigator.of(context).pushReplacementNamed('/');}),
           createDarawerItem("Filters", Icons.settings, (){Navigator.of(context).pushReplacementNamed(FiltersScreen.routeName);}),
        ],
      ),
    );
  }
}
