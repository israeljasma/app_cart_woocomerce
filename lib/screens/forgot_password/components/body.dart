import 'package:app_cart_woocomerce/screens/components/custom_suffix_icon.dart';
import 'package:app_cart_woocomerce/screens/components/default_button.dart';
import 'package:app_cart_woocomerce/screens/login/components/form_error.dart';
import 'package:app_cart_woocomerce/screens/login/components/no_account_text.dart';
import 'package:app_cart_woocomerce/utils/constants.dart';
import 'package:flutter/material.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              SizedBox(height: MediaQuery.of(context).size.height * 0.04),
              const Text(
                'Has olvidado tu contraseña',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 28,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Text(
                'Por favor ingrese su correo electrónico y le enviaremos \nun enlace para volver a su cuenta',
                textAlign: TextAlign.center,
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.1),
              const FortgotPasswordForm(),
            ],
          ),
        ),
      ),
    );
  }
}

class FortgotPasswordForm extends StatefulWidget {
  const FortgotPasswordForm({Key? key}) : super(key: key);

  @override
  State<FortgotPasswordForm> createState() => _FortgotPasswordFormState();
}

class _FortgotPasswordFormState extends State<FortgotPasswordForm> {
  final _formKey = GlobalKey<FormState>();
  List<String> errors = [];
  late String email;
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          TextFormField(
            keyboardType: TextInputType.emailAddress,
            onSaved: (newValue) => email = newValue!,
            onChanged: (value) {
              if (value.isNotEmpty && errors.contains(emailNullError)) {
                setState(() {
                  errors.remove(emailNullError);
                });
              } else if (emailValidatorRegExp.hasMatch(value) &&
                  errors.contains(invalidEmailError)) {
                setState(() {
                  errors.remove(invalidEmailError);
                });
              }
              return;
            },
            validator: (value) {
              if (value!.isEmpty && !errors.contains(emailNullError)) {
                setState(() {
                  errors.add(emailNullError);
                });
              } else if (!emailValidatorRegExp.hasMatch(value) &&
                  !errors.contains(invalidEmailError)) {
                setState(() {
                  errors.add(invalidEmailError);
                });
              }
              return null;
            },
            decoration: InputDecoration(
              labelText: 'Email',
              hintText: 'Introduce tu email',
              floatingLabelBehavior: FloatingLabelBehavior.always,
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 42, vertical: 20),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(28),
                borderSide: const BorderSide(color: Colors.black26),
                gapPadding: 10,
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(28),
                borderSide: const BorderSide(color: Colors.black26),
                gapPadding: 10,
              ),
              suffixIcon: const CustomSuffixIcon(
                iconData: Icons.email,
              ),
            ),
          ),
          const SizedBox(height: 30),
          FormError(errors: errors),
          SizedBox(height: MediaQuery.of(context).size.height * 0.1),
          DefaultButton(
            text: 'Continuar',
            press: () {
              if (_formKey.currentState!.validate()) {}
            },
          ),
          SizedBox(height: MediaQuery.of(context).size.height * 0.1),
          const NoAccountText(),
        ],
      ),
    );
  }
}
