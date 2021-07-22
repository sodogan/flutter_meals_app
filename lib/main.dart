import 'package:flutter/material.dart';
import 'package:flutter_meals_app/screens/meal_details_screen.dart';
import 'custom_theme.dart';
import '/models/dummy_data.dart';
import 'screens/category_meals_screen.dart';
import 'screens/categories_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final override = ThemeData.light().textTheme.copyWith(
          headline6: const TextStyle(
            color: Colors.white,
            fontFamily: 'RobotoCondensed',
            fontSize: 14,
          ),
          bodyText1: const TextStyle(
            color: Colors.amber,
            fontSize: 18,
          ),
          bodyText2: const TextStyle(
            color: Colors.purple,
            fontSize: 10,
            fontWeight: FontWeight.bold,
          ),
        );

    return MaterialApp(
      title: 'DeliMeals',
      debugShowCheckedModeBanner: false,
      theme: CustomTheme().theme,
      //home:  CategoryOverviewScreen(categoryList: DUMMY_CATEGORIES,),
      initialRoute: '/', // default is '/'
      routes: {
        '/': (ctx) => CategoriesScreen(
              categoryList: DUMMY_CATEGORIES,
            ),
        CategoryMealsScreen.routeName: (ctx) => const CategoryMealsScreen(),
        MealDetailsScreen.routeName: (ctx) => const MealDetailsScreen(),
      },
    );
  }
}
