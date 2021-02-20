import 'package:farm_game_app_version/utils/constants.dart';
import 'package:flutter/material.dart';

class UiBoardStone extends StatelessWidget {
  static const String smallScaleAssetPath =
      "assets/gui/UI board Small  stone.png";
  static const String mediumScaleAssetPath =
      "assets/gui/UI board Medium stone.png";
  static const String largeScaleAssetPath =
      "assets/gui/UI board Large stone.png";

  final Widget child;
  final UiBoardScale scale;
  UiBoardStone({
    Key key,
    @required this.child,
    this.scale = UiBoardScale.Medium,
  })  : assert(child != null, "child cannot be null"),
        super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 21,
        vertical: 18,
      ),
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(
            assetPath,
          ),
          fit: BoxFit.fill,
        ),
      ),
      child: child,
    );
  }

  String get assetPath {
    switch (scale) {
      case UiBoardScale.Small:
        return smallScaleAssetPath;

      case UiBoardScale.Medium:
        return mediumScaleAssetPath;

      case UiBoardScale.Large:
        return largeScaleAssetPath;
      default:
        return null;
    }
  }
}
