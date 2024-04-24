import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:notifications/BlocSelectorApi/Data/DataResource/Resources/assets.dart';
import 'package:notifications/BlocSelectorApi/Data/DataResource/Resources/color.dart';
import 'package:notifications/BlocSelectorApi/Data/DataResource/Resources/extensions.dart';
import 'package:notifications/BlocSelectorApi/Data/DataResource/Resources/styles.dart';
import 'package:notifications/WEbUI/Data/Resources/strings.dart';
import 'package:notifications/WEbUI/presentation/Common/custom_text.dart';

class LeftContainer extends StatelessWidget {
  final bool forLargeScreen;
  LeftContainer({
    required this.forLargeScreen,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: Container(
        color: AppColors.white,
        padding: EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Visibility(
                visible: forLargeScreen ? false : true,
                child: Image.asset(Assets.logo)),
            CustomText(
              customText: AppStrings.signIn,
              textStyle: Styles.plusJakartaSans(context, fontSize: 24),
            ),
             
            20.y,
            CustomText(
                customText: AppStrings.email,
                textStyle: Styles.plusJakartaSans(context,
                    fontWeight: FontWeight.w400 , fontSize: 15)),
             
            TextField(
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey[400]!),
                  borderRadius: BorderRadius.circular(15 , ),
                ),
                labelText: 'mail@example.com',
                labelStyle: TextStyle(color: Colors.grey),
              ),
            ),
            SizedBox(height: 10),
            CustomText(
                customText: AppStrings.password,
                textStyle: Styles.plusJakartaSans(context,
                    fontWeight: FontWeight.w500, fontSize: 12)),
            TextField(
              obscureText: true,
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey[400]!),
                  borderRadius: BorderRadius.circular(15),
                ),
                labelText: 'min 8 characters',
                labelStyle: TextStyle(color: Colors.grey),
                suffixIcon: Icon(Icons.visibility_off_outlined),
              ),
            ),
            SizedBox(height: 10),
            Row(
              children: [
                Checkbox(value: true, onChanged: (_) {}),
                CustomText(
                  customText: AppStrings.keepMeLoggedIn, textStyle: Styles.smallPlusJakartaSans(context, fontSize: 12),
                ),
                Spacer(),
                CustomText(customText: AppStrings.forgotPassword  ,textStyle: Styles.plusJakartaSans(context, fontSize: 12),),
              ],
            ),
             20.y, 
            ElevatedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Color(0xff4318FF)),
                shape: MaterialStateProperty.all(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              onPressed: () {},
              child: Container(
                width: double.infinity,
                height: 40,
                alignment: Alignment.center,

                child:  CustomText(customText: AppStrings.signIn,  textStyle:
                    Styles.plusJakartaSans(context, color: AppColors.white, fontSize: 12)  )
               ),
            ), 
            10.y, 
            CustomText(customText: AppStrings.notRegisteredYet, ) 
          ],
        ),
      ),
    );
  }
}
