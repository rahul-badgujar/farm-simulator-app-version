import 'package:farm_game_app_version/utils/constants.dart';
import 'package:flutter/material.dart';

class UiTextButton extends StatelessWidget {
  static const String mediumScaleAssetPath = "assets/gui/TextBTN_Medium.png";
  static const String bigScaleAssetPath = "assets/gui/TextBTN_Big.png";

  final VoidCallback onClick;
  final Widget child;
  final UiButtonScale scale;
  UiTextButton({
    Key key,
    @required this.onClick,
    @required this.child,
    this.scale = UiButtonScale.Medium,
  })  : assert(onClick != null, "onClick cannot be null"),
        assert(child != null, "child cannot be null"),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onClick,
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: 21,
          vertical: 18,
        ),
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(assetPath),
            fit: BoxFit.fill,
          ),
        ),
        child: child,
      ),
    );
  }

  String get assetPath {
    switch (scale) {
      case UiButtonScale.Big:
        return bigScaleAssetPath;
        break;
      case UiButtonScale.Medium:
        return mediumScaleAssetPath;
        break;
      default:
        return null;
    }
  }
}
