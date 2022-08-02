import 'package:flutter/material.dart';
import 'package:meal_application/models/meal.dart';
import 'package:meal_application/screens/categories_screen.dart';
import 'package:meal_application/screens/favorites_screen.dart';
import 'package:meal_application/widgets/main_drawer.dart';

class TabsScreen extends StatefulWidget {
  final List<Meal> favouriteMeals;

  TabsScreen(this.favouriteMeals);

  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  int _selectedPageIndex = 0;

  late List<Map<String, Object>> _pages;

  @override
  void initState() {
    _pages = [
      {
        'page': CategoriesScreen(),
        'title': "Categories",
      },
      {
        'page': FavoritesScreen(widget.favouriteMeals),
        'title': "Your Favourites",
      },
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:  Text("${_pages[_selectedPageIndex]['title']}"),
      ),
      body: _pages[_selectedPageIndex]['page'] as Widget,
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectedPage,
        backgroundColor: Theme.of(context).colorScheme.primary,
        selectedItemColor: Theme.of(context).colorScheme.secondary,
        unselectedItemColor: Colors.white,
        currentIndex: _selectedPageIndex,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.category),
            label: "Categories",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.star),
            label: "Favorites",
          ),
        ],
      ),
      drawer: MainDrawer(),
    );
  }

  void _selectedPage(int value) {
    setState(() {
      _selectedPageIndex = value;
    });
  }
}
