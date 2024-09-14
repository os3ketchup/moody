import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:moody/helper/apptheme.dart';

import 'package:moody/screens/widgets/diary_mood.dart';
import 'package:moody/screens/widgets/mood_appbar.dart';
import 'package:moody/screens/widgets/stats.dart';
import 'package:moody/variables/icons.dart';
import 'package:moody/variables/util_variables.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';
import 'package:intl/intl.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool leftClicked = true;
  bool rightClicked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(vertical: 18.o),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              MoodAppbar(
                onLeftCLicked: (isLeftClicked) {
                  setState(() {
                    leftClicked = isLeftClicked;
                  });
                },
                onRightClicked: (isRightClicked) {
                  setState(() {
                    rightClicked = isRightClicked;
                  });
                },
                onCalendarClicked: () {
                  _showCalendarBottomSheet(context);
                },
              ),
              leftClicked ? const DiaryMoodWindow() : StatsWindow()
            ],
          ),
        ),
      ),
    );
  }

  void _showCalendarBottomSheet(BuildContext context) {
    showModalBottomSheet(
      useSafeArea: true,
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20.0)),
      ),
      builder: (context) {
        return DraggableScrollableSheet(
          expand: false,
          initialChildSize: 1,
          // Full-screen initially
          minChildSize: 0.7,
          // Allows shrinking to 70% of the screen
          maxChildSize: 1,
          // Expandable up to full screen
          builder: (context, scrollController) {
            // Get the current month index (for scrolling to the current month)
            final DateTime now = DateTime.now();
            final int currentMonthIndex =
                now.month - 1; // Month index (0-based)
            // Ensure scrolling happens after the widget is fully built
            WidgetsBinding.instance.addPostFrameCallback((_) {
              scrollController.jumpTo(
                currentMonthIndex *
                    400.0, // Adjust based on the approximate height of each month
              );
            });
            return SafeArea(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  SizedBox(height: 20.o), // Add space at the top

                  // Fixed Cancel Row
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        icon: SvgPicture.asset(SvgImages.cancel),
                      ),
                      TextButton(
                        onPressed: () {
                          // Handle 'Today' button action (Scroll to current month)
                          scrollController.animateTo(
                            currentMonthIndex * 400.0,
                            // Adjust based on the approximate height of each month
                            duration: Duration(milliseconds: 300),
                            curve: Curves.easeInOut,
                          );
                        },
                        child: Text(
                          'Сегодня',
                          style: theme.primaryTextStyle
                              .copyWith(color: theme.grey2),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 16),

                  // Fixed Weekday Row (пн вт ср ...)
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 18.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Пн',
                          style: theme.primaryTextStyle
                              .copyWith(fontSize: 14.o, color: theme.grey2),
                        ),
                        Text('Вт',
                            style: theme.primaryTextStyle
                                .copyWith(fontSize: 14.o, color: theme.grey2)),
                        Text('Ср',
                            style: theme.primaryTextStyle
                                .copyWith(fontSize: 14.o, color: theme.grey2)),
                        Text('Чт',
                            style: theme.primaryTextStyle
                                .copyWith(fontSize: 14.o, color: theme.grey2)),
                        Text('Пт',
                            style: theme.primaryTextStyle
                                .copyWith(fontSize: 14.o, color: theme.grey2)),
                        Text('Сб',
                            style: theme.primaryTextStyle
                                .copyWith(fontSize: 14.o, color: theme.grey2)),
                        Text('Вс',
                            style: theme.primaryTextStyle
                                .copyWith(fontSize: 14.o, color: theme.grey2)),
                      ],
                    ),
                  ),
                  SizedBox(height: 8),

                  // Scrollable calendar view
                  Expanded(
                    child: SingleChildScrollView(
                      padding: EdgeInsets.only(top: 100.o),
                      controller: scrollController,
                      child: ListView.builder(
                        itemCount: 12, // For 12 months
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) {
                          // For each month, create a new DateTime object
                          final DateTime month =
                              DateTime(now.year, index + 1, 1);

                          // Get the month name and year for the current index
                          final String monthName = DateFormat.MMMM('ru_RU')
                              .format(month); // Format the month name
                          String capitalizedMonthName =
                              monthName[0].toUpperCase() +
                                  monthName.substring(1);
                          final String year =
                              DateFormat.y().format(month); // Format the year

                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // Custom Month Header (Year on top, Month below)
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 8.0, horizontal: 16),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      year, // Display the year
                                      style: theme.primaryTextStyle.copyWith(
                                          color: theme.grey2,
                                          fontWeight: FontWeight.w800,
                                          fontSize: 16.o),
                                    ),
                                    Text(
                                      capitalizedMonthName,
                                      // Display the month name
                                      style: theme.primaryTextStyle.copyWith(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 22.o),
                                    ),
                                  ],
                                ),
                              ),

                              // Calendar View for each month
                              SfDateRangePicker(
                                backgroundColor: Colors.white,
                                view: DateRangePickerView.month,

                                monthCellStyle: DateRangePickerMonthCellStyle(
                                  todayCellDecoration: BoxDecoration(
                                    shape: BoxShape.rectangle,
                                    // Default shape for the cell

                                    // Add a dot as a decoration at the bottom center of the cell
                                    border: Border(
                                      bottom: BorderSide(
                                        color: Colors.orange,
                                        // Color for the small dot
                                        width: 1.o, // Correct size for the dot
                                      ),
                                    ),
                                  ),
                                  textStyle: theme.primaryTextStyle,
                                  todayTextStyle: theme.primaryTextStyle,
                                ),
                                initialDisplayDate: month,
                                // This will set the correct month to be displayed
                                monthViewSettings:
                                    const DateRangePickerMonthViewSettings(
                                  showTrailingAndLeadingDates: false,
                                  // Hide trailing dates
                                  dayFormat: '',
                                  // Remove week day names from each month
                                  firstDayOfWeek:
                                      1, // Set Monday as the first day of the week
                                ),
                                selectionMode:
                                    DateRangePickerSelectionMode.single,
                                showNavigationArrow: false,
                                headerHeight: 0,
                                // Hide the default header to avoid repeating it
                                selectionColor: Colors.orange.withOpacity(0.2),
                                selectionTextStyle: theme.primaryTextStyle,
                              ),
                            ],
                          );
                        },
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }
}
