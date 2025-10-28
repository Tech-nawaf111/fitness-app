import 'package:equatable/equatable.dart';

abstract class HomeEvent extends Equatable {
  const HomeEvent();

  @override
  List<Object?> get props => [];
}

class LoadHomeData extends HomeEvent {
  const LoadHomeData();
}

class SelectDate extends HomeEvent {
  final DateTime date;

  const SelectDate(this.date);

  @override
  List<Object?> get props => [date];
}

class ChangeWeek extends HomeEvent {
  final int week;

  const ChangeWeek(this.week);

  @override
  List<Object?> get props => [week];
}

class UpdateHydration extends HomeEvent {
  final int ml;

  const UpdateHydration(this.ml);

  @override
  List<Object?> get props => [ml];
}
