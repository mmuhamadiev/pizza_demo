import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:pizza_demo/presentation/pages/main/manager/main_cubit.dart';

class FullImageView extends StatefulWidget {
  const FullImageView({super.key, required this.index});

  final int index;

  @override
  State<FullImageView> createState() => _FullImageViewState();
}

class _FullImageViewState extends State<FullImageView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: () {
          context.pop();
        },
        child: BlocBuilder<MainCubit, MainState>(
          builder: (context, state) {
            return Container(
              width: 440.w,
              height: 932.h,
              child: Hero(
                tag: widget.index,
                child: Image.asset(state.chosenPizza.largeImage, width: 430.w,
                  height: 940.h,),
              ),
            );
          }
        ),
      ),
    );
  }
}
