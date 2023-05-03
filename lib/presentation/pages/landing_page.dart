import 'package:flutter/material.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset("assets/images/bgbooks.png"),
            SizedBox(height: 180,),
            Padding(padding: EdgeInsets.all(10),
              child: Text("Read more and stress less with our online book shopping app. Shop from anywhere you are and discover titles that you love. Happy shopping!",
                style: TextStyle(),
                textAlign: TextAlign.center,
              ),
            ),
            ElevatedButton(
                onPressed: () {},
                child: Text("Get Started")
            )

          ],
        ),
      ),
    );
  }
}


