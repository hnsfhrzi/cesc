import 'package:cesc/screen/HalAgendaUser.dart';
import 'package:cesc/screen/Notification.dart';
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

//BELUM ADA HALAMAN NOTIFIKASI

class TableBasic extends StatefulWidget {
  const TableBasic({Key? key}) : super(key: key);

  @override
  _TableBasicState createState() => _TableBasicState();
}

class _TableBasicState extends State<TableBasic> {
  CalendarFormat _calendarFormat = CalendarFormat.month;
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        flexibleSpace: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [Color(0xFF0072B8), Color(0xFF7ABCDE)])),
        ),
        title: Center(
          child: Text(
            '      CESC',
            style: TextStyle(
              fontSize: 27,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        actions: <Widget>[
          Padding(
            padding: EdgeInsets.only(right: 15),
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => Notif()));
              },
              child: Icon(
                Icons.notifications,
                size: 30,
              ),
            ),
          )
        ],
      ),
      body: TableCalendar(
        firstDay: DateTime.utc(2021, 8, 1),
        lastDay: DateTime.utc(2030, 1, 1),
        focusedDay: DateTime.now(),
        selectedDayPredicate: (day) {
          return isSameDay(_selectedDay, day);
        },
        onDaySelected: (selectedDay, focusedDay) {
          setState(
            () {
              _selectedDay = selectedDay;
              _focusedDay = focusedDay;
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => HalAgendaUser()));
            },
          );
        },
        calendarFormat: _calendarFormat,
        onFormatChanged: (format) {
          setState(() {
            _calendarFormat = format;
          });
        },
        onPageChanged: (focusedDay) {
          _focusedDay = focusedDay;
        },
      ),
    );
  }
}
