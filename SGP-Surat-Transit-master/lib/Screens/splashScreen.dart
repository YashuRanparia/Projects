import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'NavigationScreen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  Future<void> readJson() async {
    final String jsondata =
        await rootBundle.loadString('lib/DATA/master-data.json');
    final list = json.decode(jsondata);
  }

  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 7), (() {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: ((context) => const CustomNavigation()),
        ),
      );
    }));
  }

// NavigetScreen()
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: const Color.fromARGB(255, 33, 139, 253),
        child: Center(
            child: Container(
          width: MediaQuery.of(context).size.width * 1.56,
          child: Stack(alignment: AlignmentDirectional.bottomCenter, children: [
            Image.asset("assets/images/logo_flash.gif"),
            const Text(
              'SuratGo',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.w700,
                fontFamily: 'Montserrat_Subrayada',
              ),
            )
          ]),
        )),
      ),
    );
  }
}
