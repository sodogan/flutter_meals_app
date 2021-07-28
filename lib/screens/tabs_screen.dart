import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_meals_app/screens/filter_settings_screen.dart';

class TabsScreen extends StatefulWidget {
  final List<Map<String, Object>> pages;

  const TabsScreen({
    Key? key,
    required this.pages,
  }) : super(key: key);

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  int _selectedPageIndex = 0;

  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final Map<String, Object> _selected = widget.pages[_selectedPageIndex];
    final _selectedTitle = _selected['title'] as String;
    final _selectedPage = _selected['page'] as Widget;

    return Scaffold(
      appBar: AppBar(
        title: Text(_selectedTitle),
      ),
      body: _selectedPage,
      drawer: const MainDrawer(),
      bottomNavigationBar: MainBottomNavigationBar(
        selectedPageHandler: _selectPage,
        selectedPageIndex: _selectedPageIndex,
      ),
    );
  }
}

class MainDrawer extends StatelessWidget {
  const MainDrawer({Key? key}) : super(key: key);

  Widget buildListTile({
    required Function onTapHandler,
    required IconData icon,
    required String title,
  }) {
    return ListTile(
      onTap: () => onTapHandler(),
      leading: Icon(
        icon,
        size: 26,
      ),
      title: Text(
        title,
        style: TextStyle(
          fontFamily: 'RobotoCondensed',
          fontSize: 26,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          Container(
            height: 120,
            width: double.infinity,
            alignment: Alignment.centerLeft,
            color: Theme.of(context).accentColor,
            padding: EdgeInsets.all(20),
            margin: EdgeInsets.all(20),
            child: Text(
              'Cooking up!',
              style: TextStyle(
                fontWeight: FontWeight.w900,
                fontSize: 30,
                color: Theme.of(context).primaryColor,
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          buildListTile(
              onTapHandler: () =>
                  Navigator.of(context).pushReplacementNamed('/'),
              icon: Icons.restaurant,
              title: 'Meals'),
          buildListTile(
              onTapHandler: () => Navigator.of(context)
                  .pushReplacementNamed(FilterSettingsScreen.routeName),
              icon: Icons.settings,
              title: 'Settings'),
        ],
      ),
    );
  }
}

class MainBottomNavigationBar extends StatelessWidget {
  final int selectedPageIndex;
  final Function(int) selectedPageHandler;

  const MainBottomNavigationBar({
    Key? key,
    required this.selectedPageHandler,
    required this.selectedPageIndex,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      backgroundColor: Theme.of(context).primaryColor,
      selectedItemColor: Colors.amber,
      unselectedItemColor: Colors.white,
      currentIndex: selectedPageIndex,
      type: BottomNavigationBarType.fixed,
      onTap: selectedPageHandler,
      items: [
        BottomNavigationBarItem(
          backgroundColor: Theme.of(context).primaryColor,
          label: 'Categories',
          icon: const Icon(
            Icons.category,
          ),
        ),
        BottomNavigationBarItem(
          backgroundColor: Theme.of(context).primaryColor,
          label: 'Favourites',
          icon: const Icon(
            Icons.star,
          ),
        ),
      ],
    );
  }
}
