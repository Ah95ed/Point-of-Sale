import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../constants.dart';
import '../../size_config.dart';
import 'clock_painter.dart';

class Clock extends StatefulWidget {
  const Clock({super.key});

  @override
  State<Clock> createState() => _ClockState();
}

class _ClockState extends State<Clock> {
  DateTime _dateTime = DateTime.now();

  @override
  void initState() {
    super.initState();
    Timer.periodic(
      const Duration(seconds: 1),
      (timer) {
        _dateTime = DateTime.now();
        if (mounted) {
          setState(
            () {},
          );
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(
              horizontal: getProportionateScreenWidth(110)),
          child: AspectRatio(
            aspectRatio: 1,
            child: Container(
              decoration: BoxDecoration(
                // color: Theme.of(context).colorScheme.tertiary,
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    offset: const Offset(0, 0),
                    color: kShadowColor.withOpacity(0),
                    blurRadius: 64,
                  ),
                ],
              ),
              child: Transform.rotate(
                angle: -pi / 2,
                child: CustomPaint(
                  painter: ClockPainter(context, _dateTime),
                ),
              ),
            ),
          ),
        ),
        // Positioned(
        // top: 50,
        // left: 0,
        // right: 0,
        // child: Consumer<MyThemeModel>(
        //   builder: (context, theme, child) => GestureDetector(
        //     onTap: () => theme.changeTheme(),
        //     child: SvgPicture.asset(
        //       theme.isLightTheme
        //           ? "assets/icons/Sun.svg"
        //           : "assets/icons/Moon.svg",
        //       height: 24,
        //       width: 24,
        //       color: Theme.of(context).primaryColor,
        //     ),
        //   ),
        // ),
        // ),
      ],
    );
  }
}
