import 'package:fitness_app/theme/app_theme.dart';
import 'package:flutter/material.dart';

class HydrationCard extends StatelessWidget {
  final double progress; // e.g. 0.33 for 33%
  const HydrationCard({super.key, required this.progress});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 170,
      decoration: BoxDecoration(
        color: AppTheme.cardColor,
        borderRadius: BorderRadius.circular(6),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 14, top: 12, right: 14),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // --- LEFT SIDE TEXT ---
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "${(progress * 100).toInt()}%",
                        style: const TextStyle(
                          fontSize: 26,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF7BBDE2),
                        ),
                      ),
                      const SizedBox(height: 20),
                      const Text(
                        "Hydration",
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(height: 2),
                      Text(
                        "Log Now",
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.grey.shade400,
                        ),
                      ),
                    ],
                  ),
                ),
SizedBox(
  height: 100,
  width: 200,
  child: Image.asset('assets/images/Chart.png'),
)
                // --- RIGHT SIDE CHART ---
                // SizedBox(
                //   width: 80,
                //   height: 100,
                //   child: Stack(
                //     children: [
                //       LineChart(
                //         LineChartData(
                //           minY: 0,
                //           maxY: 2,
                //           minX: 0,
                //           maxX: 1,
                //           gridData: FlGridData(
                //             show: true,
                //             drawVerticalLine: false,
                //             horizontalInterval: 0.25,
                //             getDrawingHorizontalLine: (value) {
                //               return FlLine(
                //                 color: Colors.grey.shade700,
                //                 strokeWidth: 0.5,
                //                 dashArray: [2, 4],
                //               );
                //             },
                //           ),
                //           titlesData: FlTitlesData(
                //             leftTitles: const AxisTitles(
                //               sideTitles: SideTitles(showTitles: false),
                //             ),
                //             rightTitles: AxisTitles(
                //               sideTitles: SideTitles(
                //                 showTitles: true,
                //                 reservedSize: 24,
                //                 interval: 1,
                //                 getTitlesWidget: (value, meta) {
                //                   if (value == 0) {
                //                     return const Text(
                //                       "0 L",
                //                       style: TextStyle(
                //                           color: Colors.white, fontSize: 10),
                //                     );
                //                   } else if (value == 2) {
                //                     return const Text(
                //                       "2 L",
                //                       style: TextStyle(
                //                           color: Colors.white, fontSize: 10),
                //                     );
                //                   }
                //                   return const SizedBox.shrink();
                //                 },
                //               ),
                //             ),
                //             bottomTitles: const AxisTitles(
                //               sideTitles: SideTitles(showTitles: false),
                //             ),
                //             topTitles: const AxisTitles(
                //               sideTitles: SideTitles(showTitles: false),
                //             ),
                //           ),
                //           borderData: FlBorderData(show: false),
                //           lineBarsData: [
                //             LineChartBarData(
                //               spots: [
                //                 FlSpot(0, 0),
                //                 FlSpot(0, 2 * progress),
                //               ],
                //               isCurved: false,
                //               barWidth: 6,
                //               dotData: FlDotData(show: false),
                //               belowBarData: BarAreaData(
                //                 show: true,
                //                 gradient: const LinearGradient(
                //                   begin: Alignment.bottomCenter,
                //                   end: Alignment.topCenter,
                //                   colors: [
                //                     Color(0xFF7BBDE2),
                //                     Color(0xFF69C0B1),
                //                     Color(0xFF60C198),
                //                   ],
                //                 ),
                //               ),
                //               gradient: const LinearGradient(
                //                 colors: [
                //                   Color(0xFF7BBDE2),
                //                   Color(0xFF69C0B1),
                //                   Color(0xFF60C198),
                //                 ],
                //                 begin: Alignment.bottomCenter,
                //                 end: Alignment.topCenter,
                //               ),
                //             ),
                //           ],
                //         ),
                //       ),
                //       Positioned(
                //         bottom: 0,
                //         right: 0,
                //         child: Text(
                //           "${(progress * 2000).toInt()}ml",
                //           style: const TextStyle(
                //               color: Colors.white, fontSize: 10),
                //         ),
                //       ),
                //     ],
                //   ),
                // ),
              ],
            ),
          ),

          // --- BOTTOM BAR ---
          Container(
            width: double.infinity,
            height: 42,
            decoration: const BoxDecoration(
              color: Color(0xFF214B50),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(6),
                bottomRight: Radius.circular(6),
              ),
            ),
            child: const Center(
              child: Text(
                "500 ml added  to water log",
                style: TextStyle(color: Colors.white, fontSize: 12),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
