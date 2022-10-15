import 'package:api_call_example/module/login/login_binding.dart';
import 'package:api_call_example/module/login/login_view.dart';
import 'package:api_call_example/module/dashboard/dashboard_view.dart';
import 'package:api_call_example/module/dashboard/dashboard_binding.dart';
import 'package:get/get.dart';

part 'app_routes.dart';

class AppPages {
  static const INITIAL = Routes.LOGIN;
  static const DASHBOARD = Routes.DASHBOARD;

  static final routes = [
    GetPage(
      name: Routes.LOGIN,
      page: () => LoginPage(),
      //binding: SplashBinding(),
      bindings: [
        LoginBinding(),
      ]
    ),
    GetPage(
        name: Routes.DASHBOARD,
        page: () => DashboardPage(),
        //binding: SplashBinding(),
        bindings: [
          DashboardBinding(),
        ]
    ),
  ];
}



// GetPage(
//     name: Routes.HOME,
//     page: () => HomeScreen(),
//     binding: HomeBinding(),
//     children: [
//       GetPage(name: Routes.CARDS, page: () => CardsScreen()),
//     ]),


// static const FAVOURITES = '/favourites';
// static const ORDERS = '/orders';
// static const REPORT = '/report';
// static const INVITE_FRIEND = '/invite_friend';
// static const TALK_TO_MANAGEMENT = '/talk_to_management';