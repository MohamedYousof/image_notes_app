import 'package:flutter/material.dart';
import 'package:image_notes/controller/providers/notes_provider.dart';
import 'package:image_notes/widgets/new_note_widget.dart';
import 'package:image_notes/widgets/note_widget.dart';
import 'package:provider/provider.dart';

class NotesList extends StatefulWidget {
  const NotesList({Key? key}) : super(key: key);

  @override
  _NotesListState createState() => _NotesListState();
}

class _NotesListState extends State<NotesList> {
  bool _isLoading = true;
  @override
  void initState() {
    Provider.of<NotesProvider>(context, listen: false)
        .downloadNotes()
        .then((value) {
      setState(() {
        _isLoading = !_isLoading;
      });
    });
    super.initState();
  }

  void newNotePopup() {
    showGeneralDialog(
      barrierColor: Colors.black12.withOpacity(0.5),
      transitionBuilder: (context, a1, a2, widget) {
        return Transform.scale(
          scale: a1.value,
          child: Opacity(
            opacity: a1.value,
            child: Dialog(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(8.0),
                ),
              ),
              elevation: 5,
              child: NotePopup(),
            ),
          ),
        );
      },
      transitionDuration: Duration(milliseconds: 350),
      barrierDismissible: true,
      barrierLabel: '',
      context: context,
      pageBuilder: (context, animation1, animation2) {
        return Container();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final notes = Provider.of<NotesProvider>(context).notes;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      floatingActionButton: FloatingActionButton(
        onPressed: newNotePopup,
        child: Icon(Icons.add, color: Theme.of(context).accentColor),
        backgroundColor: Theme.of(context).buttonColor,
      ),
      body: OrientationBuilder(
        builder: (BuildContext context, Orientation orientation) {
          if (_isLoading) {
            return Center(child: CircularProgressIndicator());
          } else if (!_isLoading && notes.length == 0) {
            return Center(
              child: Text(
                'Be the first to add notes 💪',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            );
          } else {
            return GridView.builder(
              scrollDirection: Axis.vertical,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: orientation == Orientation.portrait ? 1 : 2,
                mainAxisSpacing: 15,
              ),
              padding: EdgeInsets.all(10),
              itemBuilder: (context, i) => NoteTile(
                remoteId: notes[i].remoteId,
                imgUrl: notes[i].imgUrl,
                comment: notes[i].comment,
                username: notes[i].userName,
              ),
              itemCount: notes.length,
            );
          }
        },
      ),
    );
  }
}
