import 'package:flutter/material.dart';
import 'favorites_screen.dart';
import 'categories_screen.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:recipes/widgets/drawer.dart';
import 'package:recipes/models/meal.dart';

const _iconSize = 30.0;

class TabScreen extends StatefulWidget {
  final List<Meal> favoriteMeals;

  TabScreen(this.favoriteMeals);

  @override
  _TabScreenState createState() => _TabScreenState();
}

class _TabScreenState extends State<TabScreen> {
  List<Map<String, Object>> _pages;

  @override
  void initState() {
    _pages = [
      {
        'page': CategoriesScreen(),
        'title': 'Categories',
      },
      {
        'page': FavoriteScreen(widget.favoriteMeals),
        'title': 'Your Favorite Meals',
      },
    ];

    super.initState();
  }

  void _selectPage(int index) {
    setState(() {
      _pageIndex = index;
    });
  }

  int _pageIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(_pages[_pageIndex]['title']),
      ),
      drawer: MyDrawer(),
      body: _pages[_pageIndex]['page'],
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectPage,
        backgroundColor: Theme.of(context).primaryColor,
        unselectedItemColor: Colors.black,
        selectedItemColor: Colors.white,
        currentIndex: _pageIndex,
        selectedFontSize: 16,
        unselectedFontSize: 12,
        type: BottomNavigationBarType.shifting,
        showSelectedLabels: true,
        items: [
          BottomNavigationBarItem(
            backgroundColor: Theme.of(context).primaryColor,
            icon: Icon(
              MaterialCommunityIcons.getIconData("food"),
              size: _iconSize,
            ),
            title: Text('Categories'),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              MaterialCommunityIcons.getIconData("star"),
              size: _iconSize,
            ),
            title: Text('Favorites'),
          ),
        ],
      ),
    );
  }
}
