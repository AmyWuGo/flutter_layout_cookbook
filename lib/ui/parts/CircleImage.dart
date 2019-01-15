import 'package:flutter/widgets.dart';

class CircleImage extends StatelessWidget {
  final String renderUrl;

  CircleImage(this.renderUrl);

  @override
  Widget build(BuildContext context) {
    return new Container(
      width: 100.0,
      height: 100.0,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        image: DecorationImage(
          fit: BoxFit.cover,
          image: NetworkImage(renderUrl ?? ''),
        ),
      ),
    );
  }
}
