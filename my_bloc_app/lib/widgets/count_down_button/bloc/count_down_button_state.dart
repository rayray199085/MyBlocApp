part of 'count_down_button_cubit.dart';

enum CountDownStatus {
  initialized,
  inProgress,
  completed,
}

class CountDownButtonState extends Equatable {
  const CountDownButtonState({
    required this.count,
    required this.status,
  });

  final CountDownStatus status;
  final int count;

  CountDownButtonState copyWith({
    int? count,
    required CountDownStatus status,
  }) {
    return CountDownButtonState(
      count: count ?? this.count,
      status: status,
    );
  }

  @override
  List<Object> get props => [
        count,
        status,
      ];
}
