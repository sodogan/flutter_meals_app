import 'package:flutter/material.dart';
import './tabs_screen.dart';

class FilterSettingsScreen extends StatefulWidget {
  static const String _routeName = 'filters';
  final Map<String, bool> filterSettings;
  final Function saveFilterSettingsHandler;

  const FilterSettingsScreen({
    Key? key,
    required this.filterSettings,
    required this.saveFilterSettingsHandler,
  }) : super(key: key);

  static get routeName => _routeName;

  @override
  State<FilterSettingsScreen> createState() => _FilterSettingsScreenState();
}

class _FilterSettingsScreenState extends State<FilterSettingsScreen> {
  bool isGlutenFree = false;
  bool isVegan = false;
  bool isVegetarian = false;
  bool isLactoseFree = false;

  @override
  initState() {
    super.initState();

    isGlutenFree = widget.filterSettings['isGlutenFree']!;
    isLactoseFree = widget.filterSettings['isLactoseFree']!;
    isVegan = widget.filterSettings['isVegan']!;
    isVegetarian = widget.filterSettings['isVegetarian']!;
  }

  void changeSwitchState({
    required bool newVal,
    required Function(bool) func,
  }) {
    func(newVal);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Filter Settings'),
        actions: [
          IconButton(
            onPressed: () => widget.saveFilterSettingsHandler(
              {
                'isGlutenFree': isGlutenFree,
                'isLactoseFree': isLactoseFree,
                'isVegan': isVegan,
                'isVegetarian': isVegetarian,
              },
            ),
            icon: const Icon(Icons.save),
            color: Colors.white,
          ),
        ],
      ),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(20),
            child: Text(
              'Adjust your meal Selections',
              style: Theme.of(context).textTheme.bodyText1,
            ),
          ),
          Expanded(
            child: ListView(
              children: [
                SwitchListTile.adaptive(
                  value: isGlutenFree,
                  onChanged: (newValue) => changeSwitchState(
                    newVal: newValue,
                    func: (newValue) => setState(
                      () => isGlutenFree = newValue,
                    ),
                  ),
                  title: Text('Gluten Free'),
                  subtitle: Text(
                    'Only include Gluten Free Meals',
                    style: Theme.of(context).textTheme.bodyText1,
                  ),
                ),
                SwitchListTile.adaptive(
                  value: isLactoseFree,
                  onChanged: (newValue) => changeSwitchState(
                    newVal: newValue,
                    func: (newValue) => setState(
                      () => isLactoseFree = newValue,
                    ),
                  ),
                  title: Text('Lactose Free'),
                  subtitle: Text(
                    'Only include Lactose Free Meals',
                    style: Theme.of(context).textTheme.bodyText1,
                  ),
                ),
                SwitchListTile.adaptive(
                  value: isVegan,
                  onChanged: (newValue) => changeSwitchState(
                    newVal: newValue,
                    func: (_) => isVegan = newValue,
                  ),
                  title: Text('Vegan'),
                  subtitle: Text(
                    'Only include vegan Meals',
                    style: Theme.of(context).textTheme.bodyText1,
                  ),
                ),
                SwitchListTile.adaptive(
                  value: isVegetarian,
                  onChanged: (newValue) => changeSwitchState(
                    newVal: newValue,
                    func: (newValue) => setState(
                      () => isVegetarian = newValue,
                    ),
                  ),
                  title: Text('Vegaterian'),
                  subtitle: Text(
                    'Only include Vegetarian Meals',
                    style: Theme.of(context).textTheme.bodyText1,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
      drawer: MainDrawer(),
    );
  }
}
