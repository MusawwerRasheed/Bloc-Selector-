import 'package:flutter/material.dart';
import 'package:notifications/BlocSelectorApi/Data/DataResource/Resources/assets.dart';
import 'package:notifications/BlocSelectorApi/Data/DataResource/Resources/extensions.dart';
import 'package:notifications/WEbUI/presentation/Common/custom_image.dart';

class RightContainer extends StatelessWidget {
  const RightContainer({
    super.key,
    required this.isSmallScreen,
  });

  final bool isSmallScreen;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: !isSmallScreen
              ? BorderRadius.only(bottomLeft: Radius.circular(100))
              : null,
          gradient: const LinearGradient(
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter,
            colors: [
              Color(0xff0351F3), Color(0xffC7EEF9)],
          ),
        ),
        padding: EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
                 CustomImage(isAssetImage: true, imageUrl: Assets.logo,  ), 
    
            40.y, 
             
              Container(
                padding: EdgeInsets.symmetric(horizontal: 50, vertical: 20),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.white),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
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
             
            SizedBox(height: 150),
            Container(width: 250,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text('Marketplace', style: TextStyle(fontSize: 10, color: Colors.white)),
                  Text('License', style: TextStyle(fontSize: 10, color: Colors.white)),
                  Text('Terms of Use', style: TextStyle(fontSize: 10, color: Colors.white)),
                  Text('Blog', style: TextStyle(fontSize: 10, color: Colors.white)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
