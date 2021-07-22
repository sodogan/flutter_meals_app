import 'package:flutter/material.dart';
import '../screens/category_meals_screen.dart';
import '../models/category.dart';

class CategoryItem extends StatelessWidget {
  final Category category;

  const CategoryItem({
    Key? key,
    required this.category,
  }) : super(key: key);

  void handlePress({
    required BuildContext context,
    required Category category,
  }) {
    Map<String, String> args = {
      'id': category.id,
      'title': category.title,
    };

    Navigator.of(context).pushNamed(
      CategoryMealsScreen.routeName,
      arguments: args,
    );
    /*
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) {
          return CategoryMealsScreen(
            selectedID: category.id,
            selectedTitle: category.title,
          );
        },
      ),
    );
   */
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => handlePress(
        context: context,
        category: category,
      ),
      splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(15),
      child: Container(
          padding: const EdgeInsets.all(15),
          child: Text(
            category.title,
            style: Theme.of(context).textTheme.bodyText2,
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            gradient: LinearGradient(
              colors: [
                category.color.withOpacity(0.7),
                category.color,
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          )),
    );
  }
}
