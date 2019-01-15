import 'package:flutter/widgets.dart';

class CornerRoundImage extends StatelessWidget {
  final String renderUrl;

  CornerRoundImage(this.renderUrl);

  @override
  Widget build(BuildContext context) {
    return new Container(
      constraints: BoxConstraints(
          minWidth: 160.0,
          minHeight: 160.0
      ),
      decoration: BoxDecoration(
        borderRadius: new BorderRadius.circular(8.0),
        shape: BoxShape.rectangle,
        image: DecorationImage(
          fit: BoxFit.cover,
          image: NetworkImage(renderUrl ?? ''),
        ),
      ),
    );
  }
}
