import 'package:flutter/material.dart';
import 'package:meal_application/widgets/main_drawer.dart';

class FiltersScreen extends StatefulWidget {
  static const routeName = '/filters';

  final saveFilters;
  final Map<String, bool> filters;

  FiltersScreen(this.filters, this.saveFilters);

  @override
  State<FiltersScreen> createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  bool _glutenFree = false;
  bool _lactoseFree = false;
  bool _vegan = false;
  bool _vegetarian = false;

  @override
  void initState() {
    _glutenFree = widget.filters['gluten'] ?? false;
    _lactoseFree = widget.filters['lactose'] ?? false;
    _vegan = widget.filters['vegan'] ?? false;
    _vegetarian = widget.filters['vegetarian'] ?? false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Filters"),
        actions: [
          IconButton(
            onPressed: () {
              Map<String, bool> _filters = {
                'gluten': _glutenFree,
                'lactose': _lactoseFree,
                'vegetarian': _vegetarian,
                'vegan': _vegan,
              };
              widget.saveFilters(_filters);
            },
            icon: const Icon(Icons.save),
          ),
        ],
      ),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(20),
            child: const Text(
              "Adjust you meal selection.",
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'RobotoCondensed'),
            ),
          ),
          Expanded(
            child: Column(
              children: [
                buildSwitchListTile(
                  "Gluten-Free",
                  "Only include gluten-free meals.",
                  _glutenFree,
                  (newValue) {
                    setState(() {
                      _glutenFree = newValue;
                    });
                  },
                ),
                buildSwitchListTile(
                    "Lactose-Free",
                    "Only include Lactose-free meals.",
                    _lactoseFree, (newValue) {
                  setState(() {
                    _lactoseFree = newValue;
                  });
                }),
                buildSwitchListTile(
                    "Vegetarian", "Only include Vegetarian meals.", _vegetarian,
                    (newValue) {
                  setState(() {
                    _vegetarian = newValue;
                  });
                }),
                buildSwitchListTile(
                    "Vegan", "Only include Vegan meals.", _vegan, (newValue) {
                  setState(() {
                    _vegan = newValue;
                  });
                }),
              ],
            ),
          ),
        ],
      ),
      drawer: const MainDrawer(),
    );
  }

  SwitchListTile buildSwitchListTile(
      String title, String description, bool currValue, var updateValue) {
    return SwitchListTile(
      value: currValue,
      onChanged: updateValue,
      title: Text(title),
      subtitle: Text(description),
    );
  }
}
