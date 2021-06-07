import 'package:flutter/material.dart';
import 'package:third/models/meal.dart';
import 'package:third/screens/categories_screen.dart';
import 'package:third/screens/favorites_screen.dart';
import 'package:third/widgets/myDrawer.dart';

class TabsScreen extends StatefulWidget {
  final List<Meal> favoriteMeals;

  const TabsScreen(this.favoriteMeals);
  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  List<Map<String,Object>>_pages;
  int _selectedIndex = 0;

  void _selectPage(int index){
    setState(() {
      _selectedIndex = index;
    });
  }
  @override
  void initState() {
    _pages=[
    {'page':CategoriesScreen(),'title':'Categories'},
    {'page':FavoritesScreen(widget.favoriteMeals),'title':'Favorites'},
  ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(_pages[_selectedIndex]['title'] as String),
        ),
        drawer: MyDrawer(),
        body: _pages[_selectedIndex]['page'] as Widget,
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Theme.of(context).primaryColor,
          items: [
            BottomNavigationBarItem(icon:Icon(Icons.category),label: "Categories",),
            BottomNavigationBarItem(icon:Icon(Icons.star),label: "Favorites",),
          ],
          currentIndex: _selectedIndex,
          selectedItemColor: Colors.white70,
           onTap: _selectPage,
        ),
       
    );
  }
}
