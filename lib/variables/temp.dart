// import 'package:flutter/material.dart';
// import 'package:syncfusion_flutter_datepicker/datepicker.dart';
//
// class CalendarWidget extends StatefulWidget {
//   @override
//   _CalendarWidgetState createState() => _CalendarWidgetState();
// }
//
// class _CalendarWidgetState extends State<CalendarWidget> {
//   bool showFullYear = false;
//   DateRangePickerController _controller = DateRangePickerController();
//
//   void _showCalendarBottomSheet(BuildContext context) {
//     showModalBottomSheet(
//       context: context,
//       isScrollControlled: true,
//       backgroundColor: Colors.transparent,
//       builder: (BuildContext context) {
//         return DraggableScrollableSheet(
//           initialChildSize: 0.6,
//           minChildSize: 0.5,
//           maxChildSize: 0.95,
//           builder: (BuildContext context, ScrollController scrollController) {
//             return Container(
//               decoration: BoxDecoration(
//                 color: Colors.white,
//                 borderRadius: BorderRadius.vertical(top: Radius.circular(25.0)),
//               ),
//               padding: EdgeInsets.all(16.0),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.stretch,
//                 children: [
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       Text(
//                         'Выберите дату',
//                         style: TextStyle(
//                           fontSize: 18,
//                           fontWeight: FontWeight.bold,
//                         ),
//                       ),
//                       IconButton(
//                         icon: Icon(
//                           showFullYear
//                               ? Icons.calendar_today_outlined
//                               : Icons.calendar_view_month,
//                         ),
//                         onPressed: () {
//                           setState(() {
//                             showFullYear = !showFullYear;
//                             _controller.view = showFullYear
//                                 ? DateRangePickerView.decade
//                                 : DateRangePickerView.month;
//                           });
//                         },
//                       ),
//                     ],
//                   ),
//                   Expanded(
//                     child: _buildDatePicker(),
//                   ),
//                 ],
//               ),
//             );
//           },
//         );
//       },
//     );
//   }
//
//   Widget _buildDatePicker() {
//     return SfDateRangePicker(
//       controller: _controller,
//       view: showFullYear ? DateRangePickerView.year : DateRangePickerView.month,
//       selectionMode: DateRangePickerSelectionMode.single,
//       showNavigationArrow: true,
//       enableMultiView: showFullYear,  // This will enable the multi-month view for the year
//       initialSelectedDate: DateTime.now(),
//       onSelectionChanged: _onDateSelected,
//       headerStyle: DateRangePickerHeaderStyle(
//         textAlign: TextAlign.center,
//         backgroundColor: Colors.transparent,
//         textStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
//       ),
//       monthCellStyle: DateRangePickerMonthCellStyle(
//         todayTextStyle: TextStyle(color: Colors.orange, fontWeight: FontWeight.bold),
//         todayHighlightColor: Colors.orange,
//       ),
//       yearCellStyle: DateRangePickerYearCellStyle(
//         todayTextStyle: TextStyle(color: Colors.orange),
//         textStyle: TextStyle(fontWeight: FontWeight.bold),
//       ),
//       monthViewSettings: DateRangePickerMonthViewSettings(
//         dayFormat: 'EEE',
//         viewHeaderStyle: DateRangePickerViewHeaderStyle(
//           textStyle: TextStyle(
//             fontWeight: FontWeight.bold,
//             color: Colors.grey,
//           ),
//         ),
//       ),
//     );
//   }
//
//   void _onDateSelected(DateRangePickerSelectionChangedArgs args) {
//     if (args.value is DateTime) {
//       setState(() {
//         print('Selected Date: ${args.value}');
//         // Handle date selection
//       });
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       body: SafeArea(
//         child: SingleChildScrollView(
//           padding: EdgeInsets.symmetric(vertical: 18.0),
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.start,
//             children: [
//               MoodAppbar(
//                 onLeftCLicked: (isLeftClicked) {
//                   setState(() {
//                     // Handle left click
//                   });
//                 },
//                 onRightClicked: (isRightClicked) {
//                   setState(() {
//                     // Handle right click
//                   });
//                 },
//                 onCalendarClicked: () {
//                   _showCalendarBottomSheet(context);
//                 },
//               ),
//               // Your other widgets go here
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
