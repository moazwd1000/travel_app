// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:travel_app_new/widgets/app_text.dart';

import '../misc/colors.dart';

class AppButtons extends StatelessWidget {
  String? text;
  IconData? icon;
  bool? isIcon;
  final Color color;
  final Color backgrpundColor;
  double size;
  final Color borderColor;
  AppButtons({
    Key? key,
    this.text = "Hi",
    this.icon,
    this.isIcon = false,
    required this.color,
    required this.backgrpundColor,
    required this.size,
    required this.borderColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        border: Border.all(color: borderColor, width: 1.0),
        borderRadius: BorderRadius.circular(15),
        color: backgrpundColor,
      ),
      child: isIcon == false
          ? Center(
              child: AppText(
                text: text!,
                color: color,
              ),
            )
          : Center(
              child: Icon(
                icon,
                color: color,
              ),
            ),
    );
    ;
  }
}
