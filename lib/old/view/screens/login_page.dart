import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:taek_it_easy/old/view/screens/main_page.dart';
import 'package:taek_it_easy/old/viewModel/user_provider.dart';

// ignore: must_be_immutable
class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            Positioned(
              top: 0,
              right: 0,
              left: 0,
              child: Container(
                height: 300,
                decoration: const BoxDecoration(color: Color(0xFF8DB9A5)),
                child: Container(
                  padding: const EdgeInsets.only(top: 100, left: 30),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      RichText(
                        text: const TextSpan(
                            text: 'Welcome!',
                            style: TextStyle(
                                letterSpacing: 1,
                                fontSize: 30,
                                color: Colors.white,
                                fontWeight: FontWeight.bold)),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      const Text(
                        'Let\'s do Taekwondo together',
                        style: TextStyle(color: Colors.white, fontSize: 25),
                      )
                    ],
                  ),
                ),
              ),
            ),
            Positioned(
              child: Container(
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
                margin: const EdgeInsets.only(top: 200, left: 30, right: 30),
                padding: const EdgeInsets.only(
                    top: 10, bottom: 0, left: 24, right: 24),
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
                        controller: _controller,
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
                            borderSide: BorderSide(color: Colors.cyan.shade700),
                          ),
                        ),
                      ),
                      const SizedBox(height: 20.0),
                      ElevatedButton(
                        onPressed: () {
                          int intValue = int.tryParse(_controller.text) ?? 0;
                          UserProvider().postUser(intValue);
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(builder: (context) => MainPage()),
                          );
                        },
                        style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all<Color>(Colors.black54),
                        ),
                        child: const Text('Sign up',
                            style: TextStyle(color: Colors.white)),
                      ),
                      const SizedBox(height: 20.0),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
        /*
        bottomNavigationBar: const Padding(
          padding: EdgeInsets.all(20.0),
          child: QuitButton(),
        ),
        */
      ),
    );
  }
}
