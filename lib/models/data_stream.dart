import 'package:flutter_meals_app/models/category.dart';

import 'dummy_data.dart';
import 'meal.dart';

Stream<Meal> buildMealStream() async* {
  final List<Meal> allMeals = DUMMY_MEALS;
  int index = 0;

  while (index < allMeals.length) {
    yield allMeals[index];
    index++;
  }
}

Future<List<Meal>> buildMealFuture() async {
  final List<Meal> resultList = [];
  final Stream<Meal> mealStream = buildMealStream();

  await for (final meal in mealStream) {
    resultList.add(meal);
  }

  return resultList;
}

Stream<Category> buildCategoryStream() async* {
  final List<Category> allCategories = DUMMY_CATEGORIES;
  int index = 0;

  while (index < allCategories.length) {
    yield allCategories[index];
    index++;
  }
}

Future<List<Category>> buildCategoryFuture() async {
  List<Category> categoryList = [];

  Stream<Category> categoryStream = buildCategoryStream();

  await for (final category in categoryStream) {
    categoryList.add(category);
  }
  return categoryList;
}
