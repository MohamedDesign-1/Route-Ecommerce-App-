import 'package:flutter/material.dart';

import '../resources/color_mananger.dart';
import '../resources/font_manager.dart';
import '../resources/styles_manager.dart';

class CustomSection extends StatelessWidget {
  String? sectionName;
  VoidCallback? function;

  CustomSection({
    Key? key,
    required this.sectionName,
    required this.function,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          sectionName!,
          style: getBoldStyle(
              fontSize: FontSizeManager.s20, color: ColorManager.primary),
        ),
        TextButton(
            onPressed: function,
            child: Text(
              'View All',
              style: getBoldStyle(
                  fontSize: FontSizeManager.s16, color: ColorManager.primary),
            ))
      ],
    );
  }
}
