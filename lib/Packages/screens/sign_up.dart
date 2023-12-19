import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:travelexperience/widgets/custom_Text.dart';
import 'package:travelexperience/widgets/custom_TextButton.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final firebaseAuth = FirebaseAuth.instance;
  final firebaseFirestore = FirebaseFirestore.instance;
  final formKey = GlobalKey<FormState>();
  late String email;
  late String password;
  late String fullName;
  late String userName;
  final TextEditingController email_Controller = TextEditingController();
  final TextEditingController password_Controller = TextEditingController();
  final TextEditingController fullName_Controller = TextEditingController();
  final TextEditingController userName_Controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: signUpbody(),
    );
  }

  Container signUpbody() {
    return Container(
      constraints: BoxConstraints.expand(),
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/background.png"),
          fit: BoxFit.cover,
        ),
      ),
      child: Center(
        child: SingleChildScrollView(
          child: Center(
              child: Form(
            key: formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 80.0),
                  child: CustomText(
                      textContent: "Sign Up!",
                      textFontWeight: FontWeight.bold,
                      textColor: Colors.black,
                      textFontSize: 30),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      bottom: 10.0, left: 10.0, right: 10.0),
                  child: fullNameTextFormField(),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      bottom: 10.0, left: 10.0, right: 10.0),
                  child: userNameTextFormField(),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      bottom: 10.0, left: 10.0, right: 10.0),
                  child: emailTextFormField(),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      bottom: 10.0, left: 10.0, right: 10.0),
                  child: passwordTextFormField(),
                ),
                SizedBox(
                  height: 100,
                ),
                signUpButton(),
                SizedBox(
                  height: 20,
                ),
                CustomTextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, "/signInPage");
                  },
                  buttonText: "Cancel",
                  textColor: Colors.black,
                  textFontWeight: FontWeight.bold,
                  textButtonColor: Colors.white,
                  buttonMinimumSize: Size(100, 50),
                ),
              ],
            ),
          )),
        ),
      ),
    );
  }

  TextFormField fullNameTextFormField() {
    return TextFormField(
      validator: (value) {
        if (value!.isEmpty) {
          return "bilgileri eksiksiz doldurunuz";
        } else {}
      },
      onSaved: (value) {
        fullName = value!;
      },
      decoration: const InputDecoration(
        hintText: "Fullname",
        filled: true,
        fillColor: Colors.transparent,
      ),
      controller: fullName_Controller,
      textAlign: TextAlign.center,
      keyboardType: TextInputType.text,
    );
  }

  TextFormField userNameTextFormField() {
    return TextFormField(
      validator: (value) {
        if (value!.isEmpty) {
          return "bilgileri eksiksiz doldurunuz";
        } else {}
      },
      onSaved: (value) {
        userName = value!;
      },
      decoration: const InputDecoration(
        hintText: "Username",
        filled: true,
        fillColor: Colors.transparent,
      ),
      controller: userName_Controller,
      textAlign: TextAlign.center,
      keyboardType: TextInputType.text,
    );
  }

  TextFormField emailTextFormField() {
    return TextFormField(
      validator: (value) {
        if (value!.isEmpty) {
          return "bilgileri eksiksiz doldurunuz";
        } else {}
      },
      onSaved: (value) {
        email = value!;
      },
      decoration: const InputDecoration(
        hintText: "E-mail",
        filled: true,
        fillColor: Colors.transparent,
      ),
      controller: email_Controller,
      textAlign: TextAlign.center,
      keyboardType: TextInputType.text,
    );
  }

  TextFormField passwordTextFormField() {
    return TextFormField(
      validator: (value) {
        if (value!.isEmpty) {
          return "bilgileri eksiksiz doldurunuz";
        } else {}
      },
      onSaved: (value) {
        password = value!;
      },
      decoration: const InputDecoration(
        hintText: "Password",
        filled: true,
        fillColor: Colors.transparent,
      ),
      controller: password_Controller,
      maxLength: 6,
      textAlign: TextAlign.center,
      keyboardType: TextInputType.text,
    );
  }

  ElevatedButton signUpButton() {
    return ElevatedButton(
      onPressed: signUpMethod,
      style: ElevatedButton.styleFrom(
        minimumSize: const Size(220, 50),
        backgroundColor: const Color(0xfffff7043),
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
      ),
      child: const Text(
        "Register",
        style: TextStyle(color: Colors.white),
      ),
    );
  }

  void signUpMethod() async {
    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();
      try {
        var userResult = await firebaseAuth.createUserWithEmailAndPassword(
            email: email, password: password);
        try {
          final resulData = await firebaseFirestore.collection("users").add({
            "fullName": fullName,
            "userName": userName,
            "email": email,
            "password": password,
          });
        } catch (e) {
          print("${e.toString()}");
        }
        formKey.currentState!.reset();
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content:
                Text("Kayit oluşturuldu, giriş sayfasina yönlendiriliyorsunuz"),
          ),
        );
        print(userResult.user!.uid);
        Navigator.pushNamed(context, "/signInPage");
      } catch (e) {
        print(
          e.toString(),
        );
      }
    } else {}
  }
}
