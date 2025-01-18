class Recipe {
  final String strMeal;
  final String strMealThumb;
  final String idMeal;

  Recipe({
    required this.strMeal,
    required this.strMealThumb,
    required this.idMeal,
  });

  factory Recipe.fromJson(Map<String, dynamic> json) {
    return Recipe(
      strMeal: json['strMeal'],
      strMealThumb: json['strMealThumb'],
      idMeal: json['idMeal'],
    );
  }
}
