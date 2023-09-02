import 'package:get/get.dart';
import 'package:getx_mvvm/res/routes/routes_name.dart';
import 'package:getx_mvvm/view/login/login_view.dart';
import 'package:getx_mvvm/view/splash/splash_screen.dart';
import 'package:getx_mvvm/view/home/home.dart';

class AppRoutes {
  static getRoutes() => [
        GetPage(
            name: RoutesName.spalshScreen,
            page: () => SplashScreen(),
            transition: Transition.leftToRight,
            transitionDuration: Duration(microseconds: 250)),
        GetPage(
            name: RoutesName.loginView,
            page: () => LoginView(),
            transition: Transition.leftToRight,
            transitionDuration: Duration(microseconds: 250)),
        GetPage(
            name: RoutesName.homeView,
            page: () => HomeView(),
            transition: Transition.leftToRight,
            transitionDuration: Duration(microseconds: 250)),
      ];
}
