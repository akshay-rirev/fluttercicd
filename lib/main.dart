import 'package:flutter/material.dart';

void main() {
  startApp();
}

void startApp() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<String> items = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Container(
            color: Colors.yellow,
            child: ListTile(
              key: ValueKey<String>('AddItem'),
              title: Text('Add new item in list in list'),
              onTap: () {
                setState(() {
                  items.add('My new item ${items.length}');
                });
              },
            ),
          ),
          ...List.generate(items.length, (int index) {
            return ListTile(
              title: Text(items[index]),
            );
          }),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        key: ValueKey<String>('ClearItem'),
        child: Icon(Icons.clear_all),
        onPressed: () {
          setState(() {
            items.clear();
          });
        },
      ),
    );
  }
}
