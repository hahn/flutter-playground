import 'package:flutter/material.dart';

typedef void RatingChangeCallback(double rating);

class RatingStar extends StatelessWidget {

  final int starCount;
  final double rating;
  final RatingChangeCallback onRatingChanged;
  final Color color;


  RatingStar({this.starCount, this.rating, this.onRatingChanged, this.color});

  Widget buildStar(BuildContext context, int index) {
    Icon icon;
    if (index >= rating) {
      icon = new Icon(
        Icons.star_border,
        color: Theme.of(context).buttonColor,
      );
    }
    else if (index > rating - 1 && index < rating) {
      icon = new Icon(
        Icons.star_half,
        color: color ?? Theme.of(context).primaryColor,
      );
    } else {
      icon = new Icon(
        Icons.star,
        color: color ?? Theme.of(context).primaryColor,
      );
    }
    return new GestureDetector(
      onTap: onRatingChanged == null ? null : () => onRatingChanged(index + 1.0),
      child: icon,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: new List.generate(starCount, (index) => buildStar(context, index)
        )
    );
  }
}

//this class for statefullwidget (applied in dialog, stc)

class RatingStarFull extends StatefulWidget {

  final int starCount;
  final double rating;
  final RatingChangeCallback onRatingChanged;
  final Color color;

  RatingStarFull({this.starCount, this.rating, this.onRatingChanged, this.color});

  @override
  State<StatefulWidget> createState() {
    return _RatingStarState(starCount, rating, onRatingChanged, color);
  }

}

class _RatingStarState extends State<RatingStarFull> {

  final int starCount;
  double rating;
  final RatingChangeCallback onRatingChanged;
  final Color color;


  _RatingStarState(this.starCount, this.rating, this.onRatingChanged,
      this.color);

  Widget buildStar(BuildContext context, int index) {
    Icon icon;
    if (index >= rating) {
      icon = new Icon(
        Icons.star_border,
        color: Theme.of(context).buttonColor,
      );
    }
    else if (index > rating - 1 && index < rating) {
      icon = new Icon(
        Icons.star_half,
        color: color ?? Theme.of(context).primaryColor,
      );
    } else {
      icon = new Icon(
        Icons.star,
        color: color ?? Theme.of(context).primaryColor,
      );
    }
    return new GestureDetector(
      onTap: onRatingChanged == null ? null : () {
        onRatingChanged(index + 1.0);
        setState(() {
          this.rating = index + 1.0;
        });
      },
      child: icon,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: new List.generate(starCount, (index) => buildStar(context, index)
        )
    );
  }
}