import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../../../view_models/home/home_view_model.dart';

class CustomCarouselSliderPanel extends StatelessWidget {
  const CustomCarouselSliderPanel({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<HomeViewModel>(
      builder: (context, value, child) {
        return CarouselSlider(
            items: value.bannerSlidersImages,
            options: CarouselOptions(
                autoPlay: true, viewportFraction: 1, height: 100.sp));
      },
    );
  }
}
