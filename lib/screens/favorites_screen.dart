import 'package:flutter/material.dart';
import 'package:recipes/models/meal.dart';
import 'package:recipes/widgets/meal_item.dart';

class FavoriteScreen extends StatelessWidget {
  final List<Meal> favoritesMeals;

  FavoriteScreen(this.favoritesMeals);

  @override
  Widget build(BuildContext context) {
    if (favoritesMeals.isEmpty) {
      return Center(
        child: Container(
          child: Text(
            'You have no favourites yet',
            style: Theme.of(context).textTheme.title,
          ),
        ),
      );
    } else {
      return ListView.builder(
        itemBuilder: (ctx, index) {
          return MealItem(
            id: favoritesMeals[index].id,
            title: favoritesMeals[index].title,
            imageUrl: favoritesMeals[index].imageUrl,
            duration: favoritesMeals[index].duration,
            affordability: favoritesMeals[index].affordability,
            complexity: favoritesMeals[index].complexity,
          );
        },
        itemCount: favoritesMeals.length,
      );
    }
  }
}
