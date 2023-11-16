// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors, library_private_types_in_public_api, prefer_const_literals_to_create_immutables, sized_box_for_whitespace, unnecessary_cast, deprecated_member_use

import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pay_wallet/features/bar_chart.dart';
import 'package:pay_wallet/features/posts/new_api_view.dart';

void main() {
  runApp(
    ProviderScope(
      child: Calculator(),
    ),
  );
}

class Calculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DevicePreview(
      enabled: true,
      builder: (BuildContext context) {
        return MaterialApp(
          useInheritedMediaQuery: true,
          builder: DevicePreview.appBuilder,
          debugShowCheckedModeBanner: false,
          title: 'Calculator',
          theme: ThemeData(primarySwatch: Colors.blue),
          home: ApiRest(),
        );
      },
    );
  }
}
