import 'package:flutter/material.dart';
import 'package:flutter_quick_router/quick_router.dart';
import 'package:notifications/BlocSelectorApi/Data/DataResource/Resources/assets.dart';
import 'package:notifications/BlocSelectorApi/Data/DataResource/Resources/color.dart';
import 'package:notifications/BlocSelectorApi/Data/DataResource/Resources/extensions.dart';
import 'package:notifications/BlocSelectorApi/Data/DataResource/Resources/styles.dart';
import 'package:notifications/WEbUI/Data/Resources/strings.dart';
import 'package:notifications/WEbUI/presentation/Common/custom_image.dart';
import 'package:notifications/WEbUI/presentation/Common/custom_text.dart';
import 'package:notifications/WEbUI/presentation/WEBUI/Widgets/MainDashBoard/main_dash_board.dart';

class LeftContainer extends StatelessWidget {
  double? reference;
  final bool forLargeScreen;
  LeftContainer({
    required this.forLargeScreen,this.reference, 
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
       width: reference!*0.5,
      // padding: EdgeInsets.all(20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Visibility(
              visible: forLargeScreen ? false : true,
              child: Image.asset(Assets.logo)),
          20.y,
          CustomText(
            customText: AppStrings.signIn,
            textStyle: Styles.plusJakartaSans(context, fontSize: 24),
          ),
          CustomText(
            customText: AppStrings.enterEmail,
            textStyle: Styles.plusJakartaSans(context,
                fontSize: 12, color: AppColors.grey),
          ),
          10.y,
          Container(
            height: 40,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Color.fromARGB(255, 240, 240, 240),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const CustomImage(
                  isAssetImage: true,
                  imageUrl: Assets.googlelogo,
                  width: 20,
                  height: 20,
                ),
                3.x,
                CustomText(customText: AppStrings.signInWithGoogle)
              ],
            ),
          ),
          10.y,
          Row(
            children: [
              Expanded(
                child: Container(
                  width: 200,
                  height: 1,
                  color: AppColors.lightGrey,
                ),
              ),
              2.x,
              CustomText(
                customText: 'or',
                textStyle: Styles.plusJakartaSans(context, fontSize: 12),
              ),
              2.x,
              Expanded(
                  child: Container(
                width: 200,
                height: 1,
                color: AppColors.lightGrey,
              )),
            ],
          ),
          20.y,
          CustomText(
              customText: AppStrings.email,
              textStyle: Styles.plusJakartaSans(context,
                  fontWeight: FontWeight.w400, fontSize: 15)),
          TextField(
            decoration: InputDecoration(
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.grey[400]!),
                borderRadius: BorderRadius.circular(
                  15,
                ),
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
                customText: AppStrings.keepMeLoggedIn,
                textStyle: Styles.smallPlusJakartaSans(context, fontSize: 12),
              ),
              Spacer(),
              CustomText(
                customText: AppStrings.forgotPassword,
                textStyle: Styles.plusJakartaSans(context, fontSize: 12),
              ),
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
            onPressed: () {
              context.to(MainDashBoard()); 
            },
            child: Container(
                width: double.infinity,
                height: 40,
                alignment: Alignment.center,
                child: CustomText(
                    customText: AppStrings.signIn,
                    textStyle: Styles.plusJakartaSans(context,
                        color: AppColors.white, fontSize: 12))),
          ),
          10.y,
          CustomText(
            customText: AppStrings.notRegisteredYet,
          )
        ],
      ),
    );
  }
}
