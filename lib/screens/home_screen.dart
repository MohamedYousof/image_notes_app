import 'package:flutter/material.dart';
import 'package:image_notes/widgets/main_tab.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          bottom: TabBar(
            tabs: [
              Tab(text: 'Main'),
              Tab(text: 'Profile'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            NotesList(),
            Container(),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          child: Icon(Icons.add, color: Theme.of(context).accentColor),
          backgroundColor: Theme.of(context).buttonColor,
        ),
      ),
    );
  }
}
