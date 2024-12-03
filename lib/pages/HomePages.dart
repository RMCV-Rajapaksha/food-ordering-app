// lib/main.dart
import 'package:flutter/material.dart';
import 'package:food_ordering_app/pages/foodDescriptionPage.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<dynamic> meals = [];
  TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    fetchRandomMeals();
  }

  Future<void> fetchRandomMeals() async {
    final response = await http.get(
      Uri.parse('https://www.themealdb.com/api/json/v1/1/random.php'),
    );

    if (response.statusCode == 200) {
      setState(() {
        meals = json.decode(response.body)['meals'];
      });
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to load meals')),
      );
    }
  }

  Future<void> searchMeals(String query) async {
    final response = await http.get(
      Uri.parse('https://www.themealdb.com/api/json/v1/1/search.php?s=$query'),
    );

    if (response.statusCode == 200) {
      setState(() {
        meals = json.decode(response.body)['meals'] ?? [];
      });
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to search meals')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Meal Explorer'),
        actions: [
          IconButton(
            icon: Icon(Icons.refresh),
            onPressed: fetchRandomMeals,
          ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: _searchController,
              decoration: InputDecoration(
                hintText: 'Search meals...',
                suffixIcon: IconButton(
                  icon: Icon(Icons.search),
                  onPressed: () => searchMeals(_searchController.text),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
          ),
          Expanded(
            child: meals.isEmpty
                ? Center(child: CircularProgressIndicator())
                : ListView.builder(
                    itemCount: meals.length,
                    itemBuilder: (context, index) {
                      final meal = meals[index];
                      return ListTile(
                        leading: Image.network(
                          meal['strMealThumb'],
                          width: 80,
                          height: 80,
                          fit: BoxFit.cover,
                        ),
                        title: Text(meal['strMeal']),
                        subtitle: Text(meal['strCategory'] ?? 'Unknown'),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => MealDetailPage(
                                mealId: meal['idMeal'],
                              ),
                            ),
                          );
                        },
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }
}
