import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sociout/features/main/controller/navigation_bar.dart';
import 'package:sociout/features/main/view/splash_screen.dart';
import 'package:sociout/features/register/controller/signin_controller.dart';
import 'package:sociout/features/register/controller/signup_controller.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => SigninController()),
        ChangeNotifierProvider(create: (_) => SignupController()),
        ChangeNotifierProvider(create: (_) => BottomNavBarController()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Sociout',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const SplashPage(),
      ),
    );
  }
}
