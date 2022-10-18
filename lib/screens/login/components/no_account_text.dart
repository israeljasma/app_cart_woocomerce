import 'package:flutter/material.dart';

class NoAccountText extends StatelessWidget {
  const NoAccountText({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          '¿No tienes cuenta? ',
          style: TextStyle(fontSize: 16),
        ),
        GestureDetector(
          onTap: () {},
          child: const Text(
            'Registrarse',
            style:
                TextStyle(fontSize: 16, color: Color.fromRGBO(128, 96, 76, 1)),
          ),
        ),
      ],
    );
  }
}
