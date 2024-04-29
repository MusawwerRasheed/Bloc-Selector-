import 'package:notifications/BlocSelectorApi/Data/DataResource/Resources/utils.dart';
import 'package:notifications/WEbUI/Data/Resources/utils.dart';
import 'dart:developer';
import 'package:notifications/WEbUI/Domain/Model/FirstRowStatsModel.dart';


class FirstRowStatsRepo {
static List<Map<String,dynamic>> getfirstRowStats() {
  
final firstRowStatsData = Utils.firstRowStatsData;
return firstRowStatsData ;

}
}
