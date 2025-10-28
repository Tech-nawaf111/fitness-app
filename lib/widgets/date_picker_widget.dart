// date_picker_widget.dart
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../theme/app_theme.dart';
// adjust path
// SelectDate event path

class DatePickerWidget extends StatelessWidget {
  final DateTime selectedDate;
  final Function(DateTime) onDateSelected;

  const DatePickerWidget({
    super.key,
    required this.selectedDate,
    required this.onDateSelected,
  });

  // --- Helpers: weeks in month logic ---

  // Return list of DateTimes for the week (Mon..Sun) that contains `date`
  List<DateTime> weekForDate(DateTime date) {
    final monday = date.subtract(Duration(days: (date.weekday - DateTime.monday)));
    return List.generate(7, (i) => DateTime(monday.year, monday.month, monday.day + i));
  }

  // Calculate week index (1-based) of `date` inside its month. Weeks start Monday.
  int weekIndexInMonth(DateTime date) {
    final firstOfMonth = DateTime(date.year, date.month, 1);
    // index of the Monday-start week containing the first day:
    final firstWeekStart = firstOfMonth.subtract(Duration(days: (firstOfMonth.weekday - DateTime.monday)));
    // number of full weeks between firstWeekStart and the week that contains date
    final targetWeekStart = date.subtract(Duration(days: (date.weekday - DateTime.monday)));
    final difference = targetWeekStart.difference(firstWeekStart).inDays;
    final weekIndex = (difference ~/ 7) + 1;
    return weekIndex;
  }

  // Count how many Monday-start weeks are needed to cover the month
  int totalWeeksInMonth(DateTime date) {
    final firstOfMonth = DateTime(date.year, date.month, 1);
    final lastOfMonth = DateTime(date.year, date.month + 1, 0);
    final firstWeekStart = firstOfMonth.subtract(Duration(days: (firstOfMonth.weekday - DateTime.monday)));
    final lastWeekStart = lastOfMonth.subtract(Duration(days: (lastOfMonth.weekday - DateTime.monday)));
    final difference = lastWeekStart.difference(firstWeekStart).inDays;
    return (difference ~/ 7) + 1;
  }

  // --- End helpers ---

