import 'package:flutter/material.dart';

class MoviePosterWidget extends StatelessWidget {
  const MoviePosterWidget({
    Key key,
    @required this.posterUrl,
    @required this.height,
    this.width,
  }) : super(key: key);

  final String posterUrl;
  final double height;
  final double width;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(border: Border.all(color: Colors.white, width: 2.5)),
      child: Image.network(
        posterUrl,
        height: height,
        errorBuilder: (BuildContext context, Object object, StackTrace e) {
            return SizedBox(
              height: height,
              width: 120,
              child: Icon(Icons.error, color: Colors.white,));
          },
      ),
    );
  }
}
