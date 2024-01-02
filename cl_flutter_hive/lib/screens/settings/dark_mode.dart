import 'package:flutter/material.dart';

import '../../widgets/custom_icon_btn.dart';
import 'widgets/list_tile.dart';

class DarkMode extends StatefulWidget {
  const DarkMode({super.key});

  @override
  State<DarkMode> createState() => _DarkModeState();
}

class _DarkModeState extends State<DarkMode> {
  ThemeMode _currentThemeMode = ThemeMode.system;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 10,
            horizontal: 16,
          ),
          child: Column(
            children: [
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    CustomIconBtn(
                      icon: const Icon(
                        Icons.arrow_back_ios,
                      ),
                      color: Theme.of(context).colorScheme.background,
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width / 5,
                    ),
                    const Text(
                      "Appearnace",
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              ListTileSetting(
                  onTap: () {
                    _currentThemeMode = ThemeMode.system;
                  },
                  title: "Use device setting",
                  iconData: Icons.settings_brightness_outlined,
                  subtitle: const Text(
                    "Auttomatically swtich between Light and Dark themes when your system does",
                  )),
              ListTileSetting(
                onTap: () {
                  _currentThemeMode = ThemeMode.light;
                  // Get.changeThemeMode(ThemeMode.light);
                },
                title: "Light Mode",
                iconData: Icons.brightness_5,
                subtitle: null,
              ),
              ListTileSetting(
                iconData: Icons.brightness_4_outlined,
                onTap: () {
                  _currentThemeMode = ThemeMode.dark;
                  // Get.changeThemeMode(ThemeMode.dark);
                },
                title: "Dark Mode",
                subtitle: null,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
