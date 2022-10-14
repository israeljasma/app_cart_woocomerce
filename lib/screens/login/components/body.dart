import 'package:app_cart_woocomerce/screens/login/components/login_form.dart';
import 'package:flutter/material.dart';
import 'package:app_cart_woocomerce/theme/app_theme.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: MediaQuery.of(context).size.height * 0.04),
                const Text(
                  'Bienvenido de nuevo',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Text(
                  'Inicia sesión con tu email y contraseña',
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.08),
                const LoginForm(),
                SizedBox(height: MediaQuery.of(context).size.height * 0.08),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Text(
                      '¿No tienes cuenta? ',
                      style: TextStyle(fontSize: 16),
                    ),
                    Text(
                      'Registrarse',
                      style: TextStyle(
                          fontSize: 16, color: Color.fromRGBO(128, 96, 76, 1)),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
