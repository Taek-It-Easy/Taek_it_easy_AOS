import 'package:flutter/material.dart';
import 'package:taek_it_easy/designSystem/font_system.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _ageController = TextEditingController();
  final String _age = '';

  @override
  void dispose() {
    _ageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(children: [
          Positioned(
              top: 0,
              right: 0,
              left: 0,
              child: Container(
                padding: const EdgeInsets.only(top: 100, left: 30),
                height: 300,
                color: const Color(0xFF8DB9A5),
                child: const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Welcome!',
                      style: Fonts.loginTitle,
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      'Let\'s do Taekwondo together',
                      style: Fonts.loginSubTitle,
                    )
                  ],
                ),
              )),
          Positioned(
              child: Container(
                  margin: const EdgeInsets.only(top: 200, left: 30, right: 30),
                  padding: const EdgeInsets.only(
                      top: 10, bottom: 0, left: 24, right: 24),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8.0),
                      border: Border.all(
                        color: Colors.white,
                        width: 2.0,
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.3),
                          spreadRadius: 5,
                          blurRadius: 15,
                          offset: const Offset(0, 3),
                        )
                      ]),
                  child: SingleChildScrollView(
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                              margin: const EdgeInsets.symmetric(vertical: 20),
                              child: const Text(
                                "Please write down your age.",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 20),
                              )),
                          TextField(
                            controller: _ageController,
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                              labelText: 'Age',
                              labelStyle: TextStyle(
                                color: Colors.grey.shade800,
                              ),
                              floatingLabelStyle: TextStyle(
                                color: Colors.grey.shade800,
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.cyan.shade700),
                              ),
                            ),
                          ),
                          const SizedBox(height: 20.0),
                          ElevatedButton(
                            onPressed: () {},
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all<Color>(
                                  Colors.black54),
                            ),
                            child: const Text('Sign up',
                                style: TextStyle(color: Colors.white)),
                          ),
                          const SizedBox(
                            height: 20,
                          )
                        ]),
                  )))
        ]),
      ),
    );
  }
}
