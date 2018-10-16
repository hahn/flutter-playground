import 'package:flutter/material.dart';

import 'routes.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter Demo',
      theme: new ThemeData(
        primarySwatch: Colors.red,
        primaryColor: Colors.green
      ),
      home: new MainApp(),
      routes: routes,
      debugShowCheckedModeBanner: false,
    );
  }
}

class MainApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MainApp();
  }
}

class _MainApp extends State<MainApp> {


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text("Playground"),
      ),
      body: _buildLayout(),
    );

  }

  Widget _buildLayout(){
    return ListView(
      children: <Widget>[
        _buildRow("Autocomplete", "/autocomplete"),
        _buildRow("Splash Logo", "/splash"),
        _buildRow("Navigasi", "/navigasi"),
        _buildRow("Bubble", "/bubble"),
        _buildRow("Rating Star", "/rating"),
        _buildRow("Appbar bottom Widget", "/appbar"),
        _buildRow("Welcome page", "/welcome"),
        _buildRow("Test", "/tes"),
        _buildRow("Carousel Pro", "/carouselpro"),
      ],
    );
  }

  Widget _buildRow(String title, String nav){
    return InkWell(
      onTap: (){
        print("title: $title");
        Navigator.of(context).pushNamed(nav);
      },
      child: Container(
        padding: EdgeInsets.all(8.0),
        child: ListTile(
          title: Text(title),
        ),
      ),
    );
  }
}
