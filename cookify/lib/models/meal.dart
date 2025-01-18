class Meal {
  final String strMeal;
  final String strMealThumb;
  final String strInstructions;

  Meal({
    required this.strMeal,
    required this.strMealThumb,
    required this.strInstructions,
  });

  factory Meal.fromJson(Map<String, dynamic> json) {
    return Meal(
      strMeal: json['strMeal'],
      strMealThumb: json['strMealThumb'],
      strInstructions: json['strInstructions'],
    );
  }
}
