import 'package:flutter/material.dart';
import '/widgets/meal_item.dart';
import '../models/meal.dart';

class FavouritesScreen extends StatelessWidget {
  final List<Meal> favouriteMeals;
  final Function favouritesHandler;
  final Function isFavouriteIcon;

  const FavouritesScreen({
    Key? key,
    required this.favouriteMeals,
    required this.favouritesHandler,
    required this.isFavouriteIcon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return favouriteMeals.isEmpty
        ? Container(
            child: Center(
              child: Text(
                'You have no favourittes yet!!',
              ),
            ),
          )
        : ListView.builder(
            itemBuilder: (BuildContext context, int index) {
              final _meal = favouriteMeals[index];
              return MealItem(
                meal: _meal,
                favouritesHandler: favouritesHandler,
                isFavouriteIcon: isFavouriteIcon,
              );
            },
            itemCount: favouriteMeals.length,
          );
  }
}
