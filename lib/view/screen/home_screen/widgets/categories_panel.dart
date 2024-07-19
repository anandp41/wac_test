import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../../../view_models/home/home_view_model.dart';
import 'category_tile.dart';

class CategoriesPanel extends StatelessWidget {
  const CategoriesPanel({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<HomeViewModel>(
      builder: (context, value, child) => SizedBox(
        height: 100.sp,
        child: ListView.separated(
            scrollDirection: Axis.horizontal,
            shrinkWrap: true,
            itemBuilder: (context, index) {
              if (!value.emptyData) {
                return CategoryTile(
                  image: value.categoriesImages[index],
                  category: value.categories!.contents[index],
                );
              } else {
                return const SizedBox();
              }
            },
            separatorBuilder: (context, index) => SizedBox(
                  width: 5.sp,
                ),
            itemCount: !value.emptyData ? value.categoriesImages.length : 0),
      ),
    );
  }
}
