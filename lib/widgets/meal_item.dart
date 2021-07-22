import 'package:flutter/material.dart';
import '../screens/meal_details_screen.dart';
import '../models/meal.dart';

class MealItem extends StatelessWidget {
  final String id;
  final String title;
  final String imageUrl;
  final int duration;
  final Complexity complexity;
  final Affordability affordability;

  const MealItem({
    Key? key,
    required this.id,
    required this.title,
    required this.imageUrl,
    required this.complexity,
    required this.duration,
    required this.affordability,
  }) : super(key: key);

  void selectMeal(BuildContext cntx) {
    final args = {'meal_id': id};
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
            Stack(
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
            ),
            MealItemFooter(
              affordability: affordability,
              complexity: complexity,
              duration: duration,
            ),
          ],
        ),
      ),
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
          padding: const EdgeInsets.all(8.0),
          child: Text(
            text,
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
        buildFooterItem(icon: Icons.tungsten, text: '$complexity'),
        buildFooterItem(icon: Icons.attach_money, text: '$affordability'),
      ],
    );
  }
}