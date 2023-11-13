import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:pay_wallet/features/widget/build_button.dart';

class MyTransferPage extends StatefulWidget {
  const MyTransferPage({super.key});

  @override
  State<MyTransferPage> createState() => _MyTransferPageState();
}

class _MyTransferPageState extends State<MyTransferPage> {
  String equation = "";
  var formatter = NumberFormat.decimalPattern("en_US");
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff0D0C12),
      body: SafeArea(
          child: SizedBox(
        child: Stack(
          alignment: Alignment.center,
          children: [
            const Positioned(
              top: 94,
              left: 34,
              child: Text(
                'Good morning!',
                style: TextStyle(
                  fontFamily: 'Hanno',
                  color: Color(0xCCF6E0D4),
                  fontSize: 12.78,
                  fontWeight: FontWeight.w400,
                  height: 0.10,
                ),
              ),
            ),
            Positioned(
              top: 117,
              left: 34,
              child: Row(
                children: [
                  Text(
                    'Kinggsley',
                    style: GoogleFonts.taiHeritagePro(
                      color: const Color(0xFFF6E0D4),
                      fontSize: 25,
                      fontWeight: FontWeight.w900,
                      height: 0.05,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(2.0),
                    child: Image.asset(
                      'assets/icons/icon.png',
                      width: 15,
                      height: 15,
                    ),
                  )
                ],
              ),
            ),
            Positioned(
              top: 104.13,
              right: 33.95,
              child: Image.asset(
                'assets/icons/womna.png',
              ),
            ),
            Positioned(
              top: 217.0,
              // left: 143.5,
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 53.0, left: 5.0),
                    child: Image.asset(
                      'assets/icons/dollar.png',
                    ),
                  ),
                  equation == ''
                      ? const Text.rich(
                          TextSpan(
                            children: [
                              TextSpan(
                                text: '0',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 52.47,
                                  fontFamily: 'Hanno',
                                  fontWeight: FontWeight.w400,
                                  height: 0.03,
                                ),
                              ),
                              TextSpan(
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
                          formatter.format(double.tryParse(equation)),
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 52.47,
                            fontFamily: 'Hanno',
                            fontWeight: FontWeight.w400,
                            height: 0.03,
                          ),
                        ),
                ],
              ),
            ),
            const Positioned(
              top: 278.0,
              child: Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text: 'Available: ',
                      style: TextStyle(
                        color: Color(0xFF6D727B),
                        fontSize: 13,
                        fontFamily: 'Hanno',
                        fontWeight: FontWeight.w400,
                        height: 0.12,
                        letterSpacing: 0.41,
                      ),
                    ),
                    TextSpan(
                      text: '\$203.74',
                      style: TextStyle(
                        color: Color(0xFFF6E0D4),
                        fontSize: 13,
                        fontFamily: 'Hanno',
                        fontWeight: FontWeight.w400,
                        height: 0.12,
                        letterSpacing: 0.41,
                      ),
                    ),
                  ],
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
                  log(equation);
                },
                child: Container(
                  width: 61,
                  height: 61,
                  padding: const EdgeInsets.all(15.17),
                  decoration: ShapeDecoration(
                    color: const Color(0xFFF6E0D4),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.34),
                    ),
                  ),
                  child: Image.asset(
                    'assets/icons/arrow.png',
                    width: 30,
                    height: 30,
                  ),
                ),
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
