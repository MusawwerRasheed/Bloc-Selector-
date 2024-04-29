import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:notifications/WEbUI/Data/Resources/assets.dart';
import 'package:notifications/WEbUI/Data/Resources/color.dart';
import 'package:notifications/WEbUI/Data/Resources/extensions.dart';
import 'package:notifications/WEbUI/Data/Resources/strings.dart';
import 'package:notifications/WEbUI/Data/Resources/styles.dart';
import 'package:notifications/WEbUI/presentation/Common/custom_image.dart';
import 'package:notifications/WEbUI/presentation/Common/custom_text.dart';

class NavTab extends StatelessWidget {
  String? imageUrl;
  String? text;
  NavTab({
    this.imageUrl,
    this.text,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Row(
      children: [
        CustomImage(
          height: screenWidth*0.010,
          isAssetImage: false,
          imageUrl: imageUrl,
        ),
        3.x,
        CustomText(
          customText: text ?? AppStrings.profile,
          textStyle: Styles.plusJakartaSans(
            context,
            color: AppColors.greyText,
            fontSize: screenWidth * 0.010,
            fontWeight: FontWeight.w500,
          ),
        )
      ],
    );
  }
}
