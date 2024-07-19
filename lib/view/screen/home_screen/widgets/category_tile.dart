import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../data/models/data_model.dart';

class CategoryTile extends StatelessWidget {
  final Content category;
  final Image image;
  const CategoryTile({
    super.key,
    required this.category,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    Image imageEdited = image;

    return Container(
      height: 100.sp,
      width: 100.sp,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          border: Border.all(
            color: Colors.grey,
            width: 1.sp,
          )),
      child: Padding(
        padding: EdgeInsets.all(8.sp),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            imageEdited,
            SizedBox(
              height: 5.sp,
            ),
            Expanded(
              child: Text(
                category.title!,
                style: TextStyle(fontFamily: 'Montserrat', fontSize: 10.sp),
              ),
            )
          ],
        ),
      ),
    );
  }
}
