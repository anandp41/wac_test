import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Section extends StatelessWidget {
  final String title;

  const Section({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: TextStyle(
              fontSize: 14.sp,
              fontWeight: FontWeight.w400,
              fontFamily: 'Poppins'),
        ),
        Text(
          "View all",
          style: TextStyle(
              fontSize: 10.sp,
              fontWeight: FontWeight.w400,
              fontFamily: 'Poppins'),
        ),
      ],
    );
  }
}
