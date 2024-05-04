import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:weather_app/features/draggable_sheet/logic/cubit/sheet_state.dart';

class SheetCubit extends Cubit<SheetState> {
  SheetCubit() : super(const SheetInitial());

  final sheetController = GlobalKey();
  DraggableScrollableController draggingController =
      DraggableScrollableController();

  void expandSheet() => emit(SheetExpanded(
        draggingController.size,
      ));

  void collapseSheet() => emit(SheetCollapsed(
        draggingController.size,
      ));
}
