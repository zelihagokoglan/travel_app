import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:travelexperience/Packages/screens/sign_in.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key});

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, //Color(0xffFFFF8A65),
      body: Center(
        child: Column(
          children: [
            const SizedBox(
              height: 100,
            ),
            Center(
              child: Lottie.asset(
                'assets/animation.json',
                width: 300,
                height: 300,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(
              height: 65,
            ),
            const Text(
              "Welcome...",
              style: TextStyle(fontSize: 36, fontStyle: FontStyle.italic),
            ),
            const SizedBox(
              height: 100,
            ),
            TextButton(
              onPressed: () {
                print("Home Page'e geçildi.");
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const SignInPage()));
              },
              style: TextButton.styleFrom(
                  foregroundColor: Colors.white,
                  minimumSize: const Size(220, 50)),
              child: const Text(
                "Let's Start!",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w800,
                  color: Colors.black,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
