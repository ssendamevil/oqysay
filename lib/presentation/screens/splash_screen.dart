import 'package:binderbee/presentation/pages/login_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SvgPicture.asset('assets/logo/logo.svg'),
            const SizedBox(height: 20,),
            SvgPicture.asset('assets/logo/oqysay.svg')
          ],
        ),
      ),
    );
  }
}
