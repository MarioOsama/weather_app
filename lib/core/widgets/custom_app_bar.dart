import 'package:flutter/material.dart';
import 'package:weather_app/core/helpers/extensions.dart';
import 'package:weather_app/core/theming/app_text_styles.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key, required this.title, this.foregroundColor});
  final String title;
  final Color? foregroundColor;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 40.0),
      child: Row(
        children: <Widget>[
          IconButton(
            icon: Icon(
              Icons.keyboard_arrow_left_outlined,
              size: 32,
              color: foregroundColor ?? Colors.white,
            ),
            onPressed: () {
              context.pop();
            },
          ),
          Text(
            title,
            style: AppTextStyles.font24WhiteSemiBold.copyWith(
              fontWeight: FontWeight.w400,
              color: foregroundColor ?? Colors.white,
            ),
          ),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(56);
}
