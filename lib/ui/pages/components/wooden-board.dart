import 'package:flutter/material.dart';

class WoodenBoard extends StatelessWidget {
  final Widget child;
  WoodenBoard({
    Key key,
    @required this.child,
  })  : assert(child != null, "child cannot be null"),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 21,
        vertical: 18,
      ),
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/img/wooden-board.png"),
          fit: BoxFit.fill,
        ),
      ),
      child: child,
    );
  }
}
