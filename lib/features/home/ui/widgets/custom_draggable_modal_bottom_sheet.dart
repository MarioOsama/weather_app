import 'package:flutter/material.dart';
import 'package:weather_app/core/theming/app_colors.dart';
import 'package:weather_app/core/theming/app_text_styles.dart';

class CustomDraggableModalBottomSheet extends StatefulWidget {
  const CustomDraggableModalBottomSheet({super.key});

  @override
  State<CustomDraggableModalBottomSheet> createState() =>
      _CustomDraggableModalBottomSheetState();
}

class _CustomDraggableModalBottomSheetState
    extends State<CustomDraggableModalBottomSheet> {
  final _sheet = GlobalKey();
  final _controller = DraggableScrollableController();

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      key: _sheet,
      initialChildSize: 0.4,
      shouldCloseOnMinExtent: false,
      maxChildSize: 1,
      minChildSize: 0.37,
      expand: true,
      snap: true,
      snapSizes: const [0.37],
      controller: _controller,
      builder: (BuildContext context, ScrollController scrollController) {
        return DecoratedBox(
          decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  AppColors.primaryGradientColorOne.withAlpha(250),
                  AppColors.primaryGradientColorTwo.withAlpha(250),
                ]),
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(44),
              topRight: Radius.circular(44),
            ),
          ),
          child: SingleChildScrollView(
            controller: scrollController,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 30),
              child: const Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Text(
                        'Hourly Forecast',
                        style: AppTextStyles.font18GreyRegular,
                      ),
                      Spacer(),
                      Text(
                        'Weekly Forecast',
                        style: AppTextStyles.font18GreyRegular,
                      ),
                    ],
                  ),
                  Divider(),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
