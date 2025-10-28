import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

class MoodScreen extends StatefulWidget {
  const MoodScreen({super.key});

  @override
  State<MoodScreen> createState() => _MoodScreenState();
}

class _MoodScreenState extends State<MoodScreen> {
  double moodValue = 50;

  String get moodLabel {
    if (moodValue < 25) return "Calm";
    if (moodValue < 50) return "Content";
    if (moodValue < 75) return "Peaceful";
    return "Happy";
  }

  String get moodImage {
    if (moodValue < 25) return 'assets/images/calm.png';
    if (moodValue < 50) return 'assets/images/content.png';
    if (moodValue < 75) return 'assets/images/Peaceful.png';
    return 'assets/images/happy.png';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0D0D0D),
      body: Stack(
        children: [
          // Top decorative background image
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Image.asset(
              'assets/images/moodbg.png', // <-- your background design image
              fit: BoxFit.cover,
              height: 250,
            ),
          ),

          // Main content
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Mood",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 28,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const SizedBox(height: 4),
                  const Text(
                    "Start your day",
                    style: TextStyle(
                      color: Colors.white54,
                      fontSize: 14,
                    ),
                  ),
                  const SizedBox(height: 14),
                  const Text(
                    "How are you feeling at the\nMoment?",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      height: 1.4,
                    ),
                  ),
                  const SizedBox(height: 40),

                  // Center mood gauge and image
                  Center(
                    child: Column(
                      children: [
                        SizedBox(
                          width: 230,
                          height: 230,
                          child: Stack(
                            alignment: Alignment.center,
                            children: [
                              SfRadialGauge(
                                axes: <RadialAxis>[
                                  RadialAxis(
                                    showLabels: false,
                                    showTicks: false,
                                    startAngle: 270,
                                    endAngle: 270,
                                    radiusFactor: 1,
                                    axisLineStyle: const AxisLineStyle(
                                      thickness: 25,
                                      cornerStyle: CornerStyle.bothFlat,
                                      gradient: SweepGradient(
                                        colors: [
                                          Color(0xFF6EB9AD),
                                          Color(0xFFC9BBEF),
                                          Color(0xFFF28DB3),
                                          Color(0xFFF99955),
                                        ],
                                        stops: [0.1, 0.4, 0.7, 1.0],
                                      ),
                                    ),
                                    pointers: <GaugePointer>[
                                      MarkerPointer(
                                        value: 100 - moodValue,
                                        markerType: MarkerType.circle,
                                        color: Colors.white,
                                        markerHeight: 18,
                                        markerWidth: 18,
                                        enableDragging: true,
                                        onValueChanged: (value) {
                                          setState(() {
                                            moodValue = 100 - value;
                                          });
                                        },
                                      ),
                                    ],
                                  ),
                                ],
                              ),

                              // Center mood image
                              Image.asset(
                                moodImage,
                                width: 70,
                                height: 70,
                                fit: BoxFit.contain,
                              ),
                            ],
                          ),
                        ),

                        const SizedBox(height: 24),

                        // Mood label below the ring
                        Text(
                          moodLabel,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 22,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),

                  const Spacer(),

                  // Continue button
                  SizedBox(
                    width: double.infinity,
                    height: 54,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      onPressed: () {},
                      child: const Text(
                        "Continue",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
