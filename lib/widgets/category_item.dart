import 'package:flutter/material.dart';
import '../screens/category_meals_screen.dart';
import '../models/category.dart';

class CategoryItem extends StatelessWidget {
  final Category _category;

  static const double opacity = 0.3;

  const CategoryItem(
    this._category, {
    Key? key,
  }) : super(key: key);

  get category => _category;

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
              category.color.withOpacity(opacity),
              category.color,
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
      ),
    );
  }
}
