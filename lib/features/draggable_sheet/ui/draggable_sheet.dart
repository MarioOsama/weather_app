import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/core/theming/app_colors.dart';
import 'package:weather_app/features/draggable_sheet/logic/cubit/sheet_cubit.dart';
import 'package:weather_app/features/draggable_sheet/ui/widgets/body.dart';
import 'package:weather_app/features/home/logic/cubit/home_cubit.dart';

class DraggableSheet extends StatefulWidget {
  const DraggableSheet({super.key});

  @override
  State<DraggableSheet> createState() => _DraggableSheet();
}

class _DraggableSheet extends State<DraggableSheet> {
  late GlobalKey _sheet;
  late DraggableScrollableController _controller;

  @override
  void initState() {
    _sheet = context.read<SheetCubit>().sheetController;
    _controller = context.read<SheetCubit>().draggingController;
    _setupController();
    super.initState();
  }

  void _setupController() {
    _controller.addListener(() {
      if (_controller.size > 0.45) {
        context.read<SheetCubit>().expandSheet();
        context.read<HomeCubit>().hideHome();
      } else if (_controller.size < 0.45) {
        context.read<SheetCubit>().collapseSheet();
        context.read<HomeCubit>().displayHome();
      }
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      key: _sheet,
      initialChildSize: 0.3,
      shouldCloseOnMinExtent: false,
      maxChildSize: 0.83,
      minChildSize: 0.3,
      expand: true,
      snap: true,
      snapSizes: const [0.3],
      controller: _controller,
      builder: (BuildContext context, ScrollController scrollController) {
        return _buildSheet(scrollController);
      },
    );
  }

  DecoratedBox _buildSheet(ScrollController scrollController) {
    return DecoratedBox(
      decoration: _buildDecoration(),
      child: SingleChildScrollView(
        controller: scrollController,
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: const DraggableSheetBody(),
        ),
      ),
    );
  }

  BoxDecoration _buildDecoration() {
    return const BoxDecoration(
      gradient: RadialGradient(
        radius: 1,
        focal: Alignment.centerRight,
        stops: [0.3, 1],
        colors: [
          AppColors.primaryGradientColor,
          AppColors.primaryGradientColorOne,
        ],
      ),
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(44),
        topRight: Radius.circular(44),
      ),
    );
  }
}
