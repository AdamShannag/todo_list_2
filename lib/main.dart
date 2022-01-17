import 'package:flutter/material.dart';

import './item_list.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  final List<String> listItems = [];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          primarySwatch: Colors.amber,
          colorScheme: ThemeData.light().colorScheme.copyWith(
                secondary: Colors.purple,
                primary: Colors.purple,
                error: Colors.indigo,
              )),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Todo List'),
        ),
        body: SingleChildScrollView(child: ItemList(listItems)),
      ),
    );
  }
}
