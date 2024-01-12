import 'package:logger/logger.dart';
import 'package:get_it/get_it.dart';
import 'package:pizza_demo/presentation/pages/main/manager/main_cubit.dart';
import 'package:shared_preferences/shared_preferences.dart';

final getIt = GetIt.instance;
final logger = Logger(
  printer: PrettyPrinter(),
);

setupConfiguration() async {

  final sharedPreferences = await SharedPreferences.getInstance();
  getIt.registerLazySingleton<SharedPreferences>(() => sharedPreferences);

  getIt.registerFactory<MainCubit>(() => MainCubit());
}