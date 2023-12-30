import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

import 'screens/calculator.dart';

void main()  {
  runApp(const CalculatorApp());
}

class CalculatorApp extends StatelessWidget {
  const CalculatorApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
       builder: EasyLoading.init(),
      title: 'Calculator',
      theme: ThemeData.dark(),
      home: const Calculator(),
    );
  }
}
