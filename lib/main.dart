import 'package:fastcam_flutter_beamin/home/cart_screen.dart';
import 'package:fastcam_flutter_beamin/home/home_screen.dart';
import 'package:fastcam_flutter_beamin/home/product_add_screen.dart';
import 'package:fastcam_flutter_beamin/home/product_detail_screen.dart';
import 'package:fastcam_flutter_beamin/login/login_screen.dart';
import 'package:fastcam_flutter_beamin/login/sing_up_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});
  // GoRouter 사용시 최상위 router에서는 /로 시작해야되며, subRoute에서는 시작과 끝에 /가 있으면 안됨!
  final router = GoRouter(
    initialLocation: '/login',
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const HomeScreen(),
        routes: [
          GoRoute(
            path: 'cart/:uid',
            builder: (context, state) => CartScreen(
              uid: state.pathParameters['uid'] ?? '',
            ),
          ),
          GoRoute(
            path: 'product',
            builder: (context, state) => const ProductDetailScreen(),
          ),
          GoRoute(
            path: 'product/add',
            builder: (context, state) => const ProductAddScreen(),
          ),
        ],
      ),
      GoRoute(
        path: '/login',
        builder: (context, state) => const LoginScreen(),
      ),
      GoRoute(
        path: '/sign_up',
        builder: (context, state) => const SingnUpScreen(),
      ),
    ],
  );

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: '패캠마트',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      routerConfig: router,
    );
  }
}
