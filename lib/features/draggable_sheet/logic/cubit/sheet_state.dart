abstract class SheetState {
  const SheetState(this.sheetSize);

  final double? sheetSize;
}

final class SheetInitial extends SheetState {
  const SheetInitial() : super(0.37);
}

final class SheetExpanded extends SheetState {
  const SheetExpanded(super.sheetSize);
}

final class SheetCollapsed extends SheetState {
  const SheetCollapsed(super.sheetSize);
}
