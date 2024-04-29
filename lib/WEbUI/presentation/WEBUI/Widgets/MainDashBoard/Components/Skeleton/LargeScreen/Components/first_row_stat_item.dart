import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:notifications/WEbUI/Data/Resources/assets.dart';
import 'package:notifications/WEbUI/Data/Resources/color.dart';
import 'package:notifications/WEbUI/Data/Resources/extensions.dart';
import 'package:notifications/WEbUI/Data/Resources/styles.dart';
import 'package:notifications/WEbUI/presentation/Common/custom_image.dart';
import 'package:notifications/WEbUI/presentation/Common/custom_text.dart';

class FirstRowStatItem extends StatelessWidget {
  final String? imageurl;
  final String? title;
  final String? amount;
  final String? subAmount;
  final dynamic? flags;

  const FirstRowStatItem({
    super.key,
    this.imageurl,
    this.title,
    this.amount,
    this.subAmount,
    this.flags,
  });

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    log(imageurl.toString());
    return Row(
      children: [
        Container(
          width: screenWidth * 0.11,
          height: screenWidth * 0.050,
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Row(
            children: [
              2.x,
              imageurl != ''
                  ? CustomImage(
                      isAssetImage: false,
                      width: screenWidth * 0.020,
                      imageUrl: Assets.graph,
                    )
                  : CustomImage(
                      width: screenWidth * 0.020,
                      isAssetImage: false,
                      imageUrl: imageurl,
                    ),
              2.x,
              Column(
                children: [
                  7.y,
                  CustomText(
                    customText: title!,
                    textStyle: Styles.plusJakartaSans(
                      context,
                      fontSize: screenWidth * 0.008,
                      fontWeight: FontWeight.w400,
                      color: AppColors.greyText,
                    ),
                  ),
                  CustomText(
                    customText: amount ?? "323.3",
                    textStyle: Styles.plusJakartaSans(
                      context,
                      fontSize: screenWidth * 0.010,
                      fontWeight: FontWeight.bold,
                      color: AppColors.blackColor,
                    ),
                  ),
                  subAmount != null
                      ? CustomText(
                          customText: subAmount!,
                          textStyle: Styles.plusJakartaSans(
                            context,
                            fontSize: screenWidth * 0.007,
                            fontWeight: FontWeight.bold,
                            color: AppColors.blackColor,
                          ),
                        )
                      : SizedBox(
                          width: screenWidth * 0.000001,
                        )
                ],
              ),
            ],
          ),
        ),
        8.x,
      ],
    );
  }
}
