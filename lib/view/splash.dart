import 'package:dating_app/core/constants/images_const.dart';
import 'package:dating_app/core/theme/theme.dart';
import 'package:dating_app/provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});
  @override
  Widget build(BuildContext context) {
    context.read<SplashProvider>().nextPage(context);
    context.read<UserProvider>().getAllUser();
    return Scaffold(
      body: Container(
        color: context.isDark ? CustomColors.primaryColor : CustomColors.white,
        child: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              ImagesConst.logo,
              width: 50,
              color: context.isDark
                  ? CustomColors.white
                  : CustomColors.primaryColor,
            ),
            Text(
              "Chatbox",
              style: CustomTextstyle.caption.copyWith(
                fontSize: 35,
              ),
            )
          ],
        )),
      ),
    );
  }
}
