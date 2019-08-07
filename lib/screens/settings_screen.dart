import 'package:flutter/material.dart';
import 'package:recipes/widgets/drawer.dart';

class SettingScreen extends StatefulWidget {
  static const routeName = '/settings';

  final Function saveSettings;
  final Map<String, bool> currentSettings;

  SettingScreen(this.saveSettings, this.currentSettings);

  @override
  _SettingScreenState createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  bool _glutenFree = false;
  bool _vegetarian = false;
  bool _vegan = false;
  bool _lactoseFree = false;

  @override
  initState() {
    _glutenFree = widget.currentSettings['gluten'];
    _vegetarian = widget.currentSettings['vegetarian'];
    _vegan = widget.currentSettings['vegan'];
    _lactoseFree = widget.currentSettings['lactose'];
    super.initState();
  }

  Widget _buildSwitchListTile(String title, bool value, Function updateValue) {
    return SwitchListTile(
      title: Text(title),
      value: value,
      onChanged: updateValue,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Settings'),
        actions: <Widget>[],
      ),
      drawer: MyDrawer(),
      body: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(20),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: Text(
                'Adjust your meal selection here:',
                style: Theme.of(context).textTheme.title,
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: ListView(
                children: <Widget>[
                  _buildSwitchListTile(
                    'Glutten Free',
                    _glutenFree,
                    (v) {
                      setState(
                        () {
                          _glutenFree = v;
                        },
                      );
                    },
                  ),
                  _buildSwitchListTile(
                    'Vegetarian',
                    _vegetarian,
                    (v) {
                      setState(
                        () {
                          _vegetarian = v;
                        },
                      );
                    },
                  ),
                  _buildSwitchListTile(
                    'Vegan',
                    _vegan,
                    (v) {
                      setState(
                        () {
                          _vegan = v;
                        },
                      );
                    },
                  ),
                  _buildSwitchListTile(
                    'Lactose Free',
                    _lactoseFree,
                    (v) {
                      setState(
                        () {
                          _lactoseFree = v;
                        },
                      );
                    },
                  ),
                  Padding(
                    padding: const EdgeInsets.all(50.0),
                    child: FloatingActionButton(
                      elevation: 5,
                      child: Icon(
                        Icons.done,
                        size: 30,
                      ),
                      onPressed: () {
                        final selectedSettings = {
                          'gluten': _glutenFree,
                          'lactose': _lactoseFree,
                          'vegan': _vegan,
                          'vegetarian': _vegetarian,
                        };
                        widget.saveSettings(selectedSettings);
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
