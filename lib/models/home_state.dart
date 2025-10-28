import 'package:equatable/equatable.dart';

class WorkoutData extends Equatable {
  final String date;
  final String duration;
  final String title;
  final bool hasWorkout;

  const WorkoutData({
    required this.date,
    required this.duration,
    required this.title,
    required this.hasWorkout,
  });

  @override
  List<Object?> get props => [date, duration, title, hasWorkout];
}

class InsightData extends Equatable {
  final String titlePrimary;
  final String titleSecondry;
  final String subtitle;
  final String? value;
  final double? progress;
  final String? progressLabel;
  final String? progressEndLabel;

  const InsightData({
    required this.titlePrimary,
    required this.titleSecondry,
    required this.subtitle,
    this.value,
    this.progress,
    this.progressLabel,
    this.progressEndLabel,
  });

  @override
  List<Object?> get props => [titlePrimary, titleSecondry, subtitle, value, progress, progressLabel, progressEndLabel];
}

class HydrationData extends Equatable {
  final int percentage;
  final int currentMl;
  final int totalMl;
  final String lastAdded;

  const HydrationData({
    required this.percentage,
    required this.currentMl,
    required this.totalMl,
    required this.lastAdded,
  });

  @override
  List<Object?> get props => [percentage, currentMl, totalMl, lastAdded];
}

class HomeState extends Equatable {
  final DateTime selectedDate;
  final int currentWeek;
  final int totalWeeks;
  final WorkoutData? currentWorkout;
  final List<InsightData> insights;
  final HydrationData hydration;
  final String temperature;
  final bool isDayTime;

  const HomeState({
    required this.selectedDate,
    required this.currentWeek,
    required this.totalWeeks,
    this.currentWorkout,
    required this.insights,
    required this.hydration,
    required this.temperature,
    required this.isDayTime,
  });

  HomeState copyWith({
    DateTime? selectedDate,
    int? currentWeek,
    int? totalWeeks,
    WorkoutData? currentWorkout,
    List<InsightData>? insights,
    HydrationData? hydration,
    String? temperature,
    bool? isDayTime,
  }) {
    return HomeState(
      selectedDate: selectedDate ?? this.selectedDate,
      currentWeek: currentWeek ?? this.currentWeek,
      totalWeeks: totalWeeks ?? this.totalWeeks,
      currentWorkout: currentWorkout ?? this.currentWorkout,
      insights: insights ?? this.insights,
      hydration: hydration ?? this.hydration,
      temperature: temperature ?? this.temperature,
      isDayTime: isDayTime ?? this.isDayTime,
    );
  }

  @override
  List<Object?> get props => [
        selectedDate,
        currentWeek,
        totalWeeks,
        currentWorkout,
        insights,
        hydration,
        temperature,
        isDayTime,
      ];
}
