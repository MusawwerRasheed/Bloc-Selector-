import 'dart:developer';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notifications/WEbUI/Data/Repository/FirstRowStatsRepo/first_row_stats_repo.dart';
import 'package:notifications/WEbUI/Domain/Model/FirstRowStatsModel.dart';
import 'package:notifications/WEbUI/presentation/WEBUI/Widgets/MainDashBoard/Components/Skeleton/LargeScreen/Controller/first_row_stats_cubit.dart';


abstract class FirstRowStatsStates {}

class FirstRowStatsInitialState extends FirstRowStatsStates {}

class FirstRowStatsLoadedState extends FirstRowStatsStates {
  List<FirstRowStatsModel> firstRowStatsData = [];
  FirstRowStatsLoadedState(this.firstRowStatsData);
}

class FirstRowStatsErrorState extends FirstRowStatsStates {}
