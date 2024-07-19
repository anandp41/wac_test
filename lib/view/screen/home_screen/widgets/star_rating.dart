import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class StarRating extends StatelessWidget {
  final int rating;

  const StarRating({super.key, required this.rating})
      : assert(rating >= 1 && rating <= 5, 'Rating must be between 1 and 5');

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(5, (index) {
        if (index < rating) {
          return Icon(
            Icons.star_rate_rounded,
            size: 15.sp,
            color: Colors.amber,
          );
        } else {
          return Icon(
            Icons.star_rate_rounded,
            size: 15.sp,
            color: Colors.grey,
          );
        }
      }),
    );
  }
}
