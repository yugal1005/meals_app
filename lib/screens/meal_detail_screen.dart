import 'package:flutter/material.dart';
import '../dummy_data.dart';

class MealsDetailScreen extends StatelessWidget {
  static const routeName = "/meal-detail";
  final Function togglefavorite;
  final Function isFavorite;
  MealsDetailScreen(this.isFavorite, this.togglefavorite);
  Widget buildSelectionTitle(BuildContext context, String title) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Text(title, style: Theme.of(context).textTheme.title),
    );
  }

  Widget buildContainer(Widget child) {
    return Container(
      height: 150,
      width: 350,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: Colors.grey,
        ),
        color: Colors.white,
      ),
      padding: EdgeInsets.all(5),
      margin: EdgeInsets.all(5),
      child: child,
    );
  }

  @override
  Widget build(BuildContext context) {
    final mealId = ModalRoute.of(context).settings.arguments as String;
    final selectedMeal = DUMMY_MEALS.firstWhere((meal) => mealId == meal.id);
    print(mealId);
    return Scaffold(
      appBar: AppBar(
        title: Text("${selectedMeal.title}"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              child: Image.network(
                selectedMeal.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
            buildSelectionTitle(context, "Ingredients"),
            buildContainer(
              ListView.builder(
                itemBuilder: (ctx, index) => Column(
                  children: [
                    ListTile(
                      leading: CircleAvatar(
                        backgroundColor: Theme.of(context).primaryColor,
                        child: Text("${index + 1}"),
                      ),
                      title: Text(
                        selectedMeal.ingredients[index],
                        style: Theme.of(context).textTheme.bodyText1,
                      ),
                    ),
                    const Divider(
                      thickness: 2,
                    ),
                  ],
                ),
                itemCount: selectedMeal.ingredients.length,
              ),
            ),
            buildSelectionTitle(context, "Steps"),
            buildContainer(
              ListView.builder(
                itemBuilder: (ctx, index) => Column(
                  children: [
                    ListTile(
                      leading: CircleAvatar(
                        backgroundColor: Theme.of(context).primaryColor,
                        child: Text("${index + 1}"),
                      ),
                      title: Text(
                        selectedMeal.steps[index],
                        style: Theme.of(context).textTheme.bodyText1,
                      ),
                    ),
                    const Divider(
                      thickness: 2,
                    ),
                  ],
                ),
                itemCount: selectedMeal.steps.length,
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(isFavorite(mealId) ? Icons.star : Icons.star_border),
        onPressed: () => togglefavorite(mealId),
      ),
    );
  }
}
