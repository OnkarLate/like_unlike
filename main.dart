import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Like Dislike',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  List<Map<String, dynamic>> items = [
    {'name': 'hair oil', 'price': 10.0},
    {'name': 'shampoo', 'price': 20.0},
    {'name': 'tooth pest', 'price': 30.0},
  ];

  Map<String, bool> likedItems = {};

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: ListView.builder(
        itemCount: widget.items.length,
        itemBuilder: (context, index) {
          String itemName = widget.items[index]['name'];
          double itemPrice = widget.items[index]['price'];
          bool isLiked = widget.likedItems[itemName] ?? false;
          return ListTile(
            title: Text(itemName),
            subtitle: Text('\$$itemPrice'),
            trailing: IconButton(
              icon: Icon(
                isLiked ? Icons.favorite : Icons.favorite_border,
                color: isLiked ? Colors.red : null,
              ),
              onPressed: () {
                setState(() {
                  widget.likedItems[itemName] = !isLiked;
                });
              },
            ),
          );
        },
      ),
    );
  }
}
