import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../core/colors.dart';
import '../view/screen/home_screen.dart';
import '../view_models/home/home_view_model.dart';

class Application extends StatefulWidget {
  const Application({super.key});

  @override
  State<Application> createState() => _ApplicationState();
}

class _ApplicationState extends State<Application> {
  late HomeViewModel viewModel;
  @override
  void initState() {
    viewModel = Provider.of<HomeViewModel>(context, listen: false);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      viewModel.fetchData(context);
    });
    super.initState();
  }

  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    List pages = [
      const Home(),
      const Center(child: Text("Dummy page")),
      const Center(child: Text("Dummy page")),
      const Center(child: Text("Dummy page")),
      const Center(child: Text("Dummy page")),
    ];

    return Scaffold(
      backgroundColor: kWhite,
      body: pages[currentIndex],
      bottomNavigationBar: ConvexAppBar(
          activeColor: appBarBg,
          initialActiveIndex: currentIndex,
          color: navbarIconColor,
          style: TabStyle.reactCircle,
          backgroundColor: bottomNavBarBG,
          onTap: (index) {
            setState(() {
              currentIndex = index;
            });
          },
          items: [
            TabItem(
              title: 'Home',
              icon: Icon(
                Icons.home_filled,
                size: 26.sp,
                color: currentIndex == 0 ? Colors.white : Colors.grey[800],
              ),
            ),
            TabItem(
              title: 'Category',
              icon: Icon(
                Icons.grid_view_outlined,
                size: 26.sp,
                color: currentIndex == 1 ? Colors.white : Colors.grey[800],
              ),
            ),
            TabItem(
              title: 'Cart',
              icon: Icon(
                Icons.shopping_cart,
                size: 26.sp,
                color: currentIndex == 2 ? Colors.white : Colors.grey[800],
              ),
            ),
            TabItem(
                title: 'Offers',
                icon: Icon(
                  Icons.percent,
                  size: 26.sp,
                  color: currentIndex == 3 ? Colors.white : Colors.grey[800],
                )),
            TabItem(
                title: 'Account',
                icon: Icon(
                  Icons.person,
                  size: 26.sp,
                  color: currentIndex == 4 ? Colors.white : Colors.grey[800],
                )),
          ]),
    );
  }
}
