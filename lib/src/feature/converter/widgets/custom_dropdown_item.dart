import 'package:circle_flags/circle_flags.dart';
import 'package:flutter/material.dart';

import '../../../common/constants/app_colors.dart';

class CustomDropdownItem extends StatelessWidget {
  const CustomDropdownItem({
    super.key,
    required this.e,
    this.size,
  });

  final double? size;
  final String e;

  @override
  Widget build(BuildContext context) {
    final String currencyShort = e.substring(0, 2).toLowerCase();
    return SizedBox(
      width: 100,
      child: ListTile(
        dense: true,
        contentPadding: EdgeInsets.zero,
        leading: CircleFlag(
          switch (currencyShort) {
            "eu" => "european_union",
            "xa" => "cf",
            _ => currencyShort,
          },
          size: size ?? 45,
        ),
        title: Text(
          e,
          style: const TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w500,
            color: AppColors.currencyTextColor,
          ),
        ),
      ),
    );
  }
}
