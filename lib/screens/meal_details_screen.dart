import 'package:flutter/material.dart';
import '../models/meal.dart';
import '../models/dummy_data.dart';

class MealDetailsScreen extends StatelessWidget {
  static const String _routeName = "/meal-details";
  final Function favouritesHandler;
  final Function isFavouriteIcon;

  const MealDetailsScreen({
    Key? key,
    required this.favouritesHandler,
    required this.isFavouriteIcon,
  }) : super(key: key);

  static get routeName => _routeName;

  Meal fetchMealByID({
    required String mealID,
  }) =>
      DUMMY_MEALS.firstWhere((element) => element.id == mealID);

  Widget labelBuilder({
    required BuildContext context,
    required String label,
  }) {
    return Container(
      //color: Theme.of(context).backgroundColor,
      margin: EdgeInsets.symmetric(
        vertical: 10,
      ),
      child: Text(
        label,
        style: TextStyle(
          color: Colors.black38,
        ),
        softWrap: true,
      ),
    );
  }

  Widget buildContainer({required Widget child}) {
    return Container(
      height: 200,
      padding: EdgeInsets.all(12),
      margin: EdgeInsets.all(10),
      width: 300,
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.grey,
        ),
        borderRadius: BorderRadius.circular(10),
      ),
      child: child,
    );
  }

  @override
  Widget build(BuildContext context) {
    final _args = ModalRoute.of(context)?.settings.arguments as Map;
    Meal _meal = fetchMealByID(mealID: _args['meal_id']);

    return Scaffold(
      appBar: AppBar(
        title: Text('${_meal.title}'),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            labelBuilder(context: context, label: 'Ingredients'),
            buildContainer(
              child: ListView.builder(
                itemBuilder: (BuildContext context, int index) {
                  final _ingredient = _meal.ingredients[index];
                  return Card(
                    child: Padding(
                      padding: EdgeInsets.all(8),
                      child: Text(
                        _ingredient,
                      ),
                    ),
                  );
                },
                itemCount: _meal.ingredients.length,
              ),
            ),
            const Divider(
              height: 12,
            ),
            labelBuilder(context: context, label: 'Steps'),
            buildContainer(
              child: ListView.builder(
                  itemBuilder: (BuildContext context, int index) {
                    final _step = _meal.steps[index];
                    final int _counter = index + 1;
                    return Column(
                      children: [
                        ListTile(
                          leading: CircleAvatar(
                            backgroundColor: Theme.of(context).primaryColor,
                            child: Text(_counter.toString()),
                          ),
                          title: Text(
                            _step,
                          ),
                        ),
                        Divider(
                          color: Colors.grey,
                        )
                      ],
                    );
                  },
                  itemCount: _meal.steps.length),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => favouritesHandler(_meal.id),
        child: Icon(
          isFavouriteIcon(_meal.id),
        ),
      ),
    );
  }
}
