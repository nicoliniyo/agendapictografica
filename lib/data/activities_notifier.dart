import 'package:app/classes/app_logger.dart';

import 'package:app/widgets/card_pec.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ActivitiesTodayNotifier extends StateNotifier<List<CardPec>> {
  ActivitiesTodayNotifier() : super([]);

  var logInfo = AppLogger().noStackInfo;

  void clearActivities() {
    state = [];
  }
  // void updateTodayActivities(Pec today, int index) {
  //     logInfo('State $state');
  //     logInfo('today ${today.id}');
  //     logInfo('index $index');
  //     var list = state;
  //     list[index] = today;
  //     logInfo('list $list');
  //     state = [...list];
  //     logInfo('State $state');
  //   // state = [];
  // }

  // void updateAllActivities(List<Pec> today, int index) {
  //   state = [...today];
  //   logInfo('State $state');
  //   // state = [];
  // }

  void updateAllCardActivities(List<CardPec> today) {
    state = [...today];
    logInfo('State $state');
    // state = [];
  }

  // List<Pec> today() {
  //   return [...state].toList();
  // }
}

final activitiesTodayProvider = StateNotifierProvider<ActivitiesTodayNotifier, List<CardPec>>((ref) {
  return ActivitiesTodayNotifier();
});