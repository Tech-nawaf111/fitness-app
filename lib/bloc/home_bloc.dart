import 'package:flutter_bloc/flutter_bloc.dart';
import '../models/home_state.dart';
import 'home_event.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeState(
    selectedDate: DateTime.now(),
    currentWeek: 1,
    totalWeeks: 4,
    currentWorkout: const WorkoutData(
      date: 'December 22',
      duration: '25m - 30m',
      title: 'Upper Body',
      hasWorkout: true,
    ),
    insights: const [
     InsightData(
        titlePrimary: '550',
        titleSecondry: 'Calories',
        subtitle: '1950 Remaining',
        progress: 0.22,
        progressLabel: '0',
        progressEndLabel: '2500',
      ),
      InsightData(
        titlePrimary: '75',
        titleSecondry: 'kg',
        subtitle: 'Weight',
        value: '+1.6kg',
      ),
    ],
    hydration: const HydrationData(
      percentage: 0,
      currentMl: 0,
      totalMl: 2000,
      lastAdded: '500 ml added to water log',
    ),
    temperature: '9°',
    isDayTime:  DateTime.now().hour >= 6 &&  DateTime.now().hour < 18,
  )) {
    on<LoadHomeData>(_onLoadHomeData);
    on<SelectDate>(_onSelectDate);
    on<ChangeWeek>(_onChangeWeek);
    on<UpdateHydration>(_onUpdateHydration);
  }

  void _onLoadHomeData(LoadHomeData event, Emitter<HomeState> emit) {
    // Data is already loaded in initial state
    emit(state);
  }

  void _onSelectDate(SelectDate event, Emitter<HomeState> emit) {
    emit(state.copyWith(selectedDate: event.date));
  }

  void _onChangeWeek(ChangeWeek event, Emitter<HomeState> emit) {
    emit(state.copyWith(currentWeek: event.week));
  }

  void _onUpdateHydration(UpdateHydration event, Emitter<HomeState> emit) {
    final newMl = state.hydration.currentMl + event.ml;
    final newPercentage = (newMl / state.hydration.totalMl * 100).round();
    
    final updatedHydration = HydrationData(
      percentage: newPercentage,
      currentMl: newMl,
      totalMl: state.hydration.totalMl,
      lastAdded: '${event.ml} ml added to water log',
    );
    
    emit(state.copyWith(hydration: updatedHydration));
  }
}
