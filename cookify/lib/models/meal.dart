class Meal {
  final String strMeal;
  final String strMealThumb;
  final String strInstructions;
  final String? strYoutube;

  Meal({
    required this.strMeal,
    required this.strMealThumb,
    required this.strInstructions,
    this.strYoutube,
  });

  factory Meal.fromJson(Map<String, dynamic> json) {
    return Meal(
      strMeal: json['strMeal'],
      strMealThumb: json['strMealThumb'],
      strInstructions: json['strInstructions'],
      strYoutube: json['strYoutube'],
    );
  }
}
