import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/core/helpers/spacing.dart';
import 'package:weather_app/features/draggable_sheet/logic/cubit/sheet_cubit.dart';
import 'package:weather_app/features/draggable_sheet/logic/cubit/sheet_state.dart';
import 'package:weather_app/features/draggable_sheet/ui/widgets/action_buttons_container.dart';
import 'package:weather_app/features/draggable_sheet/ui/widgets/sheet_header.dart';
import 'package:weather_app/features/draggable_sheet/ui/widgets/weather_conditions_horizontal_scroll_view.dart';
import 'package:weather_app/features/draggable_sheet/ui/widgets/weather_details_column.dart';

class DraggableSheetBody extends StatelessWidget {
  const DraggableSheetBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SheetCubit, SheetState>(
      builder: (context, state) {
        final isExpanded = state is SheetExpanded;
        return Column(
          children: <Widget>[
            const SheetHeader(),
            verticalSpace(15),
            const WeatherConditionsHorizontalScrollView(),
            AnimatedCrossFade(
                firstChild: _buildActions(),
                secondChild: _buildActionsOrFullDetails(context),
                crossFadeState: isExpanded
                    ? CrossFadeState.showSecond
                    : CrossFadeState.showFirst,
                duration: const Duration(milliseconds: 300)),
          ],
        );
      },
    );
  }

  Widget _buildActionsOrFullDetails(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(20.0),
      child: WeatherDetailsColumn(),
    );
  }

  Transform _buildActions() {
    return Transform.rotate(
      angle: 180 * 3.1415927 / 180,
      child: const ActionButtonsContainer(),
    );
  }
}
