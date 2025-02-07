import 'package:dating_app/core/theme/custom_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SocialButton extends StatelessWidget {
  final String imagePath;
  final Color borderColor;
  final Color imageColor;

  const SocialButton(
      {super.key,
      required this.imagePath,
      this.imageColor = CustomColors.white,
      this.borderColor = CustomColors.white});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(color: borderColor),
      ),
      child: imagePath.endsWith("svg")
          ? SvgPicture.asset(
              imagePath,
              color: imageColor,
            )
          : Image(image: AssetImage(imagePath)),
    );
  }
}
