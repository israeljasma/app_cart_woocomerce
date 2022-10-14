import 'package:app_cart_woocomerce/screens/login/components/body.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);
  static String routeName = "/login";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Acceder')),
      body: Body(),
    );
  }
}


// import 'package:flutter/material.dart';

// class LoginScreen extends StatefulWidget {
//   const LoginScreen({Key? key}) : super(key: key);

//   @override
//   State<LoginScreen> createState() => _LoginScreenState();
// }

// class _LoginScreenState extends State<LoginScreen> {
//   bool hidePassword = true;
//   bool isApiCallProcess = false;
//   GlobalKey<FormState> globalKey = GlobalKey<FormState>();
//   late String username;
//   late String password;

//   @override
//   Widget build(BuildContext context) {
//     return const Scaffold(
//       body: Center(
//         child: Text('LoginScreen'),
//       ),
//     );
//   }
// }
