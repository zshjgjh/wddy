import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../splash_view/presentation/views/splash_view.dart';


abstract class AppRouters {
  static const kSplashView = '/';
  static const kBoardingView = '/onBoarding';
  static const kLoginView = '/loginview';
  static const kCreateAccount = '/createaccountview';
  static const kForgetPassword = '/forgetpassword';
  static const kCheckCode = '/checkcodeview';
  static const kNewPassword = '/newpassword';
  static const kHomeView = '/homeview';
  static const kBestSeller = '/bestseller';
  static const kProducts = '/products';
  static const kSearch = '/search';
  static const kNotification = '/notification';
  static const kProductDetails = '/productdatails';
  static const kCartView = '/cartview';



  static final router = GoRouter(
    routes: [
      GoRoute(
        path: kSplashView,
        builder: (context, state) => const SplashView(),
      ),




    ],);

}