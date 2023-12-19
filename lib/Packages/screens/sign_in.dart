import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:travelexperience/widgets/custom_TextButton.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final firebaseAuth = FirebaseAuth.instance;
  final formKey = GlobalKey<FormState>();
  late String email;
  late String password;
  bool _isPasswordVisible = false;
  final TextEditingController mlController = TextEditingController();
  final TextEditingController sfController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: appBody(),
    );
  }

  Center appBody() {
    return Center(
      child: SingleChildScrollView(
        child: Form(
          key: formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Lottie.asset(
                'assets/animation_home.json',
                width: 400,
                height: 200,
                fit: BoxFit.cover,
              ),
              Padding(
                padding: const EdgeInsets.only(
                  bottom: 8.0,
                ),
                child: emailTextField(),
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.only(
                  bottom: 8.0,
                ),
                child: passwordTextField(),
              ),
              SizedBox(
                height: 75,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: login(),
              ),
              CustomTextButton(
                onPressed: () {
                  Navigator.pushNamed(context, "/forgotPasswordPage");
                },
                buttonText: "Forgot Your Password ?",
                textColor: Colors.black,
                textFontWeight: FontWeight.normal,
                textButtonColor: Colors.white,
                buttonMinimumSize: Size(100, 50),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Don't have an Acoount ?",
                    style: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.normal),
                  ),
                  CustomTextButton(
                    onPressed: () {
                      Navigator.pushNamed(context, "/registerPage");
                    },
                    buttonText: "Sign Up !",
                    textColor: Color(0xffFFF7043),
                    textFontWeight: FontWeight.bold,
                    textButtonColor: Colors.white,
                    buttonMinimumSize: Size(50, 50),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  TextFormField emailTextField() {
    return TextFormField(
      validator: (value) {
        if (value!.isEmpty) {
          return "bilgileri eksiksiz doldurunuz";
        } else {}
      },
      onSaved: (value) {
        email = value!;
      },
      decoration: InputDecoration(
        hintText: "E-mail",
        hintStyle: TextStyle(fontStyle: FontStyle.italic),
        prefixIcon: Icon(Icons.email_outlined),
      ),
      controller: mlController,
      textAlign: TextAlign.left,
      keyboardType: TextInputType.text,
    );
  }

  TextFormField passwordTextField() {
    return TextFormField(
      validator: (value) {
        if (value!.isEmpty) {
          return "bilgileri eksiksiz doldurunuz";
        } else {}
      },
      onSaved: (value) {
        password = value!;
      },
      decoration: InputDecoration(
        suffixIcon: IconButton(
          onPressed: () {
            setState(() {
              _isPasswordVisible = !_isPasswordVisible;
            });
          },
          icon: Icon(
            _isPasswordVisible ? Icons.visibility : Icons.visibility_off,
          ),
        ),
        hintText: "Password",
        hintStyle: TextStyle(fontStyle: FontStyle.italic),
        prefixIcon: Icon(Icons.key_rounded),
      ),
      obscureText: !_isPasswordVisible,
      controller: sfController,
      textAlign: TextAlign.left,
      keyboardType: TextInputType.text,
    );
  }

  ElevatedButton login() {
    return ElevatedButton(
      onPressed: () async {
        if (formKey.currentState!.validate()) {
          formKey.currentState!.save();
          try {
            final userResult = await firebaseAuth.signInWithEmailAndPassword(
                email: email, password: password);
            Navigator.pushNamed(context, "/hiddenDrawer");
            print(userResult.user!.email);
          } catch (e) {
            print(
              e.toString(),
            );
          }
        } else {}

        Text("Giriş yapildi");
      },
      child: Text(
        "Login",
        style: TextStyle(color: Colors.white, fontSize: 18),
      ),
      style: ElevatedButton.styleFrom(
        minimumSize: Size(220, 50),
        primary: Color(0xffFFF7043),
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
      ),
    );
  }
}
