import 'package:go_router/go_router.dart';
import 'package:pizza_demo/presentation/pages/main/components/full_image_view.dart';
import 'package:pizza_demo/presentation/pages/main/view/main_screen.dart';
import 'package:pizza_demo/presentation/pages/splash/view/splash_screen.dart';

final router = GoRouter(routes: [
  GoRoute(
    name: '/',
    path: '/',
    builder: (context, state) => const SplashScreen(),
  ),
  GoRoute(
    name: '/main',
    path: '/main',
    builder: (context, state) => const MainScreen(),
  ),
  GoRoute(
    name: '/full',
    path: '/full/:index',
    builder: (context, state) => FullImageView(index: int.parse(state.pathParameters['index']?? '0'),),
  ),
  // GoRoute(
  //     name: '/user_test_result',
  //     path: '/user_test_result/:userID/:resultID',
  //     builder: (context, state) => UserAnalizTestView(userID: state.pathParameters['userID']?? '', resultID: state.pathParameters['resultID']?? '')
  // ),

]
);
