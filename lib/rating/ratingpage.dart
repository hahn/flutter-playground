import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'rating_star_widget.dart';
class Ratingpage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Rating"),
      ),
      body: _RatingpageStar(),
    );
  }
}

class _RatingpageStar extends StatefulWidget {

  @override
  State createState() {
    return _RatingStarState();
  }
}

class _RatingStarState extends State<_RatingpageStar> {
  double _rating = 3.5;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text("Rating:"),
            Padding(padding: EdgeInsets.only(top: 16.0),),
            RatingStar(
              rating: _rating,
              starCount: 5,
              onRatingChanged: (rat) {
                setState(() {
                  this._rating = rat;
                });
              },
            ),
            Padding(padding: EdgeInsets.only(top: 16.0),),
            Text("${_nilaiRating(this._rating.ceil())}"),
            Padding(padding: EdgeInsets.only(top: 64.0),),
            CupertinoButton(
              child: Text("Rating dialog"),
              onPressed: (){
                _ratingDialog();
              },
              color: Colors.blue,
            )

          ],
        ),
      ),
    );
  }

  String _nilaiRating(int nilai){
    var hasil = "biasa";
    switch(nilai){
      case 1:
        hasil = "Sangat jelek";
        break;
      case 2:
        hasil = "Jelek";
        break;
      case 3:
        hasil = "Biasa";
        break;
      case 4: hasil = "Bagus";
      break;
      case 5: hasil = "Bagus Sekali"; break;
    }
    return hasil;
  }

  void _ratingDialog() {
    showDialog(
      context: context,
      builder: (_) {
        return CupertinoAlertDialog(
          title: Text("Kasih Rating"),
          actions: <Widget>[
            FlatButton(onPressed: (){
              Navigator.pop(context);
            }, child: Text("OK"))
          ],
          content: Column(
            children: <Widget>[
              Text("Beri rating untuk aplikasi ini"),
              RatingStarFull(
                rating: _rating,
                starCount: 5,
                onRatingChanged: (rat) {
                  setState(() {
                    this._rating = rat;
                  });
                },
              ),
            ],
          ),
        );
      }
    );
  }
}
