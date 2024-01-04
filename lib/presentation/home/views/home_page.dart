import 'dart:async';

import 'package:animated_flip_counter/animated_flip_counter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:packit/app/config/app_color.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

late Timer timer;
int val = 0;

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      body: SafeArea(
        child: SizedBox.expand(
          child: Column(
            children: [
              CircularPercentIndicator(
                radius: 60.0,
                lineWidth: 10.0,
                percent: val / 100,
                startAngle: 0.0,
                circularStrokeCap: CircularStrokeCap.round,
                backgroundColor: Colors.transparent,
                linearGradient: const LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  tileMode: TileMode.clamp,
                  stops: [0.0, 1.0],
                  colors: <Color>[Color(0xFF0EA8FF), Color(0xFF28FFCB)],
                ),
                center: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    AnimatedFlipCounter(
                      value: val,
                      textStyle: TextStyle(fontSize: 15.68.sp, fontWeight: FontWeight.w600, color: AppColor.coolGray300),
                    ),
                    SizedBox(width: 1.96.w),
                    Text(
                      "%",
                      style: TextStyle(fontSize: 15.68.sp, fontWeight: FontWeight.w600, color: AppColor.coolGray100),
                    )
                  ],
                ),
              ),
              ElevatedButton(
                  onPressed: () {
                    val = 0;

                    timer = Timer.periodic(const Duration(milliseconds: 30), (timer) {
                      if (val == 100) {
                        timer.cancel();
                      } else {
                        setState(() {
                          val++;
                        });
                      }
                    });
                  },
                  child: const Text("HI")),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Stack(
        alignment: Alignment.bottomCenter,
        clipBehavior: Clip.none,
        children: [
          Positioned.fill(
            top: -30,
            right: 26,
            child: Align(
              alignment: Alignment.topRight,
              child: Container(
                width: 80,
                height: 80,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: Color(0x14000000),
                      blurRadius: 17,
                      offset: Offset(0, 1.85),
                      spreadRadius: 0,
                    ),
                  ],
                ),
              ),
            ),
          ),
          Container(
            height: MediaQuery.of(context).padding.bottom + 50.w,
            decoration: const BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Color(0x14000000),
                  blurRadius: 17,
                  offset: Offset(0, 1.85),
                  spreadRadius: 0,
                ),
              ],
            ),
          ),
          Positioned.fill(
            top: -30,
            right: 26,
            child: Align(
              alignment: Alignment.topRight,
              child: Container(
                width: 80,
                height: 80,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                ),
                child: Center(
                  child: Container(
                    width: 66,
                    height: 66,
                    decoration: const BoxDecoration(
                      color: Colors.blue,
                      shape: BoxShape.circle,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
