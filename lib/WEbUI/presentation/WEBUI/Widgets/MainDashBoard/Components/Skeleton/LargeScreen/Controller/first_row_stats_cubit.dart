import 'dart:developer';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notifications/WEbUI/Data/Repository/FirstRowStatsRepo/first_row_stats_repo.dart';
import 'package:notifications/WEbUI/Domain/Model/FirstRowStatsModel.dart';
import 'package:notifications/WEbUI/presentation/WEBUI/Widgets/MainDashBoard/Components/Skeleton/LargeScreen/Controller/first_row_stats_states.dart';

class FirstRowStatsCubit extends Cubit<FirstRowStatsStates> {
  FirstRowStatsCubit() : super(FirstRowStatsInitialState());

  List firstRowStatsModelData = [];

  Future<void> getFirstRowStats() async {
    log('insideforwod');
    emit(FirstRowStatsInitialState());

    try {
      List firstRowStatsData = FirstRowStatsRepo.getfirstRowStats();

      if (firstRowStatsData != null) {
        firstRowStatsModelData = List<FirstRowStatsModel>.from(
            firstRowStatsData.map((e) => FirstRowStatsModel.fromJson(e)));

        emit(FirstRowStatsLoadedState(
            firstRowStatsModelData as List<FirstRowStatsModel>));
      }
    } catch (e) {
      log('error in FirstRow cubit $e');
    }
  }
}
