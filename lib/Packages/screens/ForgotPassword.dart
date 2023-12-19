import 'package:flutter/material.dart';

class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({super.key});

  @override
  State<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  var mailController = TextEditingController();
  var number1Controller = TextEditingController();
  var number2Controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Forgot Password",
          style: TextStyle(fontSize: 24.0, color: Colors.white),
        ),
        backgroundColor: const Color(0xfffff7043),
      ),
      body: Container(
        constraints: BoxConstraints.expand(),
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/background.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                      bottom: 10.0, left: 10.0, right: 10.0),
                  child: SizedBox(
                    width: 300,
                    height: 40,
                    child: TextField(
                      decoration: const InputDecoration(
                        hintText: "E-mail",
                      ),
                      controller: mailController,
                      textAlign: TextAlign.center,
                      keyboardType: TextInputType.text,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      bottom: 10.0, left: 10.0, right: 10.0),
                  child: SizedBox(
                    width: 300,
                    height: 40,
                    child: TextField(
                      decoration: const InputDecoration(
                        hintText: " New Password",
                      ),
                      controller: number1Controller,
                      textAlign: TextAlign.center,
                      obscureText: true,
                      keyboardType: TextInputType.number,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      bottom: 10.0, left: 10.0, right: 10.0),
                  child: SizedBox(
                    width: 300,
                    height: 40,
                    child: TextField(
                      decoration: const InputDecoration(
                        hintText: "Password",
                      ),
                      controller: number2Controller,
                      textAlign: TextAlign.center,
                      obscureText: true,
                      keyboardType: TextInputType.number,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 100,
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      bottom: 10.0, left: 10.0, right: 10.0),
                  child: SizedBox(
                    width: 300,
                    height: 40,
                    child: ElevatedButton(
                      onPressed: () {
                        showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                title: const Text("Alert"),
                                content:
                                    const Text("Password Change Successful"),
                                actions: [
                                  TextButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    child: const Text("Cancel"),
                                  ),
                                  TextButton(
                                    onPressed: () => Navigator.pushNamed(
                                        context, "/homePage"),
                                    child: const Text("OK"),
                                  ),
                                ],
                              );
                            });
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xfffff7043),
                        minimumSize: const Size(220, 50),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0)),
                      ),
                      child: const Text(
                        "Change Password",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
