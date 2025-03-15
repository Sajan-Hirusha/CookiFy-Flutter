import 'dart:convert';  // For encoding and decoding JSON
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MealPlanPage extends StatefulWidget {
  const MealPlanPage({super.key});

  @override
  _MealPlanPageState createState() => _MealPlanPageState();
}

class _MealPlanPageState extends State<MealPlanPage> {
  final List<String> days = [
    "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday", "Sunday"
  ];
  String selectedDay = "Monday";
  String selectedMeal = "";
  final TextEditingController mealController = TextEditingController();

  Map<String, Map<String, String>> weeklyPlan = {};

  @override
  void initState() {
    super.initState();
    _loadMealPlans();
  }

  // Load the meal plans from shared_preferences
  _loadMealPlans() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? storedPlans = prefs.getString('weeklyPlan');
    if (storedPlans != null) {
      setState(() {
        weeklyPlan = Map<String, Map<String, String>>.from(
          jsonDecode(storedPlans).map((key, value) => MapEntry(key, Map<String, String>.from(value))),
        );
      });
    }
  }

  // Save the meal plans to shared_preferences
  _saveMealPlans() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String encodedData = jsonEncode(weeklyPlan);
    prefs.setString('weeklyPlan', encodedData);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Meal Plans'),
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.teal, Colors.green],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              // Header Image
              ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Image.asset(
                  'assets/images/mealPlan.jpg',
                  width: double.infinity,
                  height: 150,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(height: 20),

              // Dropdown to select the day of the week
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Colors.teal.shade50,
                ),
                child: DropdownButton<String>(
                  value: selectedDay,
                  onChanged: (value) {
                    setState(() {
                      selectedDay = value!;
                    });
                  },
                  items: days.map((day) {
                    return DropdownMenuItem(
                      value: day,
                      child: Text(
                        day,
                        style: const TextStyle(color: Colors.teal, fontSize: 18),
                      ),
                    );
                  }).toList(),
                  isExpanded: true,
                  dropdownColor: Colors.white,
                ),
              ),
              const SizedBox(height: 20),

              // Buttons to select the meal type
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        setState(() {
                          selectedMeal = "Breakfast";
                        });
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: selectedMeal == "Breakfast" ? Colors.teal : Colors.grey.shade300,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                        elevation: 5,
                        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                      ),
                      child: Text(
                        "Breakfast",
                        style: TextStyle(fontSize: 16, color: selectedMeal == "Breakfast" ? Colors.white : Colors.teal),
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        setState(() {
                          selectedMeal = "Lunch";
                        });
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: selectedMeal == "Lunch" ? Colors.teal : Colors.grey.shade300,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                        elevation: 5,
                        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                      ),
                      child: Text(
                        "Lunch",
                        style: TextStyle(fontSize: 16, color: selectedMeal == "Lunch" ? Colors.white : Colors.teal),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        setState(() {
                          selectedMeal = "Snack";
                        });
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: selectedMeal == "Snack" ? Colors.teal : Colors.grey.shade300,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                        elevation: 5,
                        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                      ),
                      child: Text(
                        "Snack",
                        style: TextStyle(fontSize: 16, color: selectedMeal == "Snack" ? Colors.white : Colors.teal),
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        setState(() {
                          selectedMeal = "Dinner";
                        });
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: selectedMeal == "Dinner" ? Colors.teal : Colors.grey.shade300,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                        elevation: 5,
                        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                      ),
                      child: Text(
                        "Dinner",
                        style: TextStyle(fontSize: 16, color: selectedMeal == "Dinner" ? Colors.white : Colors.teal),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),

              // TextField to enter meal details and Save button
              if (selectedMeal.isNotEmpty)
                Column(
                  children: [
                    TextField(
                      controller: mealController,
                      decoration: InputDecoration(
                        labelText: "Enter $selectedMeal meal",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        filled: true,
                        fillColor: Colors.teal.shade50,
                        contentPadding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                      ),
                    ),
                    const SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          weeklyPlan[selectedDay] ??= {};
                          weeklyPlan[selectedDay]![selectedMeal] = mealController.text;
                          mealController.clear();
                          _saveMealPlans();  // Save to local storage
                        });
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.teal,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                      ),
                      child: const Text(
                        "Save Meal",
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                  ],
                ),
              const SizedBox(height: 20),

              // Displaying saved meal plans
              SizedBox(
                height: 300, // Fixed height for scrollability
                child: SingleChildScrollView(
                  child: Column(
                    children: weeklyPlan.entries.map((entry) {
                      return Card(
                        margin: const EdgeInsets.all(8),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        elevation: 5,
                        child: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                entry.key,
                                style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                              ),
                              const SizedBox(height: 8),
                              ...entry.value.entries.map((mealEntry) {
                                return Padding(
                                  padding: const EdgeInsets.symmetric(vertical: 4.0),
                                  child: Row(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Expanded(
                                        child: Text(
                                          "${mealEntry.key}: ${mealEntry.value}",
                                          style: const TextStyle(fontSize: 16),
                                          softWrap: true,
                                        ),
                                      ),
                                      IconButton(
                                        icon: const Icon(Icons.delete, color: Colors.red),
                                        onPressed: () {
                                          setState(() {
                                            entry.value.remove(mealEntry.key);
                                            if (entry.value.isEmpty) {
                                              weeklyPlan.remove(entry.key);
                                            }
                                            _saveMealPlans();  // Save updated plan
                                          });
                                        },
                                      ),
                                    ],
                                  ),
                                );
                              }).toList(),
                            ],
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
