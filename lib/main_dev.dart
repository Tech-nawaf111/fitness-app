import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'config/app_config.dart';
import 'utils/error_handler.dart';
import 'utils/logger.dart';
import 'screens/plan_screen.dart';
import 'screens/nutrition_screen.dart';
import 'screens/mood_screen.dart';
import 'screens/profile_screen.dart';
import 'theme/app_theme.dart';
import 'bloc/home_bloc.dart';
import 'bloc/home_event.dart';

void main() {
  // Initialize error handling
  ErrorHandler.initializeErrorHandling();
  
  // Set environment
  AppConfig.setEnvironment(Environment.dev);
  
  // Initialize logger
  Logger.info('Starting Fitness App in Development mode');
  
  runApp(const FitnessApp());
}

class FitnessApp extends StatelessWidget {
  const FitnessApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<HomeBloc>(
          create: (context) => HomeBloc()..add(const LoadHomeData()),
        ),
      ],
      child: MaterialApp(
        title: AppConfig.appName,
        theme: AppTheme.darkTheme,
        debugShowCheckedModeBanner: true, // Show debug banner in dev
        home: const MainScreen(),
        builder: (context, child) {
          return Banner(
            message: 'DEV',
            location: BannerLocation.topEnd,
            color: Colors.red,
            child: child!,
          );
        },
      ),
    );
  }
}

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _currentIndex = 1; // Start with Plan tab selected

  final List<Widget> _screens = [
    const NutritionScreen(),
    const PlanScreen(),
    const MoodScreen(),
    const ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.backgroundColor,
      body: IndexedStack(
        index: _currentIndex,
        children: _screens,
      ),
      bottomNavigationBar: Container(
        height: 80,
        decoration: const BoxDecoration(
          color: AppTheme.cardColor,
          border: Border(
            top: BorderSide(color: AppTheme.borderColor, width: 0.5),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _buildNavItem(0, 'Nutrition'),
            _buildNavItem(1, 'Plan'),
            _buildNavItem(2, 'Mood'),
            _buildNavItem(3, 'Profile'),
          ],
        ),
      ),
    );
  }

  Widget _buildNavItem(int index, String label) {
    final isSelected = _currentIndex == index;
    return GestureDetector(
      onTap: () {
        setState(() {
          _currentIndex = index;
        });
      },
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
        decoration: BoxDecoration(
          // ignore: deprecated_member_use
          color: isSelected ? AppTheme.accentColor.withOpacity(0.2) : Colors.transparent,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(
              index == 0
                  ? 'assets/icons/nutrition.png'
                  : index == 1
                      ? 'assets/icons/plan.png'
                      : index == 2
                          ? 'assets/icons/mode.png'
                          : 'assets/icons/profile.png',
              color: isSelected ? AppTheme.accentColor : AppTheme.textSecondary,
              height: 24,
              width: 24,
            ),
            const SizedBox(height: 4),
            Text(
              label,
              style: TextStyle(
                color: isSelected ? AppTheme.accentColor : AppTheme.textSecondary,
                fontSize: 12,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
