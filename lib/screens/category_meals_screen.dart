import 'package:flutter/material.dart';
import '../widgets/meal_item.dart';
import '../models/meal.dart';

class CategoryMealsScreen extends StatelessWidget {
  static const String _routeName = "/category-details";
  final List<Meal> meals;
  final Function favouritesHandler;
  final Function isFavouriteIcon;

  const CategoryMealsScreen({
    Key? key,
    required this.meals,
    required this.favouritesHandler,
    required this.isFavouriteIcon,
  }) : super(key: key);

  static get routeName => _routeName;

  //filter based on Category ID
  List<Meal> filterMealsBasedOnCategoryID({String? categoryID}) {
    return meals.where((Meal meal) {
      return meal.categoryIDSBelongTo.contains(categoryID);
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
            meal: _meal,
            favouritesHandler: favouritesHandler,
            isFavouriteIcon: isFavouriteIcon,
          );
        },
        itemCount: _matchingMealsList.length,
      ),
    );
  }
}
