import 'package:cl_flutter_hive/screens/home/homepage.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'utils/theme.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  SharedPreferences.getInstance().then(
    (prefs) {
      var isDarkTheme = prefs.getBool("darkTheme") ?? false;
      return runApp(
        ChangeNotifierProvider<ThemeProvider>(
          child: const NoteApp(),
          create: (BuildContext context) {
            return ThemeProvider(isDarkTheme);
          },
        ),
      );
    },
  );

  // runApp(const NoteApp());
}

class NoteApp extends StatelessWidget {
  const NoteApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeProvider>(
      builder: (context, themeProvider, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: themeProvider.getTheme(),
          title: 'Note App',
          home: const HomePage(),
        );
      },
    );
  }
}
