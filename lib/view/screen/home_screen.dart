import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/colors.dart';
import 'home_screen/widgets/categories_panel.dart';
import 'home_screen/widgets/custom_carousel_slider.dart';
import 'home_screen/widgets/featured_products_panel.dart';
import 'home_screen/widgets/most_popular_panel.dart';
import 'home_screen/widgets/section.dart';
import 'home_screen/widgets/single_banner.dart';

class Home extends StatelessWidget {
  const Home({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 24.sp),
            height: 100.sp,
            width: double.infinity,
            color: appBarBg,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Icon(
                  Icons.shopping_cart_outlined,
                ),
                Container(
                  // margin: const EdgeInsets.all(6.0),
                  decoration: BoxDecoration(
                    // color: Colors.white38,
                    borderRadius: BorderRadius.circular(20.sp),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black26,
                        blurRadius: 10.0,
                        offset: Offset(0, 5.sp),
                      ),
                    ],
                  ),
                  child: TextField(
                    cursorOpacityAnimates: true,
                    cursorColor: Colors.white70,
                    expands: false,
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.all(20.sp),
                      filled: true,
                      fillColor: Colors.white70,
                      constraints:
                          BoxConstraints(maxWidth: 280.sp, maxHeight: 30.sp),
                      border: const OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.all(Radius.circular(12))),
                      suffixIcon: const Icon(
                        Icons.search,
                        color: Colors.grey,
                      ),
                    ),
                  ),
                ),
                Stack(
                  children: [
                    Icon(
                      Icons.notifications_none_outlined,
                      color: kWhite,
                      size: 24.sp,
                    ),
                    Positioned(
                        top: 0,
                        right: 2.sp,
                        child: CircleAvatar(
                          radius: 6.sp,
                          backgroundColor: Colors.red,
                          child: Text(
                            '0',
                            style:
                                TextStyle(color: Colors.white, fontSize: 6.sp),
                          ),
                        ))
                  ],
                )
              ],
            ),
          ),
          const CustomCarouselSliderPanel(),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding:
                    EdgeInsets.symmetric(horizontal: 24.sp, vertical: 12.sp),
                child: const Section(
                  title: "Most Popular",
                ),
              ),
              SizedBox(
                height: 10.sp,
              ),
              Padding(
                padding: EdgeInsets.only(left: 24.sp),
                child: const MostPopularPanel(),
              ),
              SizedBox(
                height: 10.sp,
              ),
              Padding(
                padding:
                    EdgeInsets.symmetric(horizontal: 24.sp, vertical: 12.sp),
                child: Container(
                  clipBehavior: Clip.hardEdge,
                  decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(15))),
                  child: const SingleBanner(),
                ),
              ),
              SizedBox(
                height: 10.sp,
              ),
              Padding(
                padding:
                    EdgeInsets.symmetric(horizontal: 24.sp, vertical: 12.sp),
                child: const Section(title: 'Categories'),
              ),
              SizedBox(
                height: 10.sp,
              ),
              Padding(
                padding: EdgeInsets.only(left: 24.sp),
                child: const CategoriesPanel(),
              ),
              SizedBox(
                height: 10.sp,
              ),
              Padding(
                padding:
                    EdgeInsets.symmetric(horizontal: 24.sp, vertical: 12.sp),
                child: const Section(title: 'Featured Products'),
              ),
              SizedBox(
                height: 10.sp,
              ),
              Padding(
                padding: EdgeInsets.only(left: 24.sp),
                child: const FeaturedProductsPanel(),
              ),
            ],
          )
        ],
      ),
    );
  }
}
