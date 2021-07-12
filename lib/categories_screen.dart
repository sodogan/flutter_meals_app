import 'package:flutter/material.dart';
import 'package:flutter_meals_app/category_item.dart';
import './dummy_data.dart';
import './models/category.dart';

class CategoriesScreen extends StatelessWidget {
  final List<Category> categoryList;

  const CategoriesScreen({Key? key, required this.categoryList})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 400,
      child: GridView(
        children: [
          ...categoryList
              .map((Category category) => CategoryItem(category: category))
        ],
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 200,
          childAspectRatio: 3 / 2,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20,
        ),
      ),
    );

/*
    return ListView.builder(
      itemCount: categoryList.length,
      itemBuilder: (context, index) {
        return Card(
          elevation: 6,
          margin: const EdgeInsets.all(6),
          child: ListTile(
            leading: Icon(Icons.circle, color: categoryList[index].color),
            title: Text(categoryList[index].title),
            subtitle: Text(categoryList[index].id),
          ),
        );
      },
    );
*/
/*
    return Container(
      height: 300,
      child: ListView(
        children: [
          for (var category in DUMMY_CATEGORIES)
            Card(
              elevation: 6,
              margin: const EdgeInsets.all(6),
              child: ListTile(
                leading: Icon(Icons.circle, color: category.color),
                title: Text(category.title),
                subtitle: Text(category.id),
              ),
            )
        ],
      ),
    );
*/
/*
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        for (var category in DUMMY_CATEGORIES)
          Card(
            elevation: 6,
            margin: const EdgeInsets.all(6),
            child: ListTile(
              leading: Icon(Icons.circle, color: category.color),
              title: Text(category.title),
              subtitle: Text(category.id),
            ),
          )
      ],
    );
  }
  */
  }
}
