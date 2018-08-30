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