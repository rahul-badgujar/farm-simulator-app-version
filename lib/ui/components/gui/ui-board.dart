import 'package:farm_game_app_version/utils/constants.dart';
import 'package:flutter/material.dart';

class UiBoard extends StatelessWidget {
  static const String smallScaleAssetPathStone =
      "assets/gui/UI board Small  stone.png";
  static const String mediumScaleAssetPathStone =
      "assets/gui/UI board Medium stone.png";
  static const String largeScaleAssetPathStone =
      "assets/gui/UI board Large stone.png";
  static const String smallScaleAssetPathParchment =
      "assets/gui/UI board Small  parchment.png";
  static const String mediumScaleAssetPathParchment =
      "assets/gui/UI board Medium  parchment.png";
  static const String largeScaleAssetPathParchment =
      "assets/gui/UI board Large  parchment.png";
  static const String smallScaleAssetPathSet =
      "assets/gui/UI board Small Set.png";
  static const String mediumScaleAssetPathSet =
      "assets/gui/UI board Medium Set.png";
  static const String largeScaleAssetPathSet =
      "assets/gui/UI board Large Set.png";

  final Widget child;
  final UiBoardScale scale;
  final UiBoardType type;
  UiBoard({
    Key key,
    @required this.child,
    this.scale = UiBoardScale.Medium,
    this.type = UiBoardType.Parchment,
  })  : assert(child != null, "child cannot be null"),
        super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 12,
        vertical: 15,
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
    if (type == UiBoardType.Parchment) {
      switch (scale) {
        case UiBoardScale.Small:
          return smallScaleAssetPathParchment;

        case UiBoardScale.Medium:
          return mediumScaleAssetPathParchment;

        case UiBoardScale.Large:
          return largeScaleAssetPathParchment;
      }
    } else if (type == UiBoardType.Set) {
      switch (scale) {
        case UiBoardScale.Small:
          return smallScaleAssetPathSet;

        case UiBoardScale.Medium:
          return mediumScaleAssetPathSet;

        case UiBoardScale.Large:
          return largeScaleAssetPathSet;
      }
    } else if (type == UiBoardType.Stone) {
      switch (scale) {
        case UiBoardScale.Small:
          return smallScaleAssetPathStone;

        case UiBoardScale.Medium:
          return mediumScaleAssetPathStone;

        case UiBoardScale.Large:
          return largeScaleAssetPathStone;
      }
    }
    return null;
  }
}
