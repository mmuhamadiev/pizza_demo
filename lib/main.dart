import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pizza_demo/presentation/manager/locator.dart';
import 'package:pizza_demo/presentation/pages/main/manager/main_cubit.dart';
import 'package:pizza_demo/presentation/routes/routes.dart';

void main() async{
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  await setupConfiguration();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  late MainCubit _mainCubit;

  @override
  void initState() {
    _mainCubit = getIt<MainCubit>();
    super.initState();
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(430, 932),
      splitScreenMode: true,
      minTextAdapt: true,
      child: MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => _mainCubit),
        ],
        child: MaterialApp.router(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(

            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
          ),
            routerConfig: router
        ),
      ),
    );
  }
}
