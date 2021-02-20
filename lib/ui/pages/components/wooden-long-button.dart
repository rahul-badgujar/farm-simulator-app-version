import 'package:flutter/material.dart';

class WoodenLongButton extends StatelessWidget {
  final VoidCallback onClick;
  final Widget child;
  WoodenLongButton({
    Key key,
    @required this.onClick,
    @required this.child,
  })  : assert(onClick != null, "onClick cannot be null"),
        assert(child != null, "child cannot be null"),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onClick,
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: 21,
          vertical: 18,
        ),
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/img/wooden-button-long.png"),
            fit: BoxFit.fill,
          ),
        ),
        child: child,
      ),
    );
  }
}
