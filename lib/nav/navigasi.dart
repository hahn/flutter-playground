import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class SecondPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Container(
      color: Colors.green,
      child: new Column(
        children: <Widget>[
          new RaisedButton(
            onPressed: () => Navigator.pop(context),
            child: new Text("back"),
          ),
        ],
      ),
    );
  }
}

class FirstPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new FirstPageState();
}

class FirstPageState extends State<FirstPage> {

  Color color = Colors.white;

  void waktu(){
    var anu = DateTime.now().toLocal();
    String formattedDate = DateFormat('kk:mm').format(anu);

    print(anu);
    print(formattedDate);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: new Container(
        color: color,
        child: Center(
          child: new Column(
            children: <Widget>[
              new RaisedButton(
                  child: new Text("next"),
                  onPressed: () {
                    Navigator
                        .push(
                      context,
                      new MaterialPageRoute(builder: (context) => new SecondPage()),
                    )
                        .then((value) {
                      setState(() {
                        waktu();
                        print("value: $value");
                        color = color == Colors.white ? Colors.grey : Colors.white;
                      });
                    });
                  }),
              Text("anu")
            ],
          ),
        ),
      ),
    );
  }
}