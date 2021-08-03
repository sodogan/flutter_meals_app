import 'package:flutter/material.dart';
import '../widgets/category_item.dart';
import '../models/category.dart';

class CategoriesScreen extends StatelessWidget {
  final List<Category> categoryList;

  const CategoriesScreen({
    Key? key,
    required this.categoryList,
  }) : super(key: key);

  List<Widget> get categoryItems {
    return categoryList
        .map(
          (category) => CategoryItem(category),
        )
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return GridView(
      padding: const EdgeInsets.all(
        25,
      ),
      children: categoryItems,
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 200,
        //childAspectRatio: 3 / 2,
        crossAxisSpacing: 20,
        mainAxisSpacing: 20,
      ),
    );
  }
}
