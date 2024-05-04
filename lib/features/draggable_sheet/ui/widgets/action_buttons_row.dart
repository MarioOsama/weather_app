import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:weather_app/core/theming/app_assets.dart';

class ActionButtonsRow extends StatelessWidget {
  const ActionButtonsRow({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Transform.rotate(
          angle: 180 * 3.1415927 / 180,
          child: GestureDetector(
            onTap: () {},
            child: SvgPicture.asset(
              Assets.imagesSvgsMenu,
            ),
          ),
        ),
        const Spacer(),
        Transform.rotate(
          angle: 180 * 3.1415927 / 180,
          child: GestureDetector(
            onTap: () {},
            child: SvgPicture.asset(
              Assets.imagesSvgsMap,
            ),
          ),
        ),
      ],
    );
  }
}
