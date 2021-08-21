import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:image_notes/controller/helpers/api_helper.dart';
import 'package:image_notes/controller/helpers/shared_prefs.dart';
import 'package:image_notes/models/note_model.dart';
import 'package:http/http.dart' as http;

class NotesProvider with ChangeNotifier {
  List<Note> _notes = [];

  List<Note> get notes => _notes;

  Future<void> downloadNotes() async {
    Api _api = Api();
    final response = await _api.getData('api/v1/notes/');
    if (response.length > 0 && !response[0].containsKey('error')) {
      List<Note> tempNotes = [];
      response.forEach((i) {
        tempNotes.insert(
            0,
            Note(
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

  Future<void> postNote(String comment, image, String imageName) async {
    final url = Api.baseUrl + '/api/v1/notes/';
    final data = await SharedData().getLoginData();
    final token = data['token'];
    final headers = {
      "Authorization": "Token $token",
    };
    var request = http.MultipartRequest('POST', Uri.parse(url));
    request.fields.addAll({
      'comment': comment,
    });
    request.files.add(
      http.MultipartFile.fromBytes(
        'file',
        image,
        filename: imageName,
      ),
    );
    request.headers.addAll(headers);
    final resp = await request.send();
    if (resp.statusCode == 201) {
      final note = jsonDecode(await resp.stream.bytesToString());

      _notes.insert(
          0,
          Note(
            remoteId: note['id'],
            userName: note['username'],
            imgUrl: note['image'],
            comment: note['comment'],
          ));
      notifyListeners();
    }
  }

  Future<void> uploadImage(int remoteId, imgBytes) async {}
}
