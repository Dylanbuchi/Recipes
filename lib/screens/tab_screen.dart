import 'package:flutter/material.dart';
import 'favorites_screen.dart';
import 'categories_screen.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:recipes/widgets/drawer.dart';

const _iconSize = 30.0;

class TabScreen extends StatefulWidget {
  @override
  _TabScreenState createState() => _TabScreenState();
}

class _TabScreenState extends State<TabScreen> {
  final List<Map<String, Object>> _pages = [
    {
      'page': CategoriesScreen(),
      'title': 'Categories',
    },
    {
      'page': FavoriteScreen(),
      'title': 'Your Favorite Meals',
    },
  ];

  int _pageIndex = 0;
  void _selectPage(int index) {
    setState(() {
      _pageIndex = index;
    });
  }

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
