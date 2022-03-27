import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:weather_forcasting/features/home/screen/home_screen.dart';
import 'package:weather_forcasting/generated/assets.gen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  late double _opacity;

  @override
  void initState() {
    super.initState();

    _opacity = 0;
    _runBackgrounProcess();
  }

  void _runBackgrounProcess() async {
    await delay();
    await navigateToHome(context);
  }

  Future<void> delay() async => Future<void>.delayed(Duration(seconds: 2)).then((value) {
        setState(() {
          _opacity = 1;
        });
      });

  Future<void> navigateToHome(BuildContext context) async => Future<void>.delayed(Duration(seconds: 3)).then((value) {
        Navigator.of(context).push(HomeScreen.route());
      });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
            decoration: BoxDecoration(gradient: LinearGradient(colors: <Color>[Colors.blue, Colors.blueAccent.shade700])),
            child: SplashBody(
              opacity: _opacity,
            )),
      ),
    );
  }
}

class SplashBody extends StatelessWidget {
  const SplashBody({Key? key, required this.opacity}) : super(key: key);

  final double opacity;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Assets.images.emerson.image(),
        const SizedBox(height: 10),
        Align(
          alignment: Alignment.center,
          child: AnimatedOpacity(
              opacity: opacity,
              duration: Duration(seconds: 2),
              child: Text(
                'Weather Forcast',
                style: TextStyle(color: Colors.black, fontSize: 25.sp, fontWeight: FontWeight.bold),
              )),
        ),
        AnimatedOpacity(opacity: opacity, duration: Duration(seconds: 2), child: Text('e-Mersion Media'))
      ],
    );
  }
}
