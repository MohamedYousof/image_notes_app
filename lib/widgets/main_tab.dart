import 'package:flutter/material.dart';
import 'package:image_notes/widgets/note_widget.dart';

class NotesList extends StatelessWidget {
  const NotesList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // return ListView.separated(
    //   itemBuilder: (context, i) => NoteTile(),
    //   itemCount: 3,
    //   padding: EdgeInsets.all(10),
    //   separatorBuilder: (BuildContext context, int index) =>
    //       SizedBox(height: 10),
    // );
    return OrientationBuilder(
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
    );
  }
}
