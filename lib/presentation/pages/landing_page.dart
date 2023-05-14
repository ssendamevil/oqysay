import 'package:binderbee/presentation/pages/login_page.dart';
import 'package:flutter/material.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Image.asset("assets/images/bgbooks.png",),
          const SizedBox(height: 40,),
          const SizedBox(
            child: Padding(padding: EdgeInsets.only(left: 30,right: 30 ),
              child: Text("Read more and stress less with our online book shopping app. Shop from anywhere you are and discover titles that you love. Happy shopping!",
                style: TextStyle(
                  fontFamily: "Montserrat",
                  fontSize: 16,
                  fontWeight: FontWeight.w400
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          const SizedBox(height: 100,),
          SizedBox(
            width: 305,
            height: 47,
            child: Container(
              decoration: BoxDecoration(
                color: Color(0xFF223263),
                borderRadius: BorderRadius.circular(10),
              ),
              child: ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const LoginPage(),
                    ));
                  },
                style: ElevatedButton.styleFrom(
                  shape:RoundedRectangleBorder(
                    borderRadius:BorderRadius.circular(10),
                  ),
                  elevation: 0,
                  primary: Colors.transparent
                ),
                  child: const Text("Get Started",
                    style: TextStyle(
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.w500,
                      fontSize: 16,
                      color: Colors.white
                    ),
                  ),
              ),
            ),
          )

        ],
      ),
    );
  }
}


