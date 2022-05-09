import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // DateTime? _focusedDay;
  DateTime? _selectedDay;
  String? _timeUnit;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFCFCFC),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(23, 20, 23, 0),
                child: _calendarWidget(),
              ),
              const Padding(
                padding: EdgeInsets.fromLTRB(23, 36, 23, 17),
                child: Text(
                  'My Schedule',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF262626),
                  ),
                ),
              ),
              ListView.separated(
                shrinkWrap: true,
                // clipBehavior: Clip.none,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (_, index) => _scheduleItem(),
                separatorBuilder: (_, index) => const SizedBox(height: 16),
                itemCount: 10,
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  Widget _scheduleItem() => GestureDetector(
    onTap: () {
      // GetIt.I.get<NavigationService>().back();
    },
    child: Container(
      margin: const EdgeInsets.symmetric(horizontal: 23),
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              color: const Color(0xFFF4F4F4),
              // color: Colors.red,
              borderRadius: BorderRadius.circular(8),
              boxShadow: [
                BoxShadow(
                  offset: const Offset(0, 2),
                  blurRadius: 8,
                  color: Colors.black.withOpacity(.25),
                )
              ],
            ),
            child: Padding(
              padding: const EdgeInsets.only(left: 14, top: 15, bottom: 15),
              child: Row(
                children: [
                  const CircleAvatar(
                    radius: 30,
                    backgroundColor: Color(0xFFC4C4C4),
                  ),
                  const SizedBox(width: 15),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        'John Doe',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: Color(0xFF262626),
                        ),
                      ),
                      Text(
                        '@thecindydoe',
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          color: Color(0xFF262626),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(width: 31),
                  const Text(
                    'Jun. 15th @ 8:30AM',
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF262626),
                    ),
                  ),
                ],
              ),
            ),
          ),
          const Positioned(
            right: 0,
            top: 0,
            child: Icon(Icons.map)
            // SvgPicture.asset(
            //   Assets.PG11_01,
            //   height: 21.37.r,
            //   width: 21.37.r,
            //   fit: BoxFit.fill,
            // ),
          ),
        ],
      ),
    ),
  );

  Widget _calendarWidget() => Container(
    padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 17),
    margin: const EdgeInsets.only(bottom: 36),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(13),
      boxShadow: [
        BoxShadow(
          blurRadius: 60,
          offset: const Offset(0, 10),
          color: Colors.black.withOpacity(0.1),
        ),
      ],
    ),
    child: Column(
      children: [
        TableCalendar(
          focusedDay: DateTime.now(),
          firstDay: DateTime(2020),
          lastDay: DateTime(2040),
          selectedDayPredicate: (day) {
            return isSameDay(_selectedDay, day);
          },
          onDaySelected: (selectedDay, focusedDay) {
            setState(() {
              _selectedDay = selectedDay;
              // _focusedDay = focusedDay; // update `_focusedDay` here as well
            });
          },
          onPageChanged: (focusedDay) {
            // _focusedDay = focusedDay;
          },
          currentDay: DateTime.now().add(const Duration(days: 0)),
          availableCalendarFormats: const {CalendarFormat.month: 'Month'},
          daysOfWeekStyle: DaysOfWeekStyle(
            weekdayStyle: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 13,
              color: const Color(0xFF3C3C43).withOpacity(.3),
            ),
            weekendStyle: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 13,
              color: const Color(0xFF3C3C43).withOpacity(.3),
            ),
          ),
          headerStyle: const HeaderStyle(
            titleTextStyle: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w600,
              color: Color(0xFF262626),
            ),
          ),
          calendarStyle: CalendarStyle(
            selectedTextStyle: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w600,
              color: Colors.white,
            ),
            defaultTextStyle: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w400,
              color: Color(0xFF262626),
            ),
            weekendTextStyle: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w400,
              color: Colors.redAccent,
            ),
            selectedDecoration: BoxDecoration(
              shape: BoxShape.circle,
              color: const Color(0xFF525252),
              boxShadow: [
                BoxShadow(
                  offset: const Offset(0, 4),
                  color: Colors.black.withOpacity(.25),
                  blurRadius: 16,
                )
              ],
            ),
          ),
        ),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 14),
          child: Divider(
            height: 32,
            thickness: 1,
            color: Color(0xFFD0D0D0),
          ),
        ),
        Row(
          children: [
            const Text(
              'Time',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w600,
                color: Colors.black,
              ),
            ),
            const Expanded(child: SizedBox()),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 8),
              decoration: BoxDecoration(
                color: const Color(0xFF767680).withOpacity(.12),
                borderRadius: BorderRadius.circular(6),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  SizedBox(
                    width: 28,
                    height: 28,
                    child: Text(
                      '09',
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.w400,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                    height: 28,
                    child: Text(
                      ':',
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.w400,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 28,
                    height: 28,
                    child: Text(
                      '41',
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.w400,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 6),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 3, vertical: 4),
              decoration: BoxDecoration(
                color: const Color(0xFF767680).withOpacity(.12),
                borderRadius: BorderRadius.circular(8.91),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [_timeUnitWidget('AM'), _timeUnitWidget('PM')],
              ),
            ),
          ],
        ),
      ],
    ),
  );

  Widget _timeUnitWidget(String value) => GestureDetector(
    onTap: () {
      setState(() {
        _timeUnit = value;
      });
    },
    child: Container(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6.93),
          color: value == _timeUnit ? Colors.white : Colors.transparent,
          boxShadow: value == _timeUnit
              ? [
            BoxShadow(
              offset: const Offset(0, 3),
              blurRadius: 1,
              color: Colors.black.withOpacity(.04),
            ),
            BoxShadow(
              offset: const Offset(0, 3),
              blurRadius: 8,
              color: Colors.black.withOpacity(.12),
            ),
          ]
              : []),
      child: Text(
        value,
        style: TextStyle(
          fontSize: 15,
          fontWeight:
          value == _timeUnit ? FontWeight.w600 : FontWeight.w400,
          color: Colors.black,
        ),
      ),
    ),
  );
}