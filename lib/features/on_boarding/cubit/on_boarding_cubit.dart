import 'package:bloc/bloc.dart';
import 'package:weather_app/core/theming/app_assets.dart';
import 'package:weather_app/features/on_boarding/cubit/on_boarding_state.dart';
import 'package:weather_app/features/on_boarding/data/models/on_boarding_page_model.dart';

class OnBoardingCubit extends Cubit<OnBoardingState> {
  OnBoardingCubit() : super(OnBoardingInitial(0));

  final List<OnBoardingPageModel> onBoardingPages = const [
    OnBoardingPageModel(
      title: 'Detailed Hourly Forecast',
      description: 'Get in - depth weather information.',
      imagePath: Assets.imagesPngsOnBoardingMoonDarkCloud,
    ),
    OnBoardingPageModel(
      title: 'Real-Time Weather Map',
      description: 'Watch the progress of the precipitation to stay informed.',
      imagePath: Assets.imagesPngsOnBoardingSun,
    ),
    OnBoardingPageModel(
      title: 'Weather Around the World',
      description: 'Add any location you want and be informed about it.',
      imagePath: Assets.imagesPngsOnBoardingRainyCloud,
    ),
    OnBoardingPageModel(
      title: 'Weather Insights Dashboard',
      description:
          'Gain valuable insights into current and forecasted weather conditions with our intuitive dashboard.',
      imagePath: Assets.imagesPngsOnBoardingSunCloud,
    ),
  ];

  void pageChanged(int currentPageIndex) {
    if (currentPageIndex == onBoardingPages.length) {
      completeOnBoarding();
      return;
    }
    emit(OnBoardingPageChanged(currentPageIndex));
  }

  void completeOnBoarding() {
    emit(OnBoardingCompleted(onBoardingPages.length - 1));
  }
}
