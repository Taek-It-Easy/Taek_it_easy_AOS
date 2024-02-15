import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class CalendarDialog {
  static void show(BuildContext context) {
    DateTime focusedDay = DateTime.now();
    DateTime selectedDay = DateTime.now();
    List<DateTime> attendanceDates = [];

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          insetPadding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                children: [
                  Expanded(
                    child: Container(
                      decoration: const BoxDecoration(
                        color: Color(0xFF8DB9A6),
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20),
                        ),
                      ),
                      padding: const EdgeInsets.only(top: 15, bottom: 15),
                      child: const Text(
                        'January 2024',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.w800,
                          color: Colors.white,
                          letterSpacing: 2,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Container(
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: TableCalendar(
                    calendarFormat: CalendarFormat.month,
                    focusedDay: focusedDay,
                    firstDay: DateTime(2000),
                    lastDay: DateTime(2050),
                    calendarStyle: const CalendarStyle(
                      todayDecoration: BoxDecoration(
                        color: Colors.blue,
                        shape: BoxShape.circle,
                      ),
                    ),
                    headerVisible: false,
                    startingDayOfWeek: StartingDayOfWeek.monday,
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
