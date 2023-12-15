import 'package:app/data/pec.dart';
import 'package:app/widgets/card_pec.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ActivitiesTodayNotifier extends StateNotifier<List<Pec>> {
  ActivitiesTodayNotifier() : super([]);

  void updateTodayActivities(Pec today, int index) {
      var list = [...state];
      list[index] = today;
      state = [...list];
    // state = [];
  }

  void updateAllActivities(List<Pec> today) {
    state = [...today];
    // state = [];
  }

  List<Pec> today() {
    return [...state].toList();
  }
}

final activitiesTodayProvider = StateNotifierProvider<ActivitiesTodayNotifier, List<Pec>>((ref) {
  return ActivitiesTodayNotifier();
});