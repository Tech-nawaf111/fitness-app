import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../theme/app_theme.dart';
import '../widgets/date_picker_widget.dart';
import '../widgets/workout_card.dart';
import '../widgets/insights_card.dart';
import '../widgets/hydration_widget.dart';
import '../bloc/home_bloc.dart';
import '../bloc/home_event.dart';
import '../models/home_state.dart';

class NutritionScreen extends StatelessWidget {
  const NutritionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        return Scaffold(
          backgroundColor: AppTheme.backgroundColor,
          body: SafeArea(
            child: Column(
              children: [       
             
                _buildDatePicker(state, context),
              
                Expanded(
                  child: SingleChildScrollView(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _buildWorkoutsSection(state, context),
                        const SizedBox(height: 24),
                        _buildInsightsSection(state),
                        const SizedBox(height: 24),
                        _buildHydrationSection(state),
                        const SizedBox(height: 100), // Space for bottom nav
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

 

Widget _buildDatePicker(HomeState state, BuildContext context) {
  return DatePickerWidget(
    selectedDate: state.selectedDate,
    onDateSelected: (date) {
      // dispatch the Bloc event (keeps your architecture)
      BlocProvider.of<HomeBloc>(context).add(SelectDate(date));
    },
  );
}


  Widget _buildWorkoutsSection(HomeState state, BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
           const Text(
          'Workouts ',
          style: TextStyle(
            color: AppTheme.textPrimary,
            fontSize: 24,
            fontFamily: 'mulish',
            fontWeight: FontWeight.w600,
          ),
        ),
            Row(
              children: [
                Icon(
                  state.isDayTime ? Icons.wb_sunny : Icons.nightlight_round,
                  color: AppTheme.textSecondary,
                  size: 16,
                ),
                const SizedBox(width: 4),
                Text(
                  state.temperature,
                  style: const TextStyle(
                    color: AppTheme.textSecondary,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ],
        ),
        const SizedBox(height: 12),
        if (state.currentWorkout != null)
          WorkoutCard(
            date: state.currentWorkout!.date,
            duration: state.currentWorkout!.duration,
            title: state.currentWorkout!.title,
            onTap: () {
            
            },
          ),
      ],
    );
  }

  Widget _buildInsightsSection(HomeState state) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'My Insights ',
          style: TextStyle(
            color: AppTheme.textPrimary,
            fontSize: 24,
            fontFamily: 'mulish',
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 12),
        Row(
          children: [
            Expanded(
              child: InsightsCard(
                titlePrimary: state.insights[0].titlePrimary,
                titleSecondry: state.insights[0].titleSecondry,
                subtitle: state.insights[0].subtitle,
                progress: state.insights[0].progress,
                progressLabel: state.insights[0].progressLabel,
                progressEndLabel: state.insights[0].progressEndLabel,
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: InsightsCard(
                titlePrimary: state.insights[1].titlePrimary,
                titleSecondry: state.insights[1].titleSecondry,
                subtitle: "",
                value: state.insights[1].value,
                valueColor: AppTheme.weightPositiveColor,
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildHydrationSection(HomeState state) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
      
         SizedBox(height: 12),
       Center(
    child: HydrationCard(progress: 0.33), // 33% filled
  ),
      ],
    );
  }
}