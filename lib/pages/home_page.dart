import 'package:flutter/material.dart';
import 'package:learn_flutter/widgets/drawer.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter Catalog'),
        centerTitle: true,
      ),
      body: Center(child: Text('This is Home Page')),
      drawer: MyDrawer(),
    );
  }
}