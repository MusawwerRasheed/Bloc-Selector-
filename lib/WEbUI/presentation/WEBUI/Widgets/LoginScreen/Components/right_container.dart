import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:notifications/BlocSelectorApi/Data/DataResource/Resources/assets.dart';
import 'package:notifications/BlocSelectorApi/Data/DataResource/Resources/extensions.dart';
import 'package:notifications/WEbUI/presentation/Common/custom_image.dart';

class RightContainer extends StatelessWidget {
  double? reference;
  RightContainer({
    this.reference,
    super.key,
    required this.isSmallScreen,
  });

  final bool isSmallScreen;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: reference!*0.5,
      decoration: BoxDecoration(
        borderRadius: !isSmallScreen
            ? const BorderRadius.only(bottomLeft: Radius.circular(100))
            : null,
        gradient: const LinearGradient(
          begin: Alignment.bottomCenter,
          end: Alignment.topCenter,
          colors: [Color(0xff0351F3), Color(0xffC7EEF9)],
        ),
      ),
      padding: EdgeInsets.all(20.sp),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CustomImage(
            height: reference!*0.1.h,
            width: reference!*0.1.w,
            isAssetImage: true,
            imageUrl: Assets.logo,
          ),
          40.y,
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.white),
              borderRadius: BorderRadius.circular(10.r),
            ),
            child: const Column(
              children: [
                Text(
                  'Learn more about Horizon Union',
                  style: TextStyle(color: Colors.white),
                ),
                Text(
                  'Horizon-ui.com',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 100),
          Container(
            width: 250,
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text('Marketplace',
                    style: TextStyle(fontSize: 10, color: Colors.white)),
                Text('License',
                    style: TextStyle(fontSize: 10, color: Colors.white)),
                Text('Terms of Use',
                    style: TextStyle(fontSize: 10, color: Colors.white)),
                Text('Blog',
                    style: TextStyle(fontSize: 10, color: Colors.white)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
