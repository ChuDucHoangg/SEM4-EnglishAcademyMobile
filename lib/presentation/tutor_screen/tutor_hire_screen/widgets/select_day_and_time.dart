import 'package:flutter/material.dart';
import 'package:quickalert/models/quickalert_type.dart';
import 'package:quickalert/widgets/quickalert_dialog.dart';

import '../../../../data/model/TurtorModel.dart';
import '../../../../service/TutorService.dart';
import 'date_button.dart';
import 'time_button.dart';

class SelectDayAndTime extends StatefulWidget {
  final TutorModel tutor;
  final Function(Map<String, List<String>>, List<int>) onScheduleSelected;

  const SelectDayAndTime(
      {Key? key, required this.tutor, required this.onScheduleSelected})
      : super(key: key);

  @override
  _SelectDayAndTimeState createState() => _SelectDayAndTimeState();
}

class _SelectDayAndTimeState extends State<SelectDayAndTime>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  List<AvailabilityTutorModel> _availability = [];
  Map<String, List<String>> _selectedSchedules = {};
  List<int> _selectedScheduleIds = [];

  List<AvailabilityTutorModel> getScheduleForSelectedDay(String dayOfWeek) {
    return _availability
        .where((schedule) => schedule.dayOfWeek == dayOfWeek)
        .toList();
  }

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 7, vsync: this);
    _tabController.addListener(() {
      setState(() {});
    });
    _fetchAvailability();
  }

  Future<void> _fetchAvailability() async {
    try {
      final availability =
      await TutorService.fetchAvailabilityDetail(widget.tutor.code);
      setState(() {
        _availability = availability;
      });
    } catch (e) {
      print('Error fetching availability: $e');
    }
  }

  int getTotalSelectedTimes() {
    return _selectedSchedules.values.fold(0, (sum, list) => sum + list.length);
  }

  void _handleTimeSelected(String selectedTime, int scheduleId) {
    setState(() {
      String selectedDay = [
        'Monday',
        'Tuesday',
        'Wednesday',
        'Thursday',
        'Friday',
        'Saturday',
        'Sunday'
      ][_tabController.index];

      if (!_selectedSchedules.containsKey(selectedDay)) {
        _selectedSchedules[selectedDay] = [];
      }

      if (_selectedSchedules[selectedDay]!.contains(selectedTime)) {
        _selectedSchedules[selectedDay]!.remove(selectedTime);
        _selectedScheduleIds.remove(scheduleId);
      } else {
        if (getTotalSelectedTimes() < 2) {
          _selectedSchedules[selectedDay]!.add(selectedTime);
          _selectedScheduleIds.add(scheduleId);
        } else {
          QuickAlert.show(
            context: context,
            type: QuickAlertType.warning,
            text: 'You can only choose a maximum of two lessons per week!',
            confirmBtnColor: Color(0XFF1E2857),
            borderRadius: 25.0,
            width: 320,
          );
        }
      }
      widget.onScheduleSelected(_selectedSchedules, _selectedScheduleIds);
    });
  }

  @override
  Widget build(BuildContext context) {
    String selectedDay = [
      'Monday',
      'Tuesday',
      'Wednesday',
      'Thursday',
      'Friday',
      'Saturday',
      'Sunday'
    ][_tabController.index];

    List<AvailabilityTutorModel> selectedDaySchedule =
    getScheduleForSelectedDay(selectedDay);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 26),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 10),
              Text(
                "Select Day",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
            ],
          ),
        ),
        TabBar(
          controller: _tabController,
          isScrollable: true,
          indicator: BoxDecoration(
            color: Colors.transparent,
          ),
          tabs: [
            DateButton(day: 'Monday', tabController: _tabController, index: 0),
            DateButton(day: 'Tuesday', tabController: _tabController, index: 1),
            DateButton(
                day: 'Wednesday', tabController: _tabController, index: 2),
            DateButton(
                day: 'Thursday', tabController: _tabController, index: 3),
            DateButton(day: 'Friday', tabController: _tabController, index: 4),
            DateButton(
                day: 'Saturday', tabController: _tabController, index: 5),
            DateButton(day: 'Sunday', tabController: _tabController, index: 6),
          ],
          labelPadding: EdgeInsets.symmetric(horizontal: 5),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 26),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 20),
              Text(
                'Select Time',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              selectedDaySchedule.isNotEmpty
                  ? Wrap(
                spacing: 12,
                runSpacing: 10,
                children: selectedDaySchedule.map((schedule) {
                  String startTime = schedule.startTime.substring(0, 5);
                  String endTime = schedule.endTime.substring(0, 5);
                  String time = '$startTime - $endTime';
                  return TimeButton(
                    time: time,
                    isSelected:
                    _selectedSchedules[selectedDay]?.contains(time) ??
                        false,
                    onSelected: (selectedTime) =>
                        _handleTimeSelected(selectedTime, schedule.id),
                  );
                }).toList(),
              )
                  : Center(
                child: Text(
                  "There is currently no data available.",
                  style: TextStyle(color: Colors.grey, fontSize: 18),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

