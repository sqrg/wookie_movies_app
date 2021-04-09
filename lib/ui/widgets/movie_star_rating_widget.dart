import 'package:flutter/material.dart';

class MovieStarRatingWidget extends StatelessWidget {
  const MovieStarRatingWidget(
    this.rating, {
    Key key,
  }) : super(key: key);

  final int rating;

  @override
  Widget build(BuildContext context) {
    if (rating > 5) {
      return MovieStarRatingWidget(5);
    }

    List<Widget> stars = [];
    for (var i = 0; i < rating; i++) {
      stars.add(Icon(Icons.star, color: Colors.orange));
    }

    for (var i = 0; i < 5 - rating; i++) {
      stars.add(Icon(Icons.star, color: Colors.grey));
    }

    return Row(
      children: stars,
    );
  }
}
