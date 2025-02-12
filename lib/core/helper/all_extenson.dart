import 'package:flutter/material.dart';

extension SizedboxOnInt on int {
  Widget get toHeightWhiteSpace => SizedBox(
        height: toDouble(),
      );
  Widget get toWidthWhiteSpace => SizedBox(
        width: this.toDouble(),
      );
}
