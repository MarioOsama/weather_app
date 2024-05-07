import 'package:flutter/material.dart';
import 'package:weather_app/core/theming/app_colors.dart';
import 'package:weather_app/features/home/ui/widgets/high_low_degrees.dart';
import 'package:weather_app/features/search/data/models/search_result_model.dart';
import 'package:weather_app/features/search/ui/widgets/card_footer.dart';
import 'package:weather_app/features/search/ui/widgets/card_header.dart';

class SearchResultCard extends StatefulWidget {
  const SearchResultCard({
    super.key,
    required this.result,
    required this.index,
  });

  final SearchResultModel result;
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
    return AnimatedSlide(
      duration: const Duration(milliseconds: 0),
      offset: _animation.value,
      child: Container(
        width: double.infinity,
        padding:
            const EdgeInsets.only(left: 20, right: 20, bottom: 20, top: 10),
        decoration: _buildCardDecoration(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CardHeader(temp: widget.result.temp),
            HighLowDegrees(
              high: widget.result.high,
              low: widget.result.low,
              color: AppColors.greyColor,
              fontSize: 16,
              center: false,
            ),
            CardFooter(
              cityName: widget.result.cityName,
              weatherCondition: widget.result.weatherCondition,
            ),
          ],
        ),
      ),
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
}
