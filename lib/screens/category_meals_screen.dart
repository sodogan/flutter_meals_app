import 'package:flutter/material.dart';
import '../widgets/meal_item.dart';
import '../models/meal.dart';
import '../models/dummy_data.dart';

class CategoryMealsScreen extends StatelessWidget {
  static const String _routeName = "/category-details";

  const CategoryMealsScreen({
    Key? key,
  }) : super(key: key);

  static get routeName => _routeName;

  //filter based on Category ID
  List<Meal> filterMealsBasedOnCategoryID({String? categoryID}) {
    return DUMMY_MEALS.where((Meal meal) {
      return meal.categoriesBelongTo.contains(categoryID);
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    //Read the args thats passed into here!
    final routeArgs =
        ModalRoute.of(context)?.settings.arguments as Map<String, String>;

    final selectedID = routeArgs['id'];
    final selectedTitle = routeArgs['title'];

    final _matchingMealsList =
        filterMealsBasedOnCategoryID(categoryID: selectedID);

    return Scaffold(
      appBar: AppBar(
        title: Text(selectedTitle!),
      ),
      body: ListView.builder(
        itemBuilder: (BuildContext context, int index) {
          final _meal = _matchingMealsList[index];
          return MealItem(
            id: _meal.id,
            title: _meal.title,
            imageUrl: _meal.imageUrl,
            duration: _meal.duration,
            affordability: _meal.affordability,
            complexity: _meal.complexity,
          );
        },
        itemCount: _matchingMealsList.length,
      ),
    );
  }
}
