import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../../../view_models/home/home_view_model.dart';
import 'product_tile.dart';

class MostPopularPanel extends StatelessWidget {
  const MostPopularPanel({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<HomeViewModel>(
      builder: (context, value, child) => SizedBox(
        height: 215.sp,
        child: ListView.separated(
            scrollDirection: Axis.horizontal,
            shrinkWrap: true,
            itemBuilder: (context, index) {
              if (!value.emptyData) {
                return ProductTile(
                  image: value.mostPopularsImages[index],
                  product: value.mostPopulars!.contents[index],
                );
              } else {
                return const SizedBox();
              }
            },
            separatorBuilder: (context, index) => SizedBox(
                  width: 5.sp,
                ),
            itemCount: !value.emptyData ? value.mostPopularsImages.length : 0),
      ),
    );
  }
}
