import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../utils/theme.dart';
import '../../widgets/custom_icon_btn.dart';
import 'widgets/list_tile.dart';

class Setting extends StatelessWidget {
  const Setting({super.key});

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
                      width: MediaQuery.of(context).size.width / 4,
                    ),
                    const Text(
                      "Settings",
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
                  // Get.to(() => Account());
                },
                title: "Account",
                iconData: Icons.person,
                subtitle: null,
              ),
              Consumer<ThemeProvider>(
                builder: (context, themeProvider, child) {
                  return ListTileSetting(
                    onTap: () {
                      Provider.of<ThemeProvider>(context, listen: false)
                          .swapTheme();
                    },
                    title: themeProvider.getTheme() == themeProvider.lightTheme
                        ? "Dark Mode"
                        : "Light Mode",
                    iconData:
                        themeProvider.getTheme() == themeProvider.lightTheme
                            ? Icons.nights_stay
                            : Icons.brightness_7,
                    subtitle: null,
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
