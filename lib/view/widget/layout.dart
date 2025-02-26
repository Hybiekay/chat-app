import 'package:dating_app/core/constants/images_const.dart';
import 'package:dating_app/core/theme/custom_colors.dart';
import 'package:dating_app/provider/current_user_provider.dart';
import 'package:dating_app/provider/layout_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

class Layout extends StatefulWidget {
  final List<Widget> children;
  const Layout({super.key, required this.children});

  @override
  State<Layout> createState() => _LayoutState();
}

class _LayoutState extends State<Layout> {
  @override
  Widget build(BuildContext context) {
    context.watch<CurrentUserProvider>().getCurrentUser();
    var layoutProvider = context.watch<LayoutProvider>();
    return Scaffold(
      body: widget.children[layoutProvider.currentIndex],
      bottomNavigationBar: BottomNavigationBar(
          backgroundColor: CustomColors.white,
          type: BottomNavigationBarType.fixed,
          currentIndex: layoutProvider.currentIndex,
          selectedItemColor: CustomColors.primaryColor,
          onTap: (value) {
            context.read<LayoutProvider>().updateIndex(value);
          },
          items: [
            BottomNavigationBarItem(
              icon: SvgPicture.asset(ImagesConst.message,
                  color: layoutProvider.currentIndex == 0
                      ? CustomColors.primaryColor
                      : CustomColors.text),
              label: "Message",
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(ImagesConst.calls,
                  color: layoutProvider.currentIndex == 1
                      ? CustomColors.primaryColor
                      : CustomColors.text),
              label: "Call",
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(ImagesConst.user,
                  color: layoutProvider.currentIndex == 2
                      ? CustomColors.primaryColor
                      : CustomColors.text),
              label: "Contact",
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(ImagesConst.settings,
                  color: layoutProvider.currentIndex == 3
                      ? CustomColors.primaryColor
                      : CustomColors.text),
              label: "Settings",
            )
          ]),
    );
  }
}
