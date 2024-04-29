import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:notifications/BlocSelectorApi/Data/DataResource/Resources/extensions.dart';
import 'package:notifications/BlocSelectorApi/Data/DataResource/Resources/styles.dart';
import 'package:notifications/WEbUI/Data/Resources/assets.dart';
import 'package:notifications/WEbUI/Data/Resources/color.dart';
import 'package:notifications/WEbUI/Data/Resources/strings.dart';
import 'package:notifications/WEbUI/presentation/Common/custom_image.dart';
import 'package:notifications/WEbUI/presentation/Common/custom_text.dart';
import 'package:notifications/WEbUI/presentation/WEBUI/Widgets/MainDashBoard/Components/Skeleton/LargeScreen/Components/check_tables.dart';
import 'package:notifications/WEbUI/presentation/WEBUI/Widgets/MainDashBoard/Components/Skeleton/LargeScreen/Components/daily_traffic.dart';
import 'package:notifications/WEbUI/presentation/WEBUI/Widgets/MainDashBoard/Components/Skeleton/LargeScreen/Components/monthly_data.dart';
import 'package:notifications/WEbUI/presentation/WEBUI/Widgets/MainDashBoard/Components/Skeleton/LargeScreen/Components/montly_pie_chart.dart';
import 'package:notifications/WEbUI/presentation/WEBUI/Widgets/MainDashBoard/Components/Skeleton/LargeScreen/Components/navigation_tab.dart';
import 'package:notifications/WEbUI/presentation/WEBUI/Widgets/MainDashBoard/Components/Skeleton/LargeScreen/Components/first_row_stat_item.dart';
import 'package:notifications/WEbUI/presentation/WEBUI/Widgets/MainDashBoard/Components/Skeleton/LargeScreen/Components/weekly_data.dart';
import 'package:notifications/WEbUI/presentation/WEBUI/Widgets/MainDashBoard/Components/Skeleton/LargeScreen/Controller/first_row_stats_cubit.dart';
import 'package:notifications/WEbUI/presentation/WEBUI/Widgets/MainDashBoard/Components/Skeleton/LargeScreen/Controller/first_row_stats_states.dart';

class LargeScreenLayout extends StatefulWidget {
  LargeScreenLayout({Key? key}) : super(key: key);

  @override
  State<LargeScreenLayout> createState() => _LargeScreenLayoutState();
}

class _LargeScreenLayoutState extends State<LargeScreenLayout> {
  @override
  initState() {
    context.read<FirstRowStatsCubit>().getFirstRowStats();
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Container(
        width: screenWidth,
        height: screenHeight,
        color: AppColors.backgroundColor,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Container(
              color: AppColors.white,
              width: 60.w,
              child: Padding(
                padding: const EdgeInsets.only(left: 45, top: 30),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: CustomImage(
                        isAssetImage: true,
                        imageUrl: Assets.logo,
                        width: 42.w,
                        height: 42.h,
                      ),
                    ),
                    20.y,
                    NavTab(
                      text: AppStrings.dashboard,
                      imageUrl: Assets.home,
                    ),
                    10.y,
                    NavTab(
                      text: AppStrings.nftMarketPlace,
                      imageUrl: Assets.cart,
                    ),
                    10.y,
                    NavTab(
                      text: AppStrings.tables,
                      imageUrl: Assets.greyGraph,
                    ),
                    10.y,
                    NavTab(
                      text: AppStrings.kanban,
                      imageUrl: Assets.grid,
                    ),
                    10.y,
                    NavTab(
                      text: AppStrings.profile,
                      imageUrl: Assets.person,
                    ),
                    10.y,
                    NavTab(
                      text: AppStrings.signIn,
                      imageUrl: Assets.lock,
                    ),
                    10.y,
                  ],
                ),
              ),
            ),
            10.x,
            SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  30.y,
                  Row(
                    children: [
                      CustomText(
                        customText: AppStrings.pagesslash,
                        textStyle: Styles.plusJakartaSans(context,
                            fontSize: screenWidth * 0.009,
                            fontWeight: FontWeight.w400,
                            color: AppColors.greyText),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      CustomText(
                        customText: AppStrings.mainDashboard,
                        textStyle: Styles.plusJakartaSans(context,
                            fontSize: screenWidth * 0.015,
                            fontWeight: FontWeight.bold,
                            color: AppColors.blackColor),
                      ),
                    ],
                  ),
                  10.y,
                  Row(
                    children: [
                      BlocBuilder<FirstRowStatsCubit, FirstRowStatsStates>(
                        builder: (context, state) {
                          if (state is FirstRowStatsLoadedState) {
                            // log(state.firstRowStatsData.length.toString());
                            // log(state.firstRowStatsData[1].title.toString());

                            return Container(
                              color: AppColors.backgroundColor,
                              height: screenHeight * 0.1,
                              width: screenWidth * 0.8,
                              child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: state.firstRowStatsData.length,
                                itemBuilder: (context, index) {
                                  final item = state.firstRowStatsData[index];
                                  return FirstRowStatItem(
                                    imageurl: item.imageurl,
                                    title: item.title,
                                    amount: item.amount,
                                    subAmount: item.subAmount,
                                    flags: item.flags,
                                  );
                                },
                              ),
                            );
                          } else {
                            return Container(
                              color: Colors.yellow,
                              height: 100,
                              width: 100,
                            );
                          }
                        },
                      )
                    ],
                  ),
                  10.y,
                  Row(
                    children: [
                      MonthlyGraph(
                          screenWidth: screenWidth, screenHeight: screenHeight),
                      5.x,
                      WeeklyData(
                          screenWidth: screenWidth, screenHeight: screenHeight),
                    ],
                  ),
                  20.y,
                  Row(
                    children: [
                      CheckTable(
                          screenWidth: screenWidth, screenHeight: screenHeight),
                      5.x,
                      DailyTraffic(
                          screenWidth: screenWidth, screenHeight: screenHeight),
                      5.x,
                      MonthlyPieChart(screenWidth: screenWidth, screenHeight: screenHeight)
                    ],
                  ),
                ],
              ),
            ),

            // Top row of stats

            Row(),

            // Second row contains continuous graph

            Row(),

            // Check NavTable Row

            Row(),

            // Complex NavTable Row

            Row(),

            // New Lesson Row

            Row(),
          ],
        ),
      ),
    );
  }
}
