import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:pay_wallet/features/widget/build_button.dart';

class PasswordPage extends StatefulWidget {
  const PasswordPage({super.key});

  @override
  State<PasswordPage> createState() => _PasswordPageState();
}

class _PasswordPageState extends State<PasswordPage> {
  String equation = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amberAccent,
      body: SafeArea(
          child: SizedBox(
        child: Stack(
          alignment: Alignment.center,
          children: [
            Positioned(
              top: 217.0,
              // left: 143.5,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                  4,
                  (index) {
                    return Container(
                      margin: const EdgeInsets.all(6.0),
                      width: 16,
                      height: 16,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(6.0),
                        color: index < equation.length
                            ? Colors.black
                            : CupertinoColors.activeBlue.withOpacity(0.1),
                      ),
                    );
                  },
                ),
              ),
            ),
            Positioned(
              top: 315,
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
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: IconButton(
                          onPressed: () {
                            setState(
                              () {
                                if (equation.isNotEmpty) {
                                  equation = equation.substring(
                                      0, equation.length - 1);
                                }
                              },
                            );
                          },
                          icon: const Icon(
                            Icons.backspace_outlined,
                            color: Colors.white,
                            size: 24,
                          ),
                        ),
                      )
                    ]),
                  ],
                ),
              ),
            ),
            Positioned(
              bottom: 11,
              child: InkWell(
                onTap: () {
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: Text('This is your password $equation')));
                },
                child: Container(
                    alignment: Alignment.center,
                    width: 70,
                    height: 70,
                    decoration: ShapeDecoration(
                      color: const Color(0xFFF6E0D4),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.34),
                      ),
                    ),
                    child: const Icon(
                      Icons.fingerprint,
                      size: 50,
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

  void onPressed(String buttonText) {
    setState(() {
      if (equation == "0") {
        equation = buttonText;
      }
      if (equation.length < 4) {
        equation = equation + buttonText;
      }
    });
  }

  Widget setButton(String buttonText, double buttonHeight, Color buttonColor) {
    return BuildButton(buttonText, buttonHeight, onPressed);
  }
}
