import 'package:flutter/material.dart';

class MovieItemWidget extends StatelessWidget {
  const MovieItemWidget({
    Key key,
    @required this.posterUrl,
    @required this.onTap,
  }) : super(key: key);

  final String posterUrl;
  final Function onTap;

  final double boxWidth = 150;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: SizedBox(
        width: boxWidth,
        child: Image.network(
          posterUrl,
          loadingBuilder: (BuildContext context, Widget child, ImageChunkEvent loadingProgress) {
            if (loadingProgress == null) {
              return child;
            }
            return SizedBox(
              //height: backdropHeight,
              width: boxWidth,
              child: Center(child: CircularProgressIndicator()));
          },
          errorBuilder: (BuildContext context, Object object, StackTrace e) {
            return SizedBox(
              //height: backdropHeight,
              width: boxWidth,
              child: Icon(Icons.error, color: Colors.white,));
          },
        ),
      ),
    );
  }
}
