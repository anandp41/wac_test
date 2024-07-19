import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../../../view_models/home/home_view_model.dart';

class SingleBanner extends StatelessWidget {
  const SingleBanner({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<HomeViewModel>(builder: (context, value, child) {
      if (!value.emptyData) {
        return value.bannerSingleImage;
      } else {
        return Placeholder(
          fallbackHeight: 80.sp,
        );
      }
    });
  }
}
