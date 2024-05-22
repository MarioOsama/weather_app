import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/core/helpers/spacing.dart';
import 'package:weather_app/features/draggable_sheet/ui/widgets/draggable_indicator.dart';
import 'package:weather_app/features/draggable_sheet/ui/widgets/sheet_header_buttons_container.dart';
import 'package:weather_app/features/home/logic/cubit/home_cubit.dart';
import 'package:weather_app/features/home/logic/cubit/home_state.dart';

class SheetHeader extends StatelessWidget {
  const SheetHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        return Column(
          children: [
            const DraggableIndicator(),
            verticalSpace(10),
            AnimatedOpacity(
              duration: const Duration(milliseconds: 200),
              opacity: state is HomeHidden ? 0.0 : 1.0,
              child: const SheetHeaderButtonsContainer(),
            ),
          ],
        );
      },
    );
  }
}
