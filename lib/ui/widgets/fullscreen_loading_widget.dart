import 'dart:ui';

import 'package:flutter/material.dart';

class FullScreenLoadingWidget extends StatelessWidget {
  const FullScreenLoadingWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
      child: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Center(child: CircularProgressIndicator()),
      ),
    );
  }
}
