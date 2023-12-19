import 'package:flutter/material.dart';
import 'package:travelexperience/Packages/screens/ForgotPassword.dart';
import 'package:travelexperience/Packages/screens/Home.dart';
import 'package:travelexperience/Packages/screens/hidden_drawer.dart';
import 'package:travelexperience/Packages/screens/sign_in.dart';
import 'package:travelexperience/Packages/screens/sign_up.dart';
import 'package:travelexperience/Packages/screens/welcome.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      routes: {
        "/signInPage": (context) => SignInPage(),
        "/registerPage": (context) => SignUpPage(),
        "/forgotPasswordPage": (context) => ForgotPasswordPage(),
        "/homePage": (context) => Home(),
        "/hiddenDrawer": (context) => HiddenDrawer(),
      },
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Color(0xffFFFFF3E0),
        ),
        useMaterial3: true,
      ),
      home: const WelcomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[],
        ),
      ),
    );
  }
}
