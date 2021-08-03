import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../screens/meal_details_screen.dart';
import '../models/meal.dart';

class MealItem extends StatelessWidget {
  final Meal meal;
  final Function favouritesHandler;
  final Function isFavouriteIcon;

  const MealItem({
    Key? key,
    required this.meal,
    required this.favouritesHandler,
    required this.isFavouriteIcon,
  }) : super(key: key);

  void selectMeal(BuildContext cntx) {
    final args = {'meal': meal};
    Navigator.of(cntx).pushNamed(
      MealDetailsScreen.routeName,
      arguments: args,
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => selectMeal(context),
      child: Card(
        elevation: 4,
        margin: const EdgeInsets.all(10),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        child: Column(
          children: [
            MealItemBody(
              mealID: meal.id,
              imageUrl: meal.imageUrl,
              title: meal.title,
              favouritesHandler: favouritesHandler,
              isFavouriteIcon: isFavouriteIcon,
            ),
            MealItemFooter(
              affordability: meal.affordability,
              complexity: meal.complexity,
              duration: meal.duration,
            ),
          ],
        ),
      ),
    );
  }
}

class MealItemBody extends StatelessWidget {
  final String mealID;
  final String imageUrl;
  final String title;
  final Function favouritesHandler;
  final Function isFavouriteIcon;

  const MealItemBody({
    Key? key,
    required this.imageUrl,
    required this.mealID,
    required this.title,
    required this.favouritesHandler,
    required this.isFavouriteIcon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ClipRRect(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(15),
            topRight: Radius.circular(15),
          ),
          child: Image.network(
            imageUrl,
            height: 250,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
        ),
        Positioned(
          bottom: 20,
          right: 10,
          child: Container(
            color: Colors.black54,
            width: 300,
            child: Text(
              title,
              style: const TextStyle(
                fontSize: 26,
                color: Colors.white,
              ),
              softWrap: true,
              overflow: TextOverflow.fade,
            ),
          ),
        ),
      ],
    );
  }
}

class MealItemFooter extends StatelessWidget {
  final int duration;
  final Complexity complexity;
  final Affordability affordability;

  const MealItemFooter({
    Key? key,
    required this.affordability,
    required this.complexity,
    required this.duration,
  }) : super(key: key);

  Widget buildFooterItem({
    required IconData icon,
    required String text,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Icon(icon),
        Padding(
          padding: const EdgeInsets.all(4.0),
          child: FittedBox(
            fit: BoxFit.fitWidth,
            child: Text(
              text,
              overflow: TextOverflow.fade,
              softWrap: true,
            ),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        buildFooterItem(icon: Icons.timelapse, text: '$duration min'),
        buildFooterItem(
          icon: Icons.tungsten,
          text: complexity.toString(),
        ),
        buildFooterItem(
          icon: Icons.attach_money,
          text: affordability.toString(),
        ),
      ],
    );
  }
}
