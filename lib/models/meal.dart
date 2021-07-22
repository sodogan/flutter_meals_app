//enum Complexity { simple, challenging, hard }
//enum Affordability { affordable, pricey, luxurious }

class Complexity {
  final String _name;

  static const Complexity simple = Complexity._('simple');
  static const Complexity challenging = Complexity._('challenging');
  static const Complexity hard = Complexity._('hard');

  const Complexity._(this._name);

  @override
  String toString() => _name;
}

class Affordability {
  final String _name;

  static const Affordability affordable = Affordability._('affordable');
  static const Affordability luxurious = Affordability._('luxurious');
  static const Affordability pricey = Affordability._('pricey');

  const Affordability._(this._name);

  @override
  String toString() => _name;
}

class Meal {
  final String id;
  final String title;
  final int duration;
  final String imageUrl;

  final bool isGlutenFree;
  final bool isVegan;
  final bool isVegetarian;
  final bool isLactoseFree;

  final List<String> categories;
  final List<String> ingredients;
  final List<String> steps;
  final Affordability affordability;
  final Complexity complexity;

  const Meal({
    required this.id,
    required this.title,
    required this.categories,
    required this.ingredients,
    required this.isGlutenFree,
    required this.isLactoseFree,
    required this.isVegan,
    required this.isVegetarian,
    required this.steps,
    required this.affordability,
    required this.complexity,
    required this.duration,
    required this.imageUrl,
  });

  List<String> get categoriesBelongTo => categories;
}
