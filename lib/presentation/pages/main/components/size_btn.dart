import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pizza_demo/config/constants/app_colors.dart';
import 'package:pizza_demo/config/constants/app_text_styles.dart';
import 'package:pizza_demo/presentation/pages/main/manager/main_cubit.dart';

Container sizeBtn(MainState state, PizzaSize pizzaSize, BuildContext context) {
  return Container(
    decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: state.pizzaSize == pizzaSize? Border.all(
            color: AppColors.white,
            width: 2
        ): null,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.3),
            blurRadius: 5.0,
          ),
        ]
    ),
    width: state.pizzaSize == pizzaSize? 50.w: 48.w,
    height: state.pizzaSize == pizzaSize? 50.h: 48.h,
    margin: EdgeInsets.only(bottom: 10.h),
    child: IconButton(
      style: IconButton.styleFrom(
          backgroundColor: state.pizzaSize == pizzaSize? AppColors.black: AppColors.white
      ),
      onPressed: () {
        context.read<MainCubit>().changePizzaSize(pizzaSize);
        context.read<MainCubit>().toggleSize();
      }, icon: Center(child: Text(context.read<MainCubit>().pizzaSizeToString(pizzaSize), style: AppTextStyles.figtreeSemiBold.copyWith(fontSize: 18, color: state.pizzaSize == pizzaSize? AppColors.white: null),),),),
  );
}