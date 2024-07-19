import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../data/models/data_model.dart';
import 'star_rating.dart';

class ProductTile extends StatelessWidget {
  final Content product;
  final Image image;
  const ProductTile({
    super.key,
    required this.product,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 215.sp,
      width: 140.sp,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          border: Border.all(
            color: Colors.grey,
            width: 1.sp,
          )),
      child: Padding(
        padding: EdgeInsets.all(8.sp),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            image,
            SizedBox(
              height: 5.sp,
            ),
            if (product.actualPrice != product.offerPrice)
              Container(
                padding: EdgeInsets.all(8.sp),
                decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 251, 86, 74),
                    borderRadius: BorderRadius.circular(12)),
                child: Text(
                  'Sale ${product.discount}',
                  style: TextStyle(
                      fontSize: 10.sp,
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.w400),
                ),
              ),
            Expanded(
              child: Text(
                product.productName!,
                style: TextStyle(
                  fontFamily: 'Montserrat',
                  fontWeight: FontWeight.w400,
                  fontSize: 10.sp,
                ),
                maxLines: 2,
              ),
            ),
            StarRating(rating: product.productRating!),
            if (product.actualPrice != product.offerPrice)
              Row(
                children: [
                  Text(
                    product.offerPrice!.replaceRange(0, 3, '\u{20B9}'),
                    style: const TextStyle(fontSize: 10),
                  ),
                  SizedBox(
                    width: 8.sp,
                  ),
                  Text(
                    product.actualPrice!.replaceRange(0, 3, '\u{20B9}'),
                    style: TextStyle(
                        fontSize: 10.sp,
                        color: Colors.grey,
                        decoration: TextDecoration.lineThrough,
                        decorationColor: Colors.grey),
                  ),
                ],
              )
            else
              Text(
                product.actualPrice!.replaceRange(0, 3, '\u{20B9}'),
                style: TextStyle(fontSize: 10.sp),
              )
          ],
        ),
      ),
    );
  }
}
