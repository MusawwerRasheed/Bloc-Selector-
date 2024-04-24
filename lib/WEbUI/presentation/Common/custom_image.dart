 import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:notifications/BlocSelectorApi/Data/DataResource/Resources/assets.dart';

class CustomImage extends StatelessWidget {
  final String? imageUrl;
  final String? imageType;
  final bool isAssetImage;
  final double? height;
  final double? width;
  final BoxFit? fit;
  
  const CustomImage({

    required this.isAssetImage,
    this.fit,
    this.width,
    this.imageType,
    this.imageUrl,
    this.height,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    
    return isAssetImage
        ? Image.asset(
            imageUrl ?? Assets.logo!,
            height: height ?? 100.h,
            fit: fit ?? BoxFit.fill,
            width: width,
          )
        :
         Image.network(
            imageUrl ?? '',
            height: height ?? 100.h,
            fit: fit ?? BoxFit.fill,
            width: width,
          );
  }
}
