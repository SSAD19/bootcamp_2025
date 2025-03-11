

import 'package:bootcampo_extrados_class/commons/Pages/initial_page.dart';
import 'package:bootcampo_extrados_class/features/Character/presentation/Pages/home.dart';
import 'package:bootcampo_extrados_class/features/SignIn/presentation/page/log_page.dart';
import 'package:go_router/go_router.dart';

final appRoutes = GoRouter(
  initialLocation: '/',

  
  routes: [

  GoRoute(
    name: 'initial',
    path: '/',
    builder: (context, state) =>InitialPage(),
    ),

    GoRoute(
    name: 'home character',
    path: '/home',
    builder: (context, state) => MyHomePage(),
    ),

    GoRoute(
    name: 'LogIn',
    path: '/LogIn',
    builder: (context, state) => LogPage(),),
  ],
);