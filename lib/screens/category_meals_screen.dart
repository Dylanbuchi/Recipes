import 'package:flutter/material.dart';
import '../widgets/meal_item.dart';
import 'package:recipes/models/meal.dart';

class CategoryMealsScreen extends StatefulWidget {
  static const routeName = '/category-meals';

  final List<Meal> availableMeals;
  CategoryMealsScreen(this.availableMeals);

  @override
  _CategoryMealsScreenState createState() => _CategoryMealsScreenState();
}

class _CategoryMealsScreenState extends State<CategoryMealsScreen> {
  String categoryTitle;
  List<Meal> displayedMeal;
  bool _loadInitState = false;

  @override
  void didChangeDependencies() {
    if (!_loadInitState) {
      final routeArgs =
          ModalRoute.of(context).settings.arguments as Map<String, String>;
      categoryTitle = routeArgs['title'];
      final categoryId = routeArgs['id'];
      displayedMeal = widget.availableMeals.where((meal) {
        return meal.categories.contains(categoryId);
      }).toList();
      _loadInitState = true;
    }
    super.didChangeDependencies();
  }

  void _removeMeal(String mealId) {
    setState(() {
      displayedMeal.removeWhere((meal) => meal.id == mealId);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle),
      ),
      body: ListView.builder(
        itemBuilder: (ctx, index) {
          return MealItem(
            id: displayedMeal[index].id,
            title: displayedMeal[index].title,
            imageUrl: displayedMeal[index].imageUrl,
            duration: displayedMeal[index].duration,
            affordability: displayedMeal[index].affordability,
            complexity: displayedMeal[index].complexity,
          );
        },
        itemCount: displayedMeal.length,
      ),
    );
  }
}
