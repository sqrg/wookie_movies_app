import 'package:flutter/material.dart';

class MovieItemWidget extends StatelessWidget {
  const MovieItemWidget({
    Key key,
    this.title,
    @required this.posterUrl,
    @required this.onTap,
  }) : super(key: key);

  final String title;
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
              width: boxWidth,
              child: Center(
                child: CircularProgressIndicator(),
              ),
            );
          },
          errorBuilder: (BuildContext context, Object object, StackTrace e) {
            return SizedBox(
                width: boxWidth,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.error,
                      color: Colors.white,
                    ),
                    Text(
                      title ?? '',
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.headline2,
                    )
                  ],
                ));
          },
        ),
      ),
    );
  }
}
