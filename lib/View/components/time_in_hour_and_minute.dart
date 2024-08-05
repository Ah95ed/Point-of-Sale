import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import '../../size_config.dart';

class TimeInHourAndMinute extends StatefulWidget {
  const TimeInHourAndMinute({super.key});

  @override
  State<TimeInHourAndMinute> createState() => _TimeInHourAndMinuteState();
}

class _TimeInHourAndMinuteState extends State<TimeInHourAndMinute> {
  TimeOfDay _timeOfDay = TimeOfDay.now();
  @override
  void initState() {
    super.initState();
    Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_timeOfDay.minute != TimeOfDay.now().minute) {
        if (mounted) {
          setState(() {
            _timeOfDay = TimeOfDay.now();
          });
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    String period = _timeOfDay.period == DayPeriod.am ? "AM" : "PM";
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          // if you use _timeOfDay.hour then it will show 20:10 like that
          // But we want 8:10
          "${_timeOfDay.hourOfPeriod}:${_timeOfDay.minute}",
          style: Theme.of(context).textTheme.displayLarge,
        ),
        // SizedBox(height: 0.1.h),
        RotatedBox(
          quarterTurns: 3,
          child: Text(
            period,
            style: TextStyle(fontSize: getProportionateScreenWidth(12)),
          ),
        ),
      ],
    );
  }
}
