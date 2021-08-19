import 'package:flutter/material.dart';
import 'package:image_notes/widgets/note_widget.dart';

class NotesList extends StatelessWidget {
  const NotesList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.add, color: Theme.of(context).accentColor),
        backgroundColor: Theme.of(context).buttonColor,
      ),
      body: OrientationBuilder(
        builder: (BuildContext context, Orientation orientation) {
          return GridView.builder(
            scrollDirection: Axis.vertical,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: orientation == Orientation.portrait ? 1 : 2,
              mainAxisSpacing: 15,
            ),
            padding: EdgeInsets.all(10),
            itemBuilder: (context, i) => NoteTile(),
            itemCount: 3,
          );
        },
      ),
    );
  }
}
