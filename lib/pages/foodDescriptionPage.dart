import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class MealDetailPage extends StatefulWidget {
  final String mealId;

  const MealDetailPage({Key? key, required this.mealId}) : super(key: key);

  @override
  _MealDetailPageState createState() => _MealDetailPageState();
}

class _MealDetailPageState extends State<MealDetailPage> {
  Map<String, dynamic>? meal;
  List<String> ingredients = [];
  List<String> measurements = [];

  @override
  void initState() {
    super.initState();
    fetchMealDetails();
  }

  Future<void> fetchMealDetails() async {
    final response = await http.get(
      Uri.parse(
          'https://www.themealdb.com/api/json/v1/1/lookup.php?i=${widget.mealId}'),
    );

    if (response.statusCode == 200) {
      final data = json.decode(response.body)['meals'][0];
      setState(() {
        meal = data;
        extractIngredientsAndMeasurements(data);
      });
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to load meal details')),
      );
    }
  }

  void extractIngredientsAndMeasurements(Map<String, dynamic> mealData) {
    ingredients.clear();
    measurements.clear();

    for (int i = 1; i <= 20; i++) {
      final ingredient = mealData['strIngredient$i'];
      final measurement = mealData['strMeasure$i'];

      if (ingredient != null && ingredient.isNotEmpty && ingredient != ' ') {
        ingredients.add(ingredient);
        measurements.add(measurement ?? '');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    if (meal == null) {
      return Scaffold(
        appBar: AppBar(title: Text('Loading...')),
        body: Center(child: CircularProgressIndicator()),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(meal!['strMeal']),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Image.network(
              meal!['strMealThumb'],
              height: 250,
              fit: BoxFit.cover,
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Ingredients',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 10),
                  ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: ingredients.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Text(ingredients[index]),
                        trailing: Text(measurements[index]),
                      );
                    },
                  ),
                  SizedBox(height: 20),
                  Text(
                    'Instructions',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    meal!['strInstructions'],
                  ),
                  if (meal!['strYoutube'] != null &&
                      meal!['strYoutube'].isNotEmpty)
                    Padding(
                      padding: const EdgeInsets.only(top: 20),
                      child: ElevatedButton(
                        onPressed: () {
                          // You would typically use a URL launcher here
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content:
                                  Text('YouTube link: ${meal!['strYoutube']}'),
                            ),
                          );
                        },
                        child: Text('Watch Tutorial'),
                      ),
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}