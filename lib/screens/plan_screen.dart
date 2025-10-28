import 'package:flutter/material.dart';

class PlanScreen extends StatefulWidget {
  const PlanScreen({super.key});

  @override
  State<PlanScreen> createState() => _PlanScreenState();
}

class _PlanScreenState extends State<PlanScreen> {
  final Map<String, List<String>> workouts = {
    "Mon 8": ["Arm Blaster"],
    "Tue 9": [],
    "Wed 10": [],
    "Thu 11": ["Leg Day Blitz"],
    "Fri 12": [],
    "Sat 13": [],
    "Sun 14": [],
  };

  String? draggedWorkout;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text("Training Calendar",
        style: TextStyle(
          fontSize: 24,
          fontFamily: 'mulish',
          fontWeight: FontWeight.w400
        ),),
        backgroundColor: Colors.black,
        foregroundColor: Colors.white,
        elevation: 0,
        actions: [
          TextButton(
            onPressed: () {},
            child: const Text("Save", style: TextStyle(color: Colors.white)),
          )
        ],
      ),
      body:Column(
    children: [
      Container(
        color: Colors.grey[900],
        padding: const EdgeInsets.all(16),
        child: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Week 2/8",
              style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 4),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("December 8–14", style: TextStyle(color: Colors.white54)),
                Text("Total: 60min", style: TextStyle(color: Colors.white54)),
              ],
            ),
          ],
        ),
      ),
      // Use Expanded here for the main content
      Expanded(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: ListView(
            children: workouts.keys.map((day) {
              final items = workouts[day]!;
              return DragTarget<String>(
                // ignore: deprecated_member_use
                onAccept: (received) {
                  setState(() {
                    workouts.forEach((key, value) => value.remove(received));
                    items.add(received);
                  });
                },
                builder: (context, candidateData, rejectedData) {
                  return Container(
                    margin: const EdgeInsets.only(bottom: 12),
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    decoration: BoxDecoration(
                      color: Colors.transparent,
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(
                        color: candidateData.isNotEmpty
                            ? Colors.blueAccent
                            : Colors.transparent,
                        width: 1,
                      ),
                    ),
                    child:Column(
  crossAxisAlignment: CrossAxisAlignment.start,
  children: [
    Text(
      day,
      style: const TextStyle(color: Colors.white70, fontSize: 16),
    ),
    const SizedBox(height: 6),

    // Build each workout card + divider
    ...List.generate(items.length, (index) {
      final workout = items[index];
      return Column(
        children: [
          _buildDraggableCard(workout),
          const SizedBox(height: 6),
          Container(
            height: 1,
            color: Colors.white24, // <-- pure or near-white line
          ),
        ],
      );
    }),

    // Always show one bottom line (even if empty)
    if (items.isEmpty)
      Container(
        margin: const EdgeInsets.only(top: 20),
        height: 1,
        color:const Color(0xFF282A39),
      ),
  ],
)


                  );
                },
              );
            }).toList(),
          ),
        ),
      ),
    ],
  ),

    );
  }

Widget _buildDraggableCard(String title) {
  return LongPressDraggable<String>(
    data: title,
    feedback: Opacity(
      opacity: 0.8,
      child: _workoutCard(title, isDragging: true),
    ),
    childWhenDragging: Opacity(opacity: 0.3, child: _workoutCard(title)),
    child: _workoutCard(title),
  );
}

Widget _workoutCard(String title, {bool isDragging = false}) {
  final bool isLegWorkout = title.contains("Leg");
  final String tag = isLegWorkout ? "🏃‍♂️ Leg Workout" : "💪 Arm Workout";
  const String duration = "25m - 30m";

  return Container(
  
    decoration: BoxDecoration(
      color: const Color(0xFF1A1A1A),
      borderRadius: BorderRadius.circular(14),
      boxShadow: isDragging
          ? [
              BoxShadow(
                // ignore: deprecated_member_use
                color: Colors.black.withOpacity(0.3),
                blurRadius: 8,
                offset: const Offset(0, 4),
              )
            ]
          : [],
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
             Container(
              width: 14,
              height: 80,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(12),
                  bottomLeft: Radius.circular(12),
                ),
              ),
            ),
            const SizedBox(width: 10),

            Padding(
              padding: const EdgeInsets.only(bottom: 24),
              child: Image.asset('assets/icons/Vector.png'),
            ),
           const SizedBox(width: 4,),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                  decoration: BoxDecoration(
                    // ignore: deprecated_member_use
                    color: isLegWorkout? const Color(0xFF3C3CE6).withOpacity(0.2): const Color(0xFF20B76F).withOpacity(0.17),
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: Text(
                    tag,
                    style:  TextStyle(
                      color:  isLegWorkout?const Color(0xFF8080FF):const Color(0xFF20B76F),
                      fontSize: 11,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  title,
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                    fontSize: 15,
                  ),
                ),
              ],
            ),
          ],
        ),

        // Duration text
        const Padding(
          padding: EdgeInsets.only(right: 12,top: 20),
          child: Text(
            duration,
            style: TextStyle(
              color: Colors.white,
              fontSize: 14,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
      ],
    ),
  );
}

}
