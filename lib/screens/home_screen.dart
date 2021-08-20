import 'package:flutter/material.dart';
import 'package:image_notes/controller/providers/notes_provider.dart';
import 'package:image_notes/widgets/main_tab.dart';
import 'package:image_notes/widgets/profile_tab.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  static const routeName = 'home_screen';

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          bottom: TabBar(
            tabs: [
              Tab(
                child: Text(
                  'Main',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
              ),
              Tab(
                child: Text(
                  'Profile',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            NotesList(),
            ProfileTab(),
          ],
        ),
      ),
    );
  }
}
