import 'package:flutter/material.dart';

class MoviePosterWidget extends StatelessWidget {
  const MoviePosterWidget({
    Key key,
    @required this.posterUrl,
    @required this.height,
  }) : super(key: key);

  final String posterUrl;
  final double height;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(border: Border.all(color: Colors.white, width: 2.5)),
      child: Image.network(
        posterUrl,
        height: height,
      ),
    );
  }
}
