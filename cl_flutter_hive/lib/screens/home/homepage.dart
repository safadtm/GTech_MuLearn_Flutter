import 'package:cl_flutter_hive/screens/home/add_note.dart';
import 'package:cl_flutter_hive/screens/settings/settings.dart';
import 'package:cl_flutter_hive/widgets/custom_icon_btn.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

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
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomIconBtn(
                      color: Theme.of(context).colorScheme.background,
                      onPressed: () {},
                      icon: const Icon(Icons.list),
                    ),
                    const Text(
                      "Notes",
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    CustomIconBtn(
                      color: Theme.of(context).colorScheme.background,
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Setting()),
                        );
                      },
                      icon: const Icon(
                        Icons.settings,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),

              //  Listing notes here
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        tooltip: "Add Note",
        onPressed: () {
          print('New Note');
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AddNotePage()),
          );
        },
        child: const Icon(
          Icons.note_add,
          size: 30,
        ),
      ),
    );
  }
}
