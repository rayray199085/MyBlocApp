import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'count_down_button_state.dart';

const _initialCount = 60;

class CountDownButtonCubit extends Cubit<CountDownButtonState> {
  CountDownButtonCubit()
      : super(const CountDownButtonState(
          count: _initialCount,
          status: CountDownStatus.initialized,
        ));

  Timer? _timer;
  void startCounting() {
    if (_timer != null && _timer!.isActive) {
      _resetTimer();
    } else {
      _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
        int currentCount = _initialCount - timer.tick;
        if (currentCount >= 0) {
          emit(state.copyWith(
            count: currentCount,
            status: CountDownStatus.inProgress,
          ));
        } else {
          _resetTimer();
        }
      });
    }
  }

  void _resetTimer() {
    _timer?.cancel();
    _timer = null;
    emit(state.copyWith(status: CountDownStatus.completed));
  }

  @override
  Future<void> close() {
    _timer?.cancel();
    return super.close();
  }
}
