import 'package:flutter/material.dart';

class MovieItemWidget extends StatelessWidget {
  const MovieItemWidget({
    Key key,
    @required this.posterUrl,
    @required this.onTap,
  }) : super(key: key);

  final String posterUrl;
  final Function onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: SizedBox(
        width: 150,
        child: Image.network(
          posterUrl,
          loadingBuilder: (BuildContext context, Widget child, ImageChunkEvent loadingProgress) {
            if (loadingProgress == null) {
              return child;
            }
            return Center(child: CircularProgressIndicator());
          },
        ),
      ),
    );
  }
}
