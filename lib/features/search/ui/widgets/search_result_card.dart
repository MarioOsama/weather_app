import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/core/theming/app_text_styles.dart';
import 'package:weather_app/features/home/data/models/current_weather_response_body.dart';
import 'package:weather_app/features/search/data/models/city_weather_response_body.dart';
import 'package:weather_app/features/search/logic/cubit/search_cubit.dart';
import 'package:weather_app/features/search/logic/cubit/search_state.dart';
import 'package:weather_app/features/search/ui/widgets/card_footer.dart';
import 'package:weather_app/features/search/ui/widgets/card_header.dart';

class SearchResultCard extends StatefulWidget {
  const SearchResultCard({
    super.key,
    required this.index,
  });

  final double index;

  @override
  State<SearchResultCard> createState() => _SearchResultCardState();
}

class _SearchResultCardState extends State<SearchResultCard>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _animation;

  @override
  void initState() {
    _controller = AnimationController(
      duration: Duration(seconds: widget.index.toInt() + 1),
      vsync: this,
    );
    _animation = Tween<Offset>(
      begin: const Offset(0, 4),
      end: const Offset(0, 0),
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    ));
    _controller.forward();
    _controller.addListener(() {
      setState(() {});
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchCubit, SearchState>(
      builder: (context, state) {
        CityWeatherResponseBody? searchResult;

        if (state is SearchInitial || state is SearchError) {
          final CurrentWeatherResponseBody? currentWeather =
              context.read<SearchCubit>().state.currentWeather;

          searchResult = currentWeather != null
              ? CityWeatherResponseBody(
                  cityName: currentWeather.cityName,
                  country: currentWeather.country,
                  temp: currentWeather.temp,
                  weatherDescription: currentWeather.weatherDescription)
              : null;
        } else if (state is SearchLoaded) {
          searchResult = state.searchResult;
        } else if (state is SearchLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }

        return AnimatedSlide(
          duration: const Duration(milliseconds: 0),
          offset: _animation.value,
          child: Directionality(
            textDirection: TextDirection.ltr,
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.only(
                  left: 20, right: 20, bottom: 10, top: 0),
              decoration: _buildCardDecoration(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CardHeader(
                    temp: searchResult!.temp.round().toString(),
                    weatherDescription: searchResult.weatherDescription,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 10.0, left: 10.0),
                    child: Text(
                      searchResult.country,
                      style: AppTextStyles.font20WhiteRegular,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10.0),
                    child: CardFooter(
                      cityName: searchResult.cityName,
                      weatherCondition: searchResult.weatherDescription,
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  BoxDecoration _buildCardDecoration() {
    return const BoxDecoration(
      color: Colors.transparent,
      image: DecorationImage(
        image: AssetImage('assets/images/pngs/rectangle.png'),
        fit: BoxFit.fill,
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
