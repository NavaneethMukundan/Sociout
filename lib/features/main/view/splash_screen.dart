import 'package:flutter/material.dart';
import 'package:sociout/features/main/view/onboard.dart';
import 'package:sociout/utils/colors.dart';
import 'package:sociout/utils/route.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    toOnboard(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Stack(children: [
            Image.asset(
              'assets/loog.png',
              color: kWhite,
            ),
            const Positioned(
                top: 270,
                left: 113,
                child: Text(
                  'SOCIOUT',
                  style: TextStyle(
                      fontSize: 35, fontWeight: FontWeight.w900, color: kWhite),
                ))
          ]),
        ]),
      ),
    );
  }

  Future<void> toOnboard(context) async {
    await Future.delayed(const Duration(seconds: 3));
    RouteNavigator.pushReplacement(context, const OnBoardPage());
  }
}
