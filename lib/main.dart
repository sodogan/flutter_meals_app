import 'package:flutter/material.dart';
import 'package:flutter_meals_app/models/category.dart';
import 'package:flutter_meals_app/models/data_stream.dart';
import 'package:flutter_meals_app/screens/favourites_screen.dart';
import 'package:flutter_meals_app/screens/filter_settings_screen.dart';
import 'package:flutter_meals_app/screens/meal_details_screen.dart';
import 'package:flutter_meals_app/screens/tabs_screen.dart';
import 'custom_theme.dart';
import '/models/meal.dart';
import '/models/dummy_data.dart';
import 'screens/category_meals_screen.dart';
import 'screens/categories_screen.dart';

void main() => runApp(
      const MyApp(),
    );

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<String, bool> filterSettings = {
    'isGlutenFree': false,
    'isLactoseFree': false,
    'isVegan': false,
    'isVegetarian': false,
  };
  List<Category> _allCategories = DUMMY_CATEGORIES;
  List<Meal> _availableMeals = DUMMY_MEALS;
  List<Meal> _favouriteMeals = [];

  @override
  void initState() {
    super.initState();
    print('inside initState');
    /*
    buildCategoryFuture().then((categories) {
      _allCategories = categories;
      print(_allCategories);
    });
    
    buildMealFuture().then((meals) {
      _availableMeals = meals;
    });
    */
  }

  void saveFilters(Map<String, bool> newFilters) {
    setState(() {
      filterSettings = newFilters;
      _availableMeals = filterAvailableMeals();
      print(filterSettings);
    });
  }

  void toggleFavourite(String mealID) {
    final bool Function(Meal) callback = (Meal meal) => meal.id == mealID;
    final isFavourite = _favouriteMeals.any(callback);
    Meal matchingMeal =
        _availableMeals.firstWhere((element) => element.id == mealID);
    if (!isFavourite) {
      setState(() {
        _favouriteMeals.add(matchingMeal);
      });
    } else {
      final index =
          _favouriteMeals.indexWhere((Meal meal) => meal.id == mealID);
      setState(
        () {
          _favouriteMeals.removeAt(index);
        },
      );
    }
  }

  //build the filters
  List<Meal> filterAvailableMeals() {
    return _availableMeals.where((Meal meal) {
      if (filterSettings['isGlutenFree']! && !meal.isGlutenFree) {
        return false;
      }
      if (filterSettings['isLactoseFree']! && !meal.isLactoseFree) {
        return false;
      }
      if (filterSettings['isVegan']! && !meal.isVegan) {
        return false;
      }
      if (filterSettings['isVegetarian']! && !meal.isVegetarian) {
        return false;
      }
      return true;
    }).toList();
  }

  IconData isFavouriteIcon(String mealID) {
    final icon = _favouriteMeals.contains(
      (Meal meal) => meal.id == mealID,
    )
        ? Icons.star
        : Icons.star_border;

    return icon;
  }

  @override
  Widget build(BuildContext context) {
    print('Rebuilding Main');
    final _pages = [
      {
        'title': 'Categories',
        'page': CategoriesScreen(
          categoryList: _allCategories,
        ),
      },
      {
        'title': 'Favourites',
        'page': FavouritesScreen(
          favouritesHandler: toggleFavourite,
          favouriteMeals: _favouriteMeals,
          isFavouriteIcon: isFavouriteIcon,
        ),
      },
    ];

    return MaterialApp(
      title: 'DeliMeals',
      debugShowCheckedModeBanner: false,
      theme: CustomTheme().theme,
      //home:  CategoryOverviewScreen(categoryList: DUMMY_CATEGORIES,),
      initialRoute: '/', // default is '/'
      routes: {
        '/': (ctx) => TabsScreen(
              pages: _pages,
            ),
        CategoryMealsScreen.routeName: (ctx) => CategoryMealsScreen(
              favouritesHandler: toggleFavourite,
              isFavouriteIcon: isFavouriteIcon,
              meals: _availableMeals,
            ),
        MealDetailsScreen.routeName: (ctx) => MealDetailsScreen(
              isFavouriteIcon: isFavouriteIcon,
              favouritesHandler: toggleFavourite,
            ),
        FilterSettingsScreen.routeName: (ctx) => FilterSettingsScreen(
              filterSettings: filterSettings,
              saveFilterSettingsHandler: saveFilters,
            ),
      },
    );
  }
}
