import 'package:cl_flutter_hive/screens/settings/dark_mode.dart';
import 'package:flutter/material.dart';

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
              ListTileSetting(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const DarkMode()),
                  );
                },
                title: "Dark Mode",
                iconData: Icons.nights_stay,
                subtitle: null,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
