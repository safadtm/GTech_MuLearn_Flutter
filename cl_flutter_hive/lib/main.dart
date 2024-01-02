import 'package:cl_flutter_hive/screens/home/homepage.dart';
import 'package:flutter/material.dart';

import 'utils/theme.dart';

void main() {
  runApp(const NoteApp());
}

class NoteApp extends StatelessWidget {
  const NoteApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: Themes().lightTheme,
      darkTheme: Themes().dartTheme,
      themeMode: ThemeMode.system,
      title: 'Note App',
      home: const HomePage(),
    );
  }
}
