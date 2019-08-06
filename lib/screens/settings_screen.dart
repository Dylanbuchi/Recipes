import 'package:flutter/material.dart';
import 'package:recipes/widgets/drawer.dart';

class SettingScreen extends StatelessWidget {
  static const routeName = '/settings';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('settings'),
      ),
      drawer: MyDrawer(),
      body: Center(
        child: Text('data'),
      ),
    );
  }
}
