import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pizza_demo/config/constants/app_text_styles.dart';
import 'package:pizza_demo/presentation/pages/main/manager/main_cubit.dart';

BlocBuilder description() {
  return BlocBuilder<MainCubit, MainState>(
      builder: (context, state) {
         return Padding(padding: EdgeInsets.only(left: 30.w, right: 30.w),
          child: Text(state.chosenPizza.description, style: AppTextStyles.figtreeRegular.copyWith(fontSize: 16),),
    );
  });
}