import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:pizza_demo/config/constants/app_colors.dart';
import 'package:pizza_demo/config/constants/app_text_styles.dart';
import 'package:pizza_demo/generated/assets.dart';
import 'package:pizza_demo/presentation/pages/main/components/custom_clipper.dart';
import 'package:pizza_demo/presentation/pages/main/components/description.dart';
import 'package:pizza_demo/presentation/pages/main/components/pizza_pageview.dart';
import 'package:pizza_demo/presentation/pages/main/components/size_btn.dart';
import 'package:pizza_demo/presentation/pages/main/manager/main_cubit.dart';
import 'package:intl/intl.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> with TickerProviderStateMixin{
  @override
  void initState() {
    context.read<MainCubit>().controller = AnimationController(vsync: this,
    duration: Duration(milliseconds: 600));
    context.read<MainCubit>().controller.forward();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<MainCubit, MainState>(
        listener: (context, state) {
          if(state is QuantityErrorState) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                backgroundColor: AppColors.highlight,
                  content: Text('Minimum Quantity 1', style: AppTextStyles.figtreeRegular,)
              )
            );
          }
          if(state is QuantityMaxErrorState) {
            ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                    backgroundColor: AppColors.highlight,
                    content: Text('Maximum Quantity 10', style: AppTextStyles.figtreeRegular,)
                )
            );
          }
        },
        child: Column(
            children: [
              Stack(
                alignment: Alignment.topCenter,
                clipBehavior: Clip.none,
                children: [
                  Container(
                    height: 650.h,
                  ),
                  ClipPath(
                    clipper: CustomShapeClipper(),
                    child: Container(
                      height: 615.h,
                      color: AppColors.highlight,
                    ),
                  ),
                  Container(
                    width: 430.w,
                    height: 128.h,
                    alignment: Alignment.bottomCenter,
                    padding: EdgeInsets.only(left: 20.w, right: 20.w),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          width: 48.w,
                          height: 48.h,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.3),
                                  blurRadius: 5.0,
                                ),
                              ]
                          ),
                          child: IconButton(
                              style: IconButton.styleFrom(
                                  backgroundColor: AppColors.white
                              ),
                              onPressed: () {

                              }, icon: Image.asset(Assets.iconsBarIconBack, width: 24.w,
                            height: 24.h,)),
                        ).animate(controller: context.read<MainCubit>().controller, autoPlay: false).slideX(duration: Duration(milliseconds: 1000), begin: -1, end: 0, curve: Curves.bounceOut),
                        BlocBuilder<MainCubit, MainState>(
                            builder: (context, state) {
                            return Container(
                              margin: EdgeInsets.only(bottom: 10.h),
                              child: RichText(
                                  textAlign: TextAlign.center,
                                  text: TextSpan(
                                text: 'Pizzas',
                                style: AppTextStyles.figtreeRegular,
                                children: [
                                  TextSpan(
                                      text: '\n${state.chosenPizza.name}',
                                      style: AppTextStyles.figtreeExtraBold.copyWith(fontSize: 25),

                                  )
                                ]
                              )),
                            );
                          }
                        ).animate(controller: context.read<MainCubit>().controller, autoPlay: false).slideY(duration: Duration(milliseconds: 1000), begin: -1, end: 0, curve: Curves.bounceOut),
                        Container(
                          width: 48.w,
                          height: 48.h,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.3),
                                  blurRadius: 5.0,
                                ),
                              ]
                          ),
                          child: BlocBuilder<MainCubit, MainState>(
                              builder: (context, state) {
                              return IconButton(
                                style: IconButton.styleFrom(
                                 backgroundColor: AppColors.white
                                ),
                                  onPressed: () {
                                  context.read<MainCubit>().like();
                              }, icon: Image.asset(Assets.iconsIconFav, color: context.read<MainCubit>().pizzas[state.currentIndex].isLiked == true? Colors.green: null, width: 24.w,
                                height: 24.h,));
                            }
                          ),
                        ).animate(controller: context.read<MainCubit>().controller, autoPlay: false).slideX(duration: Duration(milliseconds: 1000), begin: 1, end: 0, curve: Curves.bounceOut),
                      ],
                    ),
                  ),

                  PizzaView(),

                  Positioned(
                    bottom: 10,
                    child: Container(
                      height: 99.h,
                        child: Stack(
                          alignment: Alignment.bottomCenter,
                          children: [
                            Positioned(
                              top: 0,
                                child: Image.asset(Assets.imagesBanana, width: 97.w, height: 63.h,)),
                            Container(
                              width: 244.w,
                              height: 64.h,
                              child: BlocBuilder<MainCubit, MainState>(
                                  builder: (context, state) {
                                  return Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      sizeBtn(state, PizzaSize.S, context),
                                      Container(
                                        decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            border: state.pizzaSize == PizzaSize.M? Border.all(
                                              color: AppColors.white,
                                              width: 2
                                            ): null,
                                            boxShadow: [
                                              BoxShadow(
                                                color: Colors.black.withOpacity(0.3),
                                                blurRadius: 5.0,
                                              ),
                                            ],
                                        ),
                                        width: state.pizzaSize == PizzaSize.M? 50.w: 48.w,
                                        height: state.pizzaSize == PizzaSize.M? 50.h: 48.h,
                                        margin: EdgeInsets.only(top: 15.h),
                                        child: IconButton(
                                            style: IconButton.styleFrom(
                                                backgroundColor: state.pizzaSize == PizzaSize.M? AppColors.black: AppColors.white
                                            ),
                                            onPressed: () {
                                              context.read<MainCubit>().changePizzaSize(PizzaSize.M);
                                              context.read<MainCubit>().toggleSize();
                                            }, icon: Center(child: Text(context.read<MainCubit>().pizzaSizeToString(PizzaSize.M), style: AppTextStyles.figtreeSemiBold.copyWith(fontSize: 18, color: state.pizzaSize == PizzaSize.M? AppColors.white: null),),),),
                                      ),
                                      sizeBtn(state, PizzaSize.L, context)
                                    ],
                                  );
                                }
                              ),
                            )
                          ],
                        )).animate(controller: context.read<MainCubit>().controller, autoPlay: false).slideY(duration: Duration(milliseconds: 600), begin: 5, end: 0, curve: Curves.bounceOut),
                  ),
                ],
              ),
              Gap(20),
              description().animate(controller: context.read<MainCubit>().controller, autoPlay: false),
              Gap(40),
              Padding(
                padding: EdgeInsets.only(left: 30.w, right: 30.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: 143.w,
                      height: 48.h,
                      decoration: BoxDecoration(
                        color: AppColors.highlight,
                        borderRadius: BorderRadius.circular(30)
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            width: 48.w,
                            height: 48.h,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withOpacity(0.3),
                                    blurRadius: 5.0,
                                  ),
                                ]
                            ),
                            child: IconButton(
                                style: IconButton.styleFrom(
                                    backgroundColor: AppColors.white
                                ),
                                onPressed: () {
                                  context.read<MainCubit>().reduceQuantity();
                                }, icon: Image.asset(Assets.iconsVector1, width: 24.w,
                              height: 24.h,)),
                          ),
                          Center(
                            child: BlocBuilder<MainCubit, MainState>(
                              builder: (context, state) {
                                return Text(state.quantity.toString(), style: AppTextStyles.figtreeExtraBold.copyWith(fontSize: 24),);
                              }
                            ),
                          ),
                          Container(
                            width: 48.w,
                            height: 48.h,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withOpacity(0.3),
                                    blurRadius: 5.0,
                                  ),
                                ]
                            ),
                            child: IconButton(
                                style: IconButton.styleFrom(
                                    backgroundColor: AppColors.white
                                ),
                                onPressed: () {
                                  context.read<MainCubit>().addQuantity();
                                }, icon: Image.asset(Assets.iconsVector1, width: 24.w,
                              height: 24.h,)),
                          ),
                        ],
                      ),
                    ),
                    Center(
                      child: BlocBuilder<MainCubit, MainState>(
                          builder: (context, state) {
                            return Text('S' == context.read<MainCubit>().pizzaSizeToString(state.pizzaSize)?  context.read<MainCubit>().formatCurrencySom(state.chosenPizza.priceS * state.quantity): 'M' == context.read<MainCubit>().pizzaSizeToString(state.pizzaSize)? context.read<MainCubit>().formatCurrencySom(state.chosenPizza.priceM * state.quantity): context.read<MainCubit>().formatCurrencySom(state.chosenPizza.priceL * state.quantity), style: AppTextStyles.figtreeExtraBold.copyWith(fontSize: 24),);
                          }
                      ),
                    ),
                    SizedBox(
                      height: 48.h,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.accent
                        ),
                        onPressed: () {},
                        child: Text('Add', style: AppTextStyles.figtreeExtraBold.copyWith(fontSize: 24, color: AppColors.white),),
                      ),
                    )
                  ],
                ),
              )
            ],
          )
      ),
    );
  }



}