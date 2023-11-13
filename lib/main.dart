// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors, library_private_types_in_public_api, prefer_const_literals_to_create_immutables, sized_box_for_whitespace, unnecessary_cast

import 'package:flutter/material.dart';
import 'package:pay_wallet/features/transfer.dart';
void main() => runApp(Calculator());

class Calculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Calculator',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: MyTransferPage(),
    );
  }
}
