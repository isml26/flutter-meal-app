import 'package:flutter/material.dart';
import 'package:third/widgets/myDrawer.dart';

class FiltersScreen extends StatefulWidget {
  static const routeName = '/filters';
  final Function saveFilters;
  FiltersScreen(this.saveFilters);
  @override
  _FilterScreenState createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FiltersScreen> {
  bool _glutenFree = false;
  bool _vegetarian = false;
  bool _vegan = false;
  bool _lactoseFree = false;

  Widget buildSwitchListTile(String title, bool current, dynamic update) {
    return SwitchListTile(
      activeColor: Colors.greenAccent,
      title: Text(title),
      value: current,
      onChanged: update,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("FilterScreen"),
          actions: [
            //IconButton(icon: Icon(Icons.save),onPressed: (){},)
          ],
        ),
        drawer: MyDrawer(),
        body: Column(
          children: [
            Container(
              padding: EdgeInsets.all(20),
              child: Text(
                "Adjust your meal selection",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
            ),
            Expanded(
              child: ListView(
                children: [
                  buildSwitchListTile("Gluten-free",_glutenFree, (newValue) {setState(() {_glutenFree = newValue;});},),
                  buildSwitchListTile("Vegatarian",_vegetarian, (newValue) {setState(() {_vegetarian = newValue;});},),
                  buildSwitchListTile("Vegan",_vegan, (newValue) {setState(() {_vegan = newValue;});},),
                  buildSwitchListTile("Lactose-free",_lactoseFree, (newValue) {setState(() {_lactoseFree = newValue;});},)
                ],
              ),
            ),
          ],
        ));
  }
}
