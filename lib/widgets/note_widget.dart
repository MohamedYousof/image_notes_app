import 'package:flutter/material.dart';

class NoteTile extends StatelessWidget {
  const NoteTile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Column(
        children: [
          NoteHeader(),
          Image.asset(
            'assets/pics/Bitmap.png',
            fit: BoxFit.fill,
            width: double.infinity,
          ),
          Padding(
            padding: const EdgeInsets.all(15),
            child: Text(
              'On the day after a review in The New York Times declared Outer space, in Brooklyn, '
              '“the restaurant of the summer,” the three chefs who collaborated on its union of '
              'Vietnamese and Cambodian cooking pulled out.',
              softWrap: true,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          )
        ],
      ),
    );
  }
}

class NoteHeader extends StatelessWidget {
  const NoteHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              CircleAvatar(
                backgroundColor: Colors.grey,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Text(
                  'Username',
                  overflow: TextOverflow.clip,
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
          Row(
            children: [
              IconButton(onPressed: () {}, icon: Icon(Icons.share)),
              IconButton(onPressed: () {}, icon: Icon(Icons.bookmark_border)),
              IconButton(onPressed: () {}, icon: Icon(Icons.favorite_border)),
            ],
          )
        ],
      ),
    );
  }
}
