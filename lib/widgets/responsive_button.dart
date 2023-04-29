// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:travel_app_new/widgets/app_text.dart';

import '../misc/colors.dart';

class ResponsiveButton extends StatelessWidget {
  final bool? isResponsive;
  final double? width;

  const ResponsiveButton({
    Key? key,
    this.isResponsive = false,
    this.width = 120,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Container(
        width: (isResponsive == true) ? double.maxFinite : width,
        height: 60,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: AppColors.mainColor,
        ),
        child: Row(
            mainAxisAlignment: (isResponsive == true)
                ? MainAxisAlignment.spaceBetween
                : MainAxisAlignment.center,
            children: [
              (isResponsive == true)
                  ? Container(
                      margin: EdgeInsets.only(left: 20),
                      child: AppText(
                        text: "Book Trip Now",
                        color: Colors.white,
                      ),
                    )
                  : Container(),
              Image.asset("images/button-one.png"),
            ]),
      ),
    );
  }
}
