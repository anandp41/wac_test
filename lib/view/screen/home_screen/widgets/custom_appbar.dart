import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/colors.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({
    super.key,
  });

  @override
  Size get preferredSize => Size.fromHeight(70.sp);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.sp),
      color: appBarBg,
      child: AppBar(
        toolbarHeight: 70.sp,
        centerTitle: true,
        backgroundColor: appBarBg,
        leading: const Icon(
          Icons.shopping_cart_outlined,
        ),
        title: Container(
          // margin: const EdgeInsets.all(6.0),
          decoration: BoxDecoration(
            // color: Colors.white38,
            borderRadius: BorderRadius.circular(20.0),
            boxShadow: [
              BoxShadow(
                color: Colors.black26,
                blurRadius: 10.sp,
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
              constraints: BoxConstraints(maxWidth: 280.sp, maxHeight: 30.sp),
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
        actions: [
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
                      style: TextStyle(color: Colors.white, fontSize: 6.sp),
                    ),
                  ))
            ],
          )
        ],
      ),
    );
  }
}
