import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);
  static String routeName = "/splash";

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(
      const Duration(milliseconds: 1500),
      () => Navigator.pushNamedAndRemoveUntil(context, '/home', (_) => false),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const Spacer(),
            Center(
              child: FractionallySizedBox(
                widthFactor: 0.6,
                child: Image.asset('assets/banner-logo.png'),
              ),
            ),
            const Spacer(),
            const CircularProgressIndicator(),
            const SizedBox(height: 20),
            const Text('Bienvenido')
          ],
        ),
      ),
    );
  }
}
