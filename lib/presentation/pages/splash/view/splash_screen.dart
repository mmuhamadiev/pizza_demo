import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:pizza_demo/config/constants/app_colors.dart';
import 'package:pizza_demo/generated/assets.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  bool isWhiteBG = true;

  int counter = 0;

  List<String> splashImagesList = [
    Assets.imagesPizza1,
  ];

  @override
  void initState() {
    Timer.periodic(const Duration(milliseconds: 100), (timer) {
      if(counter > 7) {
        timer.cancel();
          setState(() {
            isWhiteBG = false;
          });
        Future.delayed(Duration(milliseconds: 200), () {
          context.pushNamed('/main');
        });
      } else {
        splashImagesList.add('assets/images/pizza${counter + 1}.png');
        counter++;
        setState(() {

        });
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: isWhiteBG == true? AppColors.white: AppColors.highlight,
      body: Stack(
        alignment: Alignment.center,
        children: splashImagesList.map((e) => Center(child: isWhiteBG == true? Image.asset(e, width: 270.w, height: 270.h,): const SizedBox.shrink())).toList(),
      ),
    );
  }
}
