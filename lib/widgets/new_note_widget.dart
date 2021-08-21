import 'package:flutter/material.dart';

class NotePopup extends StatelessWidget {
  const NotePopup({Key? key}) : super(key: key);

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
                  minWidth: double.infinity,
                ),
                color: Color(0xFFD8D8D8),
                child: IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.camera_alt_outlined,
                    size: 100,
                  ),
                ),
              ),
            ),
            Container(
              constraints: BoxConstraints(
                maxHeight: totalHeight * 0.3,
              ),
              child: TextField(
                maxLength: 120,
                maxLines: 3,
                decoration: InputDecoration(
                  hintText: 'Comment',
                  labelText: 'Type a comment for the image',
                  contentPadding: const EdgeInsets.only(right: 10),
                  fillColor: Colors.white,
                  filled: true,
                  // border: OutlineInputBorder(
                  //   borderRadius: BorderRadius.circular(4.0),
                  //   borderSide: BorderSide(color: Color(0xfff5f5f5), width: 1),
                  // ),
                ),
              ),
            ),
            Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                ElevatedButton(
                  onPressed: () {},
                  child: Text('Post'),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text('Cancel'),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
