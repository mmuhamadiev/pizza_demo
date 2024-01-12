import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:pizza_demo/generated/assets.dart';
import 'package:pizza_demo/presentation/pages/main/manager/main_cubit.dart';


class PizzaView extends StatefulWidget {
  const PizzaView({super.key});

  @override
  State<PizzaView> createState() => _PizzaViewState();
}

class _PizzaViewState extends State<PizzaView> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MainCubit, MainState>(
      builder: (context, state) {
        return Container(
          height: 400.h,
          margin: EdgeInsets.only(top: 140.h),
          clipBehavior: Clip.none,
          child: PageView.builder(
            clipBehavior: Clip.none,
            physics: ClampingScrollPhysics(),
            controller: context.read<MainCubit>().mainPageController,
            itemCount: context.read<MainCubit>().pizzas.length,
            onPageChanged: (index) {
                context.read<MainCubit>().changeIndex(index);
            },
            itemBuilder: (context, index) {
              double scaleFactor = (index == state.currentIndex) ? 1.0 : 0.5;

              return TweenAnimationBuilder(
                tween: Tween(begin: scaleFactor, end: scaleFactor),
                duration: Duration(milliseconds: 350),
                child: AnimatedScale(
                  scale: index == state.currentIndex? state.scale : 1,
                  duration: Duration(milliseconds: 600),
                  curve: Curves.bounceOut,
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Hero(
                        tag: index,
                        child: Image.asset(
                          context.read<MainCubit>().pizzas[index].image,
                          // height: 274.h,
                          // width: 274.w,
                        ),
                      ),
                      IconButton(onPressed: () {
                        showDialog(
                          barrierColor: Colors.transparent,
                            useSafeArea: false,
                            barrierDismissible: false,
                            context: context,
                            builder: (context) {
                              return SizedBox(
                                width: 430.w,
                                height: 932.h,
                                child: Center(
                                  child: GestureDetector(
                                    onTap: () {
                                      context.pop();
                                    },
                                    child: Transform.scale(
                                      scale: 1.4,
                                      child: Hero(
                                        tag: index,
                                        child: Image.asset(
                                          state.chosenPizza.largeImage,
                                          width: 430.w,
                                          height: 932.h, fit: BoxFit.fitHeight,
                                        ).animate().scale(duration: Duration(milliseconds: 200), begin: Offset(0, 0), end: Offset(1, 1)),
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            }
                        );
                      }, icon: Image.asset(Assets.iconsZoom, width: 46.w, height: 46.h,)),
                    ],
                  ),
                ),
                builder: (context, value, child) {
                  return Transform.scale(
                    scale: value,
                    child: child,
                  );
                },
              );
            },
          ),
        );
      }
    );

  }
}