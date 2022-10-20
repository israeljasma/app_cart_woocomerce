import 'package:app_cart_woocomerce/screens/screens.dart';
import 'package:flutter/material.dart';

class AppRoutes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;
    switch (settings.name) {
      case '/splash':
        return MaterialPageRoute(
          builder: (_) => const SplashScreen(),
        );
      case '/home':
        return MaterialPageRoute(
          builder: (_) => const HomeScreen(),
        );
      case '/login':
        return MaterialPageRoute(
          builder: (_) => const LoginScreen(),
        );
      case '/forgot_password':
        return MaterialPageRoute(
          builder: (_) => const ForgotPasswordScreen(),
        );
      case '/login_success':
        return MaterialPageRoute(
          builder: (_) => const LoginSuccessScreen(),
        );
      case '/cart':
        return MaterialPageRoute(
          builder: (_) => const CartScreen(),
        );
      case '/category_details':
        if (args is String) {
          return MaterialPageRoute(
            builder: (_) => CategoryProductsScreen(categoryID: args),
          );
        }
        return _errorRoute();
      default:
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(
      builder: (_) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('error  '),
          ),
          body: const Center(
            child: Text('ERROR'),
          ),
        );
      },
    );
  }
}

// final Map<String, WidgetBuilder> routes = {
  // SplashScreen.routeName: (context) => const SplashScreen(),
  // HomeScreen.routeName: (context) => const HomeScreen(),
  // LoginScreen.routeName: (context) => const LoginScreen(),
  // ForgotPasswordScreen.routeName: (context) => const ForgotPasswordScreen(),
  // LoginSuccessScreen.routeName: (context) => const LoginSuccessScreen(),
  // CartScreen.routeName: (context) => const CartScreen(),
  // CategoryDetailsScreen.routeName: (context) => CategoryDetailsScreen(),
// };
