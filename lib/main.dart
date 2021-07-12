import 'package:flutter/material.dart';
import 'package:flutter_meals_app/dummy_data.dart';
import './categories_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DeliMeals',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('DeliMeals'),
        ),
        body: const _MyMealApp());
  }
}

class _MyMealApp extends StatelessWidget {
  const _MyMealApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(children: [
        const CategoriesScreen(
          categoryList: DUMMY_CATEGORIES,
        ),
      ]),
    );
  }
}
