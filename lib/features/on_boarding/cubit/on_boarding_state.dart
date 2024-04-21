abstract class OnBoardingState {
  const OnBoardingState(this.currentPageIndex);

  final int currentPageIndex;
}

final class OnBoardingInitial extends OnBoardingState {
  OnBoardingInitial(super.currentPageIndex);
}

final class OnBoardingPageChanged extends OnBoardingState {
  OnBoardingPageChanged(super.currentPageIndex);
}

final class OnBoardingCompleted extends OnBoardingState {
  OnBoardingCompleted(super.currentPageIndex);
}
