import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:pay_wallet/features/password_page.dart';
import 'package:pay_wallet/features/widget/build_button.dart';

class MyTransferPage extends StatefulWidget {
  const MyTransferPage({super.key});

  @override
  State<MyTransferPage> createState() => _MyTransferPageState();
}

class _MyTransferPageState extends State<MyTransferPage> {
  String equation = "0";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlue,
      body: SafeArea(
          child: SizedBox(
        child: Stack(
          alignment: Alignment.center,
          children: [
            Positioned(
              top: 197.0,
              // left: 143.5,
              child: equation == '0'
                  ? Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(
                            text: equation,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 52.47,
                              fontFamily: 'Hanno',
                              fontWeight: FontWeight.w400,
                              height: 0.03,
                            ),
                          ),
                          const TextSpan(
                            text: '.00',
                            style: TextStyle(
                              color: Color(0xFF6D727B),
                              fontSize: 40,
                              fontFamily: 'Hanno',
                              fontWeight: FontWeight.w400,
                              height: 0.03,
                            ),
                          ),
                        ],
                      ),
                    )
                  : Text(
                      equation,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 52.47,
                        fontFamily: 'Hanno',
                        fontWeight: FontWeight.w400,
                        height: 0.03,
                      ),
                    ),
            ),
            Positioned(
              top: 270,
              bottom: 40,
              child: Container(
                width: 401,
                height: 610,
                padding:
                    const EdgeInsets.symmetric(horizontal: 30, vertical: 12.82),
                child: Table(
                  children: [
                    // TableRow(children: buttonList(keyList)),
                    TableRow(children: [
                      setButton("1", 1, Colors.black54),
                      setButton("2", 1, Colors.black54),
                      setButton("3", 1, Colors.black54),
                    ]),
                    TableRow(children: [
                      setButton("4", 1, Colors.black54),
                      setButton("5", 1, Colors.black54),
                      setButton("6", 1, Colors.black54),
                    ]),
                    TableRow(children: [
                      setButton("7", 1, Colors.black54),
                      setButton("8", 1, Colors.black54),
                      setButton("9", 1, Colors.black54),
                    ]),

                    TableRow(children: [
                      setButton(".", 1, Colors.black54),
                      setButton("0", 1, Colors.black54),
                      setButton("⌫", 1, Colors.black54),
                    ]),
                  ],
                ),
              ),
            ),
            Positioned(
              bottom: 11,
              child: InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const PasswordPage()));
                },
                child: Container(
                    padding: const EdgeInsets.all(15.17),
                    child: const Text(
                      'Click to view the password mode',
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    )),
              ),
            ),
          ]
              .animate(interval: const Duration(milliseconds: 100))
              .fade()
              .moveY()
              .shimmer(),
        ),
      )),
    );
  }

  Widget setButton(String buttonText, double buttonHeight, Color buttonColor) {
    return BuildButton(buttonText, buttonHeight, buttonPressed);
  }

  buttonPressed(String buttonText) {
    setState(() {
      if (buttonText == "⌫") {
        equation = equation.substring(0, equation.length - 1);
        if (equation == "") {
          equation = "0";
        }
      } else {
        if (equation == "0") {
          equation = buttonText;
        }
        if (equation.length < 10) {
          equation = equation + buttonText;
        }
      }
    });
  }
}
