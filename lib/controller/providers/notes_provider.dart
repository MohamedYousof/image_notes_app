import 'package:flutter/foundation.dart';
import 'package:image_notes/controller/helpers/api_helper.dart';
import 'package:image_notes/models/note_model.dart';

class NotesProvider with ChangeNotifier {
  List<Note> _notes = [];

  List<Note> get notes => _notes;

  Future<void> downloadNotes() async {
    Api _api = Api();
    final response = await _api.getData('api/v1/notes/');
    if (response.length > 0 && !response[0].containsKey('error')) {
      List<Note> tempNotes = [];
      response.forEach((i) {
        tempNotes.add(Note(
          remoteId: i['id'],
          userName: i['username'],
          imgUrl: i['image'],
          comment: i['comment'],
        ));
      });
      _notes = tempNotes;
      notifyListeners();
    }
  }
}
