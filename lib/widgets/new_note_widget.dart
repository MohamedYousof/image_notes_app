import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_notes/controller/providers/notes_provider.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

class NotePopup extends StatefulWidget {
  const NotePopup({Key? key}) : super(key: key);

  @override
  _NotePopupState createState() => _NotePopupState();
}

class _NotePopupState extends State<NotePopup> {
  var imgFile;
  var imgBytes;
  var imageName = '';
  String comment = '';
  bool _posting = false;
  void selectImage() async {
    final image = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (image == null) return;
    imgBytes = await image.readAsBytes();
    setState(() {
      imgFile = File(image.path);
    });
    imageName = image.name;
  }

  @override
  Widget build(BuildContext context) {
    final totalHeight = MediaQuery.of(context).size.height * 0.6;
    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Theme.of(context).accentColor,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(10),
            topRight: Radius.circular(10),
          ),
        ),
        height: totalHeight,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Container(
                constraints: BoxConstraints(
                  minHeight: totalHeight * 0.5,
                  maxHeight: totalHeight * 0.5,
                  minWidth: double.infinity,
                ),
                color: Color(0xFFD8D8D8),
                child: imgFile == null
                    ? IconButton(
                        onPressed: selectImage,
                        icon: Icon(
                          Icons.camera_alt_outlined,
                          size: 100,
                        ),
                      )
                    : Image.file(
                        imgFile,
                        fit: BoxFit.contain,
                      ),
              ),
            ),
            Container(
              constraints: BoxConstraints(
                maxHeight: totalHeight * 0.3,
              ),
              child: TextField(
                onChanged: (text) {
                  comment = text;
                },
                maxLength: 120,
                maxLines: 3,
                decoration: InputDecoration(
                  hintText: 'Comment',
                  labelText: 'Type a comment for the image',
                  contentPadding: const EdgeInsets.only(right: 10),
                  fillColor: Colors.white,
                  filled: true,
                ),
              ),
            ),
            Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text('Cancel'),
                ),
                _posting
                    ? Center(child: CircularProgressIndicator())
                    : ElevatedButton(
                        onPressed: () {
                          setState(() {
                            _posting = true;
                          });
                          Provider.of<NotesProvider>(context, listen: false)
                              .postNote(comment, imgBytes, imageName)
                              .then((value) {
                            setState(() {
                              _posting = false;
                            });
                            Navigator.pop(context);
                          });
                        },
                        child: Text('Post'),
                      ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