  @override
  Widget build(BuildContext context) {
    final weekDates = weekForDate(selectedDate);
    final weekIndex = weekIndexInMonth(selectedDate);
    final totalWeeks = totalWeeksInMonth(selectedDate);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Header: date row and Week X/Y

            Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
         Image.asset('assets/icons/bell.png'),
          Column(
            children: [
                GestureDetector(
                onTap: () => _openCalendarBottomSheet(context),
                child:
              Row(
                children: [
                  Image.asset('assets/icons/week.png'),
                  Text(
                         'Week $weekIndex/$totalWeeks',
                    style: const TextStyle(
                      color: AppTheme.textPrimary,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(width: 4),
                 const Icon(
                    Icons.keyboard_arrow_down,
                    color: AppTheme.textPrimary,
                    size: 16,
                  ),
                ],
              ),
                ),
            ],
          ),
          const SizedBox(width: 24), // Balance the bell icon
        ],
      ),
    ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
          child: Row(
            children: [
              // Today & month label (left) - optional, you can change text here
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      DateFormat('EEEE, dd MMM yyyy').format(selectedDate),
                      style: const TextStyle(
                        color: AppTheme.textPrimary,
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                 
                  ],
                ),
              ),
            ],
          ),
        ),

        // Horizontal week strip
        SizedBox(
          height: 100,
          child: ListView.separated(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            scrollDirection: Axis.horizontal,
            itemCount: weekDates.length,
            separatorBuilder: (_, __) => const SizedBox(width: 8),
            itemBuilder: (context, idx) {
              final date = weekDates[idx];
              final isSelected = date.year == selectedDate.year &&
                  date.month == selectedDate.month &&
                  date.day == selectedDate.day;
              // Replace this with real logic if you keep track of workouts per date
              final hasWorkout = [22, 24, 26].contains(date.day);

              return GestureDetector(
                onTap: () {
                  // notify parent (which will dispatch the Bloc event)
                  onDateSelected(date);
                },
                child: Container(
                  width: 64,
                  padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 6),
                  decoration: BoxDecoration(
                    // ignore: deprecated_member_use
                    color: isSelected ? AppTheme.accentColor.withOpacity(0.12) : Colors.transparent,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        DateFormat('E').format(date),
                        style: const TextStyle(
                          color: AppTheme.textSecondary,
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(height: 6),
                      Container(
                        width: 40,
                        height: 40,
                        decoration: BoxDecoration(
                          color: isSelected ? AppTheme.accentColor : Colors.transparent,
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: isSelected ? Colors.transparent : AppTheme.borderColor,
                            width: 1,
                          ),
                        ),
                        alignment: Alignment.center,
                        child: Text(
                          '${date.day}',
                          style: TextStyle(
                            color: isSelected ? AppTheme.backgroundColor : AppTheme.textPrimary,
                            fontSize: 15,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                      const SizedBox(height: 6),
                      // small dot if workout exists
                      hasWorkout
                          ? Container(
                              width: 6,
                              height: 6,
                              decoration:const BoxDecoration(
                                color: AppTheme.accentColor,
                                shape: BoxShape.circle,
                              ),
                            )
                          : const SizedBox(height: 6),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  // Open bottom sheet (calendar month view)
  Future<void> _openCalendarBottomSheet(BuildContext context) async {
    final chosen = await showModalBottomSheet<DateTime>(
      context: context,
      isScrollControlled: true,
      backgroundColor: AppTheme.cardColor,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (ctx) {
        return _CalendarBottomSheetContent(
          initialDate: selectedDate,
        );
      },
    );

    if (chosen != null) {
      // return the selected date up to caller
      onDateSelected(chosen);
    }
  }
}

// Bottom sheet content: simple monthly grid (custom, no external package)
class _CalendarBottomSheetContent extends StatefulWidget {
  final DateTime initialDate;

  const _CalendarBottomSheetContent({required this.initialDate});

  @override
  State<_CalendarBottomSheetContent> createState() => _CalendarBottomSheetContentState();
}

class _CalendarBottomSheetContentState extends State<_CalendarBottomSheetContent> {
  late DateTime displayedMonth;
  DateTime? selected;

  @override
  void initState() {
    super.initState();
    displayedMonth = DateTime(widget.initialDate.year, widget.initialDate.month, 1);
    selected = widget.initialDate;
  }

  void _prevMonth() {
    setState(() {
      displayedMonth = DateTime(displayedMonth.year, displayedMonth.month - 1, 1);
    });
  }

  void _nextMonth() {
    setState(() {
      displayedMonth = DateTime(displayedMonth.year, displayedMonth.month + 1, 1);
    });
  }

  // Generate all visible days for the month grid (starting Monday)
  List<DateTime> _visibleDaysForMonth(DateTime month) {
    final firstOfMonth = DateTime(month.year, month.month, 1);
    final lastOfMonth = DateTime(month.year, month.month + 1, 0);
    // start from the Monday on or before the firstOfMonth
    final start = firstOfMonth.subtract(Duration(days: (firstOfMonth.weekday - DateTime.monday)));
    // end on the Sunday on or after the lastOfMonth
    final end = lastOfMonth.add(Duration(days: (DateTime.sunday - lastOfMonth.weekday)));
    final days = <DateTime>[];
    for (var d = start; !d.isAfter(end); d = d.add(const Duration(days: 1))) {
      days.add(d);
    }
    return days;
  }

  @override
  Widget build(BuildContext context) {
    final visibleDays = _visibleDaysForMonth(displayedMonth);
    final monthTitle = DateFormat('MMMM yyyy').format(displayedMonth);

    return SafeArea(
      top: false,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        // height: MediaQuery.of(context).size.height * 0.6, // let content size naturally
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Header row: month + arrows
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  onPressed: _prevMonth,
                  icon: const Icon(Icons.chevron_left),
                  color: AppTheme.textPrimary,
                ),
                Text(
                  monthTitle,
                  style: const TextStyle(
                    color: AppTheme.textPrimary,
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                IconButton(
                  onPressed: _nextMonth,
                  icon: const Icon(Icons.chevron_right),
                  color: AppTheme.textPrimary,
                ),
              ],
            ),
            const SizedBox(height: 8),

            // Weekday headers
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: List.generate(7, (i) {
                final weekday = DateFormat('E').format(DateTime(2020, 1, DateTime.monday + i));
                return Expanded(
                  child: Center(
                    child: Text(
                      weekday,
                      style: const TextStyle(
                        color: AppTheme.textSecondary,
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                );
              }),
            ),
            const SizedBox(height: 8),

            // Calendar grid
            Flexible(
              child: GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: visibleDays.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 7,
                  mainAxisSpacing: 6,
                  crossAxisSpacing: 6,
                  childAspectRatio: 1.2,
                ),
                itemBuilder: (ctx, idx) {
                  final day = visibleDays[idx];
                  final isFromMonth = day.month == displayedMonth.month;
                  final isSelected = selected != null &&
                      selected!.year == day.year &&
                      selected!.month == day.month &&
                      selected!.day == day.day;
                  final isToday = DateTime.now().year == day.year &&
                      DateTime.now().month == day.month &&
                      DateTime.now().day == day.day;

                  return GestureDetector(
                    onTap: isFromMonth
                        ? () {
                            setState(() => selected = day);
                            // pass selected date back and close
                            // ignore: use_build_context_synchronously
                            Future.microtask(() => Navigator.of(context).pop(day));
                          }
                        : null,
                    child: Container(
                      decoration: BoxDecoration(
                        color: isSelected
                            ? AppTheme.accentColor
                            : Colors.transparent,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      alignment: Alignment.center,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            '${day.day}',
                            style: TextStyle(
                              color: isFromMonth
                                  ? (isSelected ? AppTheme.backgroundColor : AppTheme.textPrimary)
                                  // ignore: deprecated_member_use
                                  : AppTheme.textSecondary.withOpacity(0.5),
                              fontWeight: isSelected ? FontWeight.w700 : FontWeight.w600,
                            ),
                          ),
                          const SizedBox(height: 4),
                          // small today's underline or dot
                          if (isToday && !isSelected)
                            Container(
                              width: 18,
                              height: 3,
                              decoration: BoxDecoration(
                                color: AppTheme.accentColor,
                                borderRadius: BorderRadius.circular(2),
                              ),
                            )
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),

            const SizedBox(height: 12),
            // Optional: Cancel button row
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                  onPressed: () => Navigator.of(context).pop(),
                  child: const Text(
                    'Cancel',
                    style: TextStyle(color: AppTheme.textSecondary),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
